const readline = require("readline");
const { callbackify } = require("util");
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
    reader.question(`is ${el1} greater than ${el2}?`, answer => {
        if (answer === 'yes') {
            return callback(true); 
        } else { 
            return callback(false); 
        }
    })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

    if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
            if (isGreaterThan) {
                let temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
                madeAnySwaps = true;
            }
            innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop); 
        });
    } else if (i === arr.length - 1) {
        outerBubbleSortLoop(madeAnySwaps);
    }
}

function absurdBubbleSort(arr, sortCompletionCallback) { 
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps === true) {
            return innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            return sortCompletionCallback(arr);
        }
    }
    outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1, 7, 9, 5, 4, 1], function(arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
  });