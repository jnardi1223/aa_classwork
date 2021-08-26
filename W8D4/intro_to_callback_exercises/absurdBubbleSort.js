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

console.log(askIfGreaterThan(15, 24, number => {
    return number;
})); 

// function absurdBubbleSort(arr, sortCompletion) { 
//     let done = false 

//     while (!done) { 
//         done = true; 

//         for (let i = 0; i < arr.length; i++) { 
 
//         }
//     }
// }