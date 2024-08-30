import random


def generate(data):

    bool_param = random.choice([1, 0])
    data["params"]["bool_param"] = bool_param
    data["params"]["bool_string"] = "True" if bool_param else "False"


def grade(data):

    # this will remove the badges for correct and incorrect next to each element
    data['partial_scores']['a1'] = {'score': None}
    data['partial_scores']['a2'] = {'score': None}
    data['partial_scores']['a3'] = {'score': None}

    # computes the correct answer based on the submitted answers
    st_sub = data["submitted_answers"]
    ans_map_1 = {'a': True,  'b': False}

    sub1 = ans_map_1[st_sub['a1']]
    sub2 = ans_map_1[st_sub['a3']]

    if st_sub['a2'] == 'a':
        correct_answer = sub1 and sub2
    else:
        correct_answer = sub1 or sub2

    # check if correct answer matches expected value
    if data["params"]["bool_param"] == correct_answer:
        data["score"] = 1
        comment = "The logical expression is " + data["params"]["bool_string"]
    else:
        data["score"] = 0
        comment = "The logical expression is not " + data["params"]["bool_string"]

    # stores comment to appear on submission panel
    data["feedback"]["comments"] = comment