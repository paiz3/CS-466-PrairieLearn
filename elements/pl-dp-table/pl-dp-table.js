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
    
    // Toggle background
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
