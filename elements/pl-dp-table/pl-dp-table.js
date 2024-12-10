// Highlight the cell when the button is clicked
function highlightCell(button) {
    const lightGray = 'rgb(249, 250, 251)';  // '#f9fafb'
    const yellow = 'rgb(255, 235, 59)';      // '#ffeb3b'

    const cellIdentifier = button.getAttribute('data-cell');
    const cellElement = document.querySelector(`.input-container[data-cell="${cellIdentifier}"]`).closest('td');
    const input = cellElement.querySelector('input[type="number"]');
    const computedStyle = window.getComputedStyle(input);
    const backgroundColor = computedStyle.backgroundColor;

    if (backgroundColor === yellow) {
        input.style.backgroundColor = lightGray;
        button.style.backgroundColor = lightGray;
    } else if (backgroundColor === lightGray) {
        input.style.backgroundColor = yellow;
        button.style.backgroundColor = yellow;
    } else {
        console.log('Error: input.style.backgroundColor is not defined');
    }

    const hiddenInput = cellElement.querySelector('input[type="hidden"]');
    const val = hiddenInput.value.toLowerCase();
    if (val === 'true') {
        hiddenInput.value = false;
    } else if (val === 'false') {
        hiddenInput.value = true;
    } else {
        console.log('Error: hiddenInput.value is not a boolean', hiddenInput.value);
    }
}

document.addEventListener("DOMContentLoaded", () => {
    // For each table container, handle navigation and clearing
    document.querySelectorAll(".t-tbl-block").forEach((tableContainer) => {
        // Get all number inputs in this table
        const inputs = Array.from(tableContainer.querySelectorAll("input[type='number']"));

        // Sort inputs by row and column for logical navigation
        const sortedInputs = inputs.sort((a, b) => {
            const rowA = parseInt(a.closest("td").dataset.row, 10);
            const rowB = parseInt(b.closest("td").dataset.row, 10);
            const colA = parseInt(a.closest("td").dataset.col, 10);
            const colB = parseInt(b.closest("td").dataset.col, 10);
            return rowA - rowB || colA - colB;
        });

        // Add keydown event listeners to inputs in this table
        sortedInputs.forEach((input, index) => {
            input.addEventListener("keydown", (event) => {
                let nextIndex = index;
                const currentCell = input.closest("td");
                const currentRow = parseInt(currentCell.dataset.row, 10);
                const currentCol = parseInt(currentCell.dataset.col, 10);

                switch (event.key) {
                    case "ArrowUp": // Navigate up
                        event.preventDefault();
                        nextIndex = sortedInputs.findIndex(
                            (inp) =>
                                parseInt(inp.closest("td").dataset.row, 10) === currentRow - 1 &&
                                parseInt(inp.closest("td").dataset.col, 10) === currentCol
                        );
                        break;
                    case "ArrowDown": // Navigate down
                        event.preventDefault();
                        nextIndex = sortedInputs.findIndex(
                            (inp) =>
                                parseInt(inp.closest("td").dataset.row, 10) === currentRow + 1 &&
                                parseInt(inp.closest("td").dataset.col, 10) === currentCol
                        );
                        break;
                    case "ArrowLeft": // Navigate left
                        event.preventDefault();
                        nextIndex = index - 1;
                        break;
                    case "ArrowRight": // Navigate right
                        event.preventDefault();
                        nextIndex = index + 1;
                        break;
                    default:
                        return; // Do nothing for other keys
                }

                // Ensure nextIndex is valid and focus that input
                if (nextIndex >= 0 && nextIndex < sortedInputs.length) {
                    const nextInput = sortedInputs[nextIndex];
                    nextInput.focus();
                    nextInput.select();
                }
            });
        });

        // Attach event listener to the clear button within this table, if present
        const clearButton = tableContainer.querySelector(".clear-table");
        if (clearButton) {
            clearButton.addEventListener("click", (event) => {
                event.preventDefault();

                const numberInputs = tableContainer.querySelectorAll("input[type='number']");
                const boolInputs = tableContainer.querySelectorAll(".bool-input");

                numberInputs.forEach(input => {
                    input.value = 0;
                    input.style.backgroundColor = 'rgb(249, 250, 251)';
                });

                boolInputs.forEach(input => {
                    input.value = false;
                    const container = input.closest(".input-container");
                    if (container) {
                        const numberInput = container.querySelector("input[type='number']");
                        const button = container.querySelector("button");

                        if (numberInput) {
                            numberInput.style.backgroundColor = 'rgb(249, 250, 251)';
                        }

                        if (button) {
                            button.style.backgroundColor = 'rgb(249, 250, 251)';
                        }
                    }
                });
            });
        }
    });
});
