# import base64

# def parse(data):
#     default_file_contents = ' ' # <-- this space is important, otherwise PL will think there is no file
#     default_file_contents_b64 = base64.b64encode(default_file_contents.encode('utf-8')).decode('utf-8')

#     if '_files' in data['format_errors']:
#         del data['format_errors']['_files']
#         data['submitted_answers']['_files'] = [{
#             'name': 'open.md',
#             'contents': default_file_contents_b64
#         }]


def grade(data):

    data["score"] = 1
    data['partial_scores']['q1'] = {'score': None}
    data['partial_scores']['q2'] = {'score': None}
    data['partial_scores']['q3'] = {'score': None}
    data['partial_scores']['q4'] = {'score': None}
    data['partial_scores']['q5'] = {'score': None}
    data['partial_scores']['q6'] = {'score': None}
    data['partial_scores']['q7'] = {'score': None}
    data['partial_scores']['q8'] = {'score': None}
    data['partial_scores']['q9'] = {'score': None}