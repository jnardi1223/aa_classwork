const readline = require("readline");
const { callbackify } = require("util");
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum , numsLeft, completionCallback) {  
    if (numsLeft > 0) {
        reader.question("Give us a number!", number => { 
            sum += parseInt(number)
            console.log(sum)
            addNumbers(sum, numsLeft - 1, completionCallback)  
        })
    }
    else { 
        return completionCallback(sum) 
    }


}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));



