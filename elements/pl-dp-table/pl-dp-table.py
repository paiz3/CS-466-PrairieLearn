from typing import Any

import chevron
import lxml.html
import prairielearn as pl
from typing_extensions import assert_never

WEIGHT_DEFAULT = 1
CORRECT_ANSWER_DEFAULT = None
LABEL_DEFAULT = None
PLACEHOLDER_DEFAULT = None
IGNORE_CASE_DEFAULT = False
SIZE_DEFAULT = 35
SHOW_HELP_TEXT_DEFAULT = True
SHOW_SCORE_DEFAULT = True
CELL_VALUE_DEFAULT = "0"
CORRECT_ANSWER_DEFAULT = None

DP_TABLE_MUSTACHE_TEMPLATE_NAME = "pl-dp-table.mustache"


def prepare(element_html: str, data: pl.QuestionData) -> None:
    element = lxml.html.fragment_fromstring(element_html)
    required_attribs = ["answers-name"]
    optional_attribs = [
        "v",
        "w",
        "weight",
        "label",
        "display",
        "placeholder",
        "size",
        "show-help-text",
        "normalize-to-ascii",
        "show-score",
        "char-limit",
        "is-material",
    ]
    pl.check_attribs(element, required_attribs, optional_attribs)

    name = pl.get_string_attrib(element, "answers-name")
    pl.check_answers_names(data, name)

    v_string = "-" + data["params"].get("v")
    w_string = "-" + data["params"].get("w")
    num_rows = len(v_string)
    num_columns = len(w_string)

    # convert the correct answers to a dictionary of dictionaries
    if name in data["correct_answers"]:
        # split the string by newlines
        matrix, alignment, path = data["correct_answers"][name]
        # split each row by spaces
        for row_index in range(num_rows):
            for col_index in range(num_columns):
                data["correct_answers"][f"{name}_{row_index}_{col_index}"] = matrix[
                    row_index
                ][col_index]
                if [row_index, col_index] in path:
                    data["correct_answers"][f"{name}_{row_index}_{col_index}_p"] = True
        # reomve the original correct answers
        data["correct_answers"].pop(name)
    else:
        raise ValueError(f"Correct answers for {name} not found in data.")


def render(element_html: str, data: pl.QuestionData) -> str:
    element = lxml.html.fragment_fromstring(element_html)
    name = pl.get_string_attrib(element, "answers-name")
    label = pl.get_string_attrib(element, "label", LABEL_DEFAULT)
    # Determine if the question is material (informational) or requires input
    is_material = pl.get_boolean_attrib(
        element, "is-material", False
    )  # Default to False if not specified
    placeholder = pl.get_string_attrib(element, "placeholder", PLACEHOLDER_DEFAULT)
    show_score = pl.get_boolean_attrib(element, "show-score", SHOW_SCORE_DEFAULT)

    raw_submitted_answer = data["raw_submitted_answers"].get(name)

    parse_error = data["format_errors"].get(name)

    v_string = "-" + data["params"].get("v")
    w_string = "-" + data["params"].get("w")
    num_rows = len(v_string)
    num_columns = len(w_string)

    columns = [{"w_letter": w} for w in w_string]
    rows = []

    for i, v_letter in enumerate(v_string):
        row = {"v_letter": v_letter, "data": []}  # First column letter from w
        for j, w_letter in enumerate(w_string):
            row["data"].append(
                {
                    "col_index": j,
                    "row_index": i,
                    "value": data["submitted_answers"].get(f"{name}_{i}_{j}", CELL_VALUE_DEFAULT),
                    "boolean": data["submitted_answers"].get(
                        f"{name}_{i}_{j}_p", False
                    ),
                    "correct": False,
                    "incorrect": False,
                    "input_error": data["format_errors"].get(f"{name}_{i}_{j}", None),
                }
            )
        rows.append(row)

    correct_results = {}
    # when fixed table
    # for row_index in range(num_rows):
    #     for col_index in range(num_columns):
    #         answer_name = f"{name}_{row_index}_{col_index}"
    #         # Fetch the correct answer for each row and column combination
    #         correct_result = pl.from_json(data["correct_answers"].get(answer_name, DEFAULT_CORRECT_ANSWER))
    #         if row_index not in correct_results:
    #             correct_results[row_index] = []
    #         correct_results[row_index].append(correct_result)
    # # Now populate the correct results in rows
    # for row_index in range(num_rows):
    #     rows[row_index]["correct_results"] = correct_results[row_index]

    # Get template
    with open(DP_TABLE_MUSTACHE_TEMPLATE_NAME, "r", encoding="utf-8") as f:
        template = f.read()
    if data["panel"] == "question":
        editable = data["editable"]
        info_params = {"format": True}
        info = chevron.render(template, info_params).strip()
        show_help_text = pl.get_boolean_attrib(
            element, "show-help-text", SHOW_HELP_TEXT_DEFAULT
        )
        html_params = {
            "question": True,
            "name": name,
            "label": label,
            "editable": editable,
            "info": info,
            "placeholder": placeholder,
            "size": pl.get_integer_attrib(element, "size", SIZE_DEFAULT),
            "show_info": show_help_text,
            "uuid": pl.get_uuid(),
            "raw_submitted_answer": raw_submitted_answer,
            "parse_error": parse_error,
            "columns": columns,
            "rows": rows,
            "correct_results": correct_results,
            "is_material": is_material,
        }
        partial_score = data["partial_scores"].get(name, {"score": None})
        score = partial_score.get("score", None)
        if score is not None:
            try:
                score = float(score)
                if score >= 1:
                    html_params["correct"] = True
                elif score > 0:
                    html_params["partial"] = math.floor(score * 100)
                else:
                    html_params["incorrect"] = True
            except Exception:
                raise ValueError("invalid score" + score)
        for row_index in range(num_rows):
            for col_index in range(num_columns):
                answer_name = f"{name}_{row_index}_{col_index}_p"
                if parse_error is None and answer_name in data["submitted_answers"]:
                    b_sub = data["submitted_answers"].get(answer_name, None)
                    if b_sub is None:
                        raise Exception(
                            f"submitted answer boolean is None for {answer_name}"
                        )
                    if isinstance(b_sub, bool):
                        b_sub = b_sub
                    else:
                        if b_sub in ["true", "True", "1"]:
                            b_sub = True
                        elif b_sub in ["false", "False", "0"]:
                            b_sub = False
                        else:
                            raise Exception(
                                f"submitted answer boolean is not a boolean for {answer_name}"
                            )
                    rows[row_index]["data"][col_index]["boolean"] = b_sub

        return chevron.render(template, html_params).strip()

    elif data["panel"] == "submission":
        html_params = {
            "submission": True,
            "name": name,
            "label": label,
            "parse_error": parse_error,
            "uuid": pl.get_uuid(),
            "columns": columns,
            "rows": rows,
            # "correct_results": correct_results,
        }
        for row_index in range(num_rows):
            for col_index in range(num_columns):
                answer_name = f"{name}_{row_index}_{col_index}"
                if parse_error is None and answer_name in data["submitted_answers"]:
                    # Get the submitted answer for each cell
                    a_sub = data["submitted_answers"].get(answer_name, None)
                    if a_sub is None:
                        raise Exception(
                            f"submitted answer value is None for {answer_name}"
                        )
                    # Check if a_sub is a string before escaping
                    if isinstance(a_sub, str):
                        a_sub = pl.escape_unicode_string(a_sub)
                    else:
                        a_sub = str(
                            a_sub
                        )  # Convert non-string values to strings for rendering
                    rows[row_index]["data"][col_index]["value"] = a_sub

                    b_sub = data["submitted_answers"].get(
                        f"{name}_{row_index}_{col_index}_p", None
                    )
                    if b_sub is None:
                        raise Exception(
                            f"submitted answer boolean is None for {answer_name}"
                        )
                    if isinstance(b_sub, bool):
                        b_sub = b_sub
                    else:
                        if b_sub in ["true", "True", "1"]:
                            b_sub = True
                        elif b_sub in ["false", "False", "0"]:
                            b_sub = False
                        else:
                            raise Exception(
                                f"submitted answer boolean is not a boolean for {answer_name}"
                            )
                    rows[row_index]["data"][col_index]["boolean"] = b_sub
                else:
                    rows[row_index]["data"][col_index]["value"] = ""
                    rows[row_index]["data"][col_index]["boolean"] = False
                score = (
                    data["partial_scores"]
                    .get(answer_name, {"score": None})
                    .get("score", None)
                )
                if show_score and score is not None:
                    score_type, score_value = pl.determine_score_params(score)
                    html_params[score_type] = score_value
        html_params["error"] = html_params["parse_error"] or html_params.get(
            "missing_input", False
        )
        return chevron.render(template, html_params).strip()

    elif data["panel"] == "answer":
        html_params = {
            "answer": True,
            "name": name,
            "label": label,
            "columns": columns,
            "rows": rows,
            # "correct_results": correct_results,
        }
        for row_index in range(num_rows):
            for col_index in range(num_columns):
                answer_name = f"{name}_{row_index}_{col_index}"
                # Fetch the correct answer from the data
                correct_answer = pl.from_json(
                    data["correct_answers"].get(answer_name, None)
                )
                if correct_answer is None:
                    correct_answer = ""  # If no correct answer is found, leave it blank
                rows[row_index]["data"][col_index]["value"] = correct_answer

                path_name = f"{name}_{row_index}_{col_index}_p"
                # Fetch the correct answer from the data
                is_optimal = pl.from_json(data["correct_answers"].get(path_name, False))
                rows[row_index]["data"][col_index]["boolean"] = is_optimal
        return chevron.render(template, html_params).strip()
    assert_never(data["panel"])


def parse(element_html: str, data: pl.QuestionData) -> None:
    element = lxml.html.fragment_fromstring(element_html)
    name = pl.get_string_attrib(element, "answers-name")

    # Check if the question is marked as material (informational)
    is_material = pl.get_boolean_attrib(element, "is-material", False)

    # If it's material, skip grading
    if is_material:
        return

    w_string = "-" + data["params"].get("w")
    v_string = "-" + data["params"].get("v")
    num_rows = len(v_string)
    num_columns = len(w_string)

    for row_index in range(num_rows):
        for col_index in range(num_columns):
            answer_name = f"{name}_{row_index}_{col_index}"
            a_sub = data["submitted_answers"].get(answer_name, None)

            if a_sub is None:
                data["format_errors"][name] = "No submitted answer."
                data["submitted_answers"][answer_name] = None
            else:
                try:
                    # Attempt to convert the submitted answer to a float
                    a_sub = float(a_sub)
                    data["submitted_answers"][answer_name] = pl.to_json(a_sub)
                except ValueError:
                    data["format_errors"][
                        name
                    ] = "Invalid format. Please enter a valid number."
                    data["submitted_answers"][answer_name] = None
                    
            answer_name = f"{name}_{row_index}_{col_index}_p"
            a_sub = data["submitted_answers"].get(answer_name, None)
            if a_sub is None:
                data["format_errors"][name] = "No submitted answer."
                data["submitted_answers"][answer_name] = None
            else:
                if a_sub in ["true", "True", "1"]:
                    data["submitted_answers"][answer_name] = pl.to_json(True)
                elif a_sub in ["false", "False", "0"]:
                    data["submitted_answers"][answer_name] = pl.to_json(False)
                else:
                    data["format_errors"][
                        name
                    ] = "Invalid format. Not a boolean."
                    data["submitted_answers"][answer_name] = None


def grade(element_html: str, data: pl.QuestionData) -> None:
    element = lxml.html.fragment_fromstring(element_html)
    name = pl.get_string_attrib(element, "answers-name")

    # Check if the question is marked as material (informational)
    is_material = pl.get_boolean_attrib(element, "is-material", False)

    # If it's material, skip grading
    if is_material:
        return

    w_string = "-" + data["params"].get("w")
    v_string = "-" + data["params"].get("v")
    num_rows = len(v_string)
    num_columns = len(w_string)

    # Get weight
    weight = pl.get_integer_attrib(element, "weight", WEIGHT_DEFAULT)

    for row_index in range(num_rows):
        for col_index in range(num_columns):
            # cheking the value
            answer_name = f"{name}_{row_index}_{col_index}"
            a_tru = pl.from_json(data["correct_answers"].get(answer_name, None))
            if a_tru is None:
                break

            def grade_function(a_sub: Any) -> tuple[bool, None]:
                try:
                    # Convert both correct and submitted answers to float for comparison
                    a_sub = float(pl.from_json(a_sub))
                    return (
                        abs(a_sub - float(a_tru)) < 1e-9,
                        None,
                    )  # Allow for floating-point comparison tolerance
                except ValueError:
                    return False, None

            if answer_name in data["submitted_answers"]:
                pl.grade_answer_parameterized(
                    data, answer_name, grade_function, weight=weight
                )
            # cheking the path
            answer_name = f"{name}_{row_index}_{col_index}_p"
            b_tru = pl.from_json(data["correct_answers"].get(answer_name, False))
            if b_tru is None:
                break

            def grade_function_(b_sub: Any) -> tuple[bool, None]:
                try:
                    # Convert both correct and submitted answers to float for comparison
                    b_sub = pl.from_json(b_sub)
                    return (
                        b_sub == b_tru,
                        None,
                    )
                except ValueError:
                    return False, None

            if answer_name in data["submitted_answers"]:
                pl.grade_answer_parameterized(
                    data, answer_name, grade_function_, weight=weight
                )


def test(element_html: str, data: pl.ElementTestData) -> None:
    return
