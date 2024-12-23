## `pl-dp-table` element

A customizable DP table designed to handle both instructional materials (where answers are displayed directly) and interactive question components (where users can input answers).

### Element Attributes
| Attribute      | Description                                                             | Optional | Default Value    |
|----------------|-------------------------------------------------------------------------|----------|------------------|
| `answers-name` | Unique identifier for this DP table instance                            | ❌ (Required) |                  |
| `is-material`  | If true, displays a read-only DP table (informational only)             | ✅        | `False`          |
| `path-only`    | If true, students can only select the path and not edit DP cell values  | ✅        | `False`          |
| `type`         | Alignment type (`global` or `fitting`) that affects path constraints    | ✅        | `global`         |
| `placeholder`  | Placeholder text for DP cell inputs                                     | ✅        | `None`           |

### Element Functionality

- **Basic Functions:**
  For each cell, click upper half of the cell to enter number for the upper half. Use the highlighter button at the bottom of each cell to hightlight ONE path that represents the optimum alignment."

- **Material Mode (`is-material="true"`):**  
  Displays the fully computed DP table and path without user interaction.
  
- **Path-Only Mode (`path-only="true"`):**  
  Students only select which cells form the alignment path, but cannot edit numeric values.
  
- **Fully Editable Mode (default):**  
  Students fill all DP cells and select the path. Grading occurs only if all DP cells are correct, ensuring that the correct path can be validated afterward.

- **Clear All button:**
  Clear all inputs, both numeric values and path selection for this quesition. This button is only shown under fully editable mode (default).

- **Arrow Key Naviagtion:**
  Use arrow keys on the keyboard to quickly navigate among cells in the table.

## Example Usage
#### Sample Element 1
Answer question about the alignment using the given DP table.
![image](res/sequence_only.png)

**question.html**

```html
    <pl-dp-table answers-name="q1" is-material="true" type="global"></pl-dp-table>
```

#### Sample Element 2
Highlight the optimal path using the given scores.
![image](res/score.png)

**question.html**

```html
  <pl-dp-table answers-name="q2" path-only="true" type="fitting"></pl-dp-table>
```

#### Sample Element 3
Fill in the scores and highlight the optimal path.
![image](res/alignment.png)

**question.html**

```html
  <pl-dp-table answers-name="q3" type="local"></pl-dp-table>
```