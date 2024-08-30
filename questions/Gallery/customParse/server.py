import base64
import pandas as pd
import io
import scipy as sp


def generate(data):

    filename = "lab_data.csv"
    data["params"]["filename"] = filename


def parse(data):

    # Read data from csv file
    files = data.get("submitted_answers", {}).get("_files", {})
    submitted_files = [f for f in files if f.get("name", "") == data["params"]["filename"]]
    if submitted_files and "contents" in submitted_files[0]:
        contents = str(base64.b64decode(submitted_files[0]["contents"]), "utf-8")
    else:
        contents = None

    # Get value from the file to compute the correct answer
    if contents is None:
        parse_error = 'Need to upload a file'
    else:
        df = pd.read_csv(io.StringIO(contents))
        parse_error = ''
        if 'torque' not in df.columns:
            parse_error += 'torque column does not exist. '
        if 'angular_velocity' not in df.columns:
            parse_error += 'angular_velocity column does not exist'
        if len(parse_error) < 1: 
            res = sp.stats.linregress(df['angular_velocity'], df['torque'])
            data["correct_answers"]["ans1"] = res[0]
            data["correct_answers"]["ans2"] = res[1]
        else:
            data["format_errors"][
                "_files"
            ] = parse_error