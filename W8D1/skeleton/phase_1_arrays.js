Array.prototype.myUniq = function () { 
    let newArray = [];
    for (let i = 0; i < this.length; i ++) {
        if (newArray.indexOf(this[i]) === -1) {
            newArray.push(this[i]);
        }
    }
    return newArray;
}

arr1 = [1,2,2,3,3,3]
console.log(arr1.myUniq());

Array.prototype.twoSum = function () { 
    let newArray = [];