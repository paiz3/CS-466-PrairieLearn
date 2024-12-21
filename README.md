## CS 466 PrairieLearn Repository

We have provided a solution for autogenerating and autograded sequence alignment questions. 

### Implementing it Online

Copy the following files to your PrairieLearn course and put them under the same folder. The `pl-dp-table` element and the autograder code are the core to this project. You may want to include the examples to see the interface before using it.

#### Element

`pl-dp-table` is located under `element`. Pleases see the README.md file in the folder for specification on the use of the element.

#### Autograder

Autograder folder `sequenceAlignment_autograder` is located under `serverFilesCourse`. Modify constants in `paired_HMM.py` to adjust the quality of output string pairs.

#### Example Assessment

Example assessment folder `sequenceAlignment` is located under `courseInstances/Fa2024/assessments/`.

#### Example Questions

Example questions folder `sequenceAlignment` is located under `quesitions`.

### Running on Local Machine

Please follow the instruction on [this webpage](https://prairielearn.readthedocs.io/en/latest/installingLocal/) to install and develop PrarieLearn course locally.
