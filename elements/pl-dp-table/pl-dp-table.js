// Highlight the cell when the button is clicked
function highlightCell(button) {    
    // Define the theme colors
    const lightGray = 'rgb(249, 250, 251)';  // '#f9fafb'
    const yellow = 'rgb(255, 235, 59)';  // '#ffeb3b'

    // Get the data-cell attribute from the clicked button
    const cellIdentifier = button.getAttribute('data-cell');
    // Find the parent <td> element that contains the input-container and button
    const cell_ = document.querySelector(`.input-container[data-cell="${cellIdentifier}"]`).closest('td');
    // Find the input field inside the same cell and change its background color
    const input = cell_.querySelector('input');
    // Use window.getComputedStyle to get the computed styles
    const computedStyle = window.getComputedStyle(input);
    // Retrieve the computed background color
    const backgroundColor = computedStyle.backgroundColor;
    
    // Toggle background color
    if (backgroundColor === yellow) {
        input.style.backgroundColor = lightGray;
        button.style.backgroundColor = lightGray;
    } else if (backgroundColor === lightGray) {
        input.style.backgroundColor = yellow;
        button.style.backgroundColor = yellow;
    } else {
        console.log('Error: input.style.backgroundColor is not defined');
        console.log(input.style.backgroundColor, typeof(input.style.backgroundColor));
    }
    // boolean value control
    const hiddenInput = cell_.querySelector('input[type="hidden"]');
    if (hiddenInput.value == 'true' || hiddenInput.value == 'True') {
        hiddenInput.value = false;
    } else if (hiddenInput.value == 'false' || hiddenInput.value == 'False') {
        hiddenInput.value = true;
    } else {
        console.log('Error: hiddenInput.value is not a boolean');
        console.log(hiddenInput.value, typeof(hiddenInput.value));
    }
}

document.addEventListener("DOMContentLoaded", () => {
    // Select all number input cells in the table
    const inputs = Array.from(document.querySelectorAll("input[type='number']"));

    // Sort inputs by their row and column indices for logical navigation
    const sortedInputs = inputs.sort((a, b) => {
        const rowA = parseInt(a.closest("td").dataset.row, 10);
        const rowB = parseInt(b.closest("td").dataset.row, 10);
        const colA = parseInt(a.closest("td").dataset.col, 10);
        const colB = parseInt(b.closest("td").dataset.col, 10);

        return rowA - rowB || colA - colB;
    });

    // Add keydown event listeners to all inputs
    sortedInputs.forEach((input, index) => {
        input.addEventListener("keydown", (event) => {
            let nextIndex = index;
            const currentCell = input.closest("td");
            const currentRow = parseInt(currentCell.dataset.row, 10);
            const currentCol = parseInt(currentCell.dataset.col, 10);

            switch (event.key) {
                case "ArrowUp": // Navigate up
                    event.preventDefault(); // Prevent number increment
                    nextIndex = sortedInputs.findIndex(
                        (inp) =>
                            parseInt(inp.closest("td").dataset.row, 10) === currentRow - 1 &&
                            parseInt(inp.closest("td").dataset.col, 10) === currentCol
                    );
                    break;
                case "ArrowDown": // Navigate down
                    event.preventDefault(); // Prevent number decrement
                    nextIndex = sortedInputs.findIndex(
                        (inp) =>
                            parseInt(inp.closest("td").dataset.row, 10) === currentRow + 1 &&
                            parseInt(inp.closest("td").dataset.col, 10) === currentCol
                    );
                    break;
                case "ArrowLeft": // Navigate left
                    nextIndex = index - 1;
                    break;
                case "ArrowRight": // Navigate right
                    nextIndex = index + 1;
                    break;
                default:
                    return; // Do nothing for other keys
            }

            // Ensure the nextIndex is within bounds and valid
            if (nextIndex >= 0 && nextIndex < sortedInputs.length) {
                sortedInputs[nextIndex].focus();
            }
        });
    });
});
