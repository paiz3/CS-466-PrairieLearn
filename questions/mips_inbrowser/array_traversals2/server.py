import random
import os

OPTIONS = ["q01", "q02", "q03", "q04", "q05", 
           "q06", "q07", "q08", "q09", "q10",
           "q11", "q12", "q13", "q14", "q15"]

def read_question(data, option):
    with open(f'specs/{option}.txt', 'r') as file:
        data["params"]["code"] = file.read()

def generate(data):
    # metadata for the autograder
    data['params']['problem'] = 'mips_asm'  # name of function being run
    data['params']['numTests'] = 4          # number of tests to run
    data['params']['evilTests'] = False     # True: check for callee save (need main_evil_[].s ) False, do not check for callee save. 
    data['params']['regular_weight'] = 100  # percent weighting to give non-evil tests, if evilTests is false, make this 100
    correct = []                            # list of test case strings

    idx = random.randint(0, len(OPTIONS)-1) # pick a random question from OPTIONS
    read_question(data, OPTIONS[idx])

    arrays = [[0, 13, 3, -4], [1, 2, 3, 4, 5, 6, 7, 8, 9],[],[0, 0, 0, 0]]
    lengths = [4, 9, 0, 4]

    # Desired correct string to be produced by first test case
    # The main MIPS function should print something similar
    for ii in range(4):
        out_str = ''
        for jj in range(lengths[ii]):

            if OPTIONS[idx] == "q01":
                arrays[ii][jj] = 0
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q02":
                if jj % 2 == 0:
                    arrays[ii][jj] = 1
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q03":
                if jj % 2 == 0:
                    arrays[ii][jj] = jj
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q04":
                arrays[ii][jj] = jj - 2
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q05":
                arrays[ii][jj] = arrays[ii][jj] + 1
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q06":
                arrays[ii][jj] *= 10
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q07":
                arrays[ii][jj] = arrays[ii][jj] * arrays[ii][jj]
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q08":
                arrays[ii][jj] = 50 - arrays[ii][jj]
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q09":
                arrays[ii][jj] = 2 * arrays[ii][jj] + arrays[ii][jj]
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q10":
                arrays[ii][jj] = 8 * jj + arrays[ii][jj]
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q11":
                if jj % 2 == 0:
                    arrays[ii][jj] += 5
                out_str += str(arrays[ii][jj]) + ' '
            
            elif OPTIONS[idx] == "q12":
                arrays[ii][jj] = arrays[ii][jj] - jj
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q13":
                arrays[ii][jj] = (jj - 2) * arrays[ii][jj]
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q14":
                arrays[ii][jj] = jj * arrays[ii][jj]
                out_str += str(arrays[ii][jj]) + ' '

            elif OPTIONS[idx] == "q15":
                arrays[ii][jj] = 4 * (arrays[ii][jj] - jj)
                out_str += str(arrays[ii][jj]) + ' '
            
        correct.append(out_str)

    # correct is a list of test cases for the autograder, one test case per row
    data['params']['correct'] = correct
    data['params']['test0'] = correct[0]
    data['params']['test1'] = correct[1]

    return data
