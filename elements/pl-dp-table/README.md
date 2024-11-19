## `pl-dp-table` element

A customizable DP table designed to handle both instructional materials (where answers are displayed directly) and interactive question components (where users can input answers).

### Usage

Add this element to the question's HTML template and customize as desired. This can go anywhere in the question template, and it will render a truth table.

    ```html
    <pl-dp-table answers-name="q1"></pl-dp-table>
    ```

### Element Attributes

| Attribute | Type | Description |
|-----------|------|-------------|
| `answers-name` | string (required) | Name of the question. |
| `prefill` | string (default: `0`) | The value prefilled in input boxes. |
| `placeholder` | string (default: `0`) | The value placeholder shown in input boxes. |
| `is-material` | boolean (default: `false`) | Set it to `true` to use the DP table as a question material. |

### Developer Notes

In progress:

- Use arrow key to quickly navigating in the table.
- Allow path-only or score-only question toggles.
