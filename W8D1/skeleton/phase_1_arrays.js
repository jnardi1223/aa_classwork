Array.prototype.myUniq = function () { 
    let newArray = [];
    for (let i = 0; i < this.length; i ++) {
        if (newArray.indexOf(this[i]) === -1) {
            newArray.push(this[i]);
        }
    }
    return newArray;
}

// arr1 = [1,2,2,3,3,3]
// console.log(arr1.myUniq());

Array.prototype.twoSum = function () { 
    let newArray = []; 
    for (let i = 0; i < this.length; i ++) {
        for (let j = 0; j < this.length; j ++) {
            if (this[i] + this[j] === 0 && i < j) {
                newArray.push([i, j]);
            }
        }
    }
    return newArray;
}

arr2 = [1,2,-2,3,3,-3]
console.log(arr2.twoSum());

Array.prototype.mytranspose = function () {
    let newArray = Array.from(
        { length: this[0].length }
        ()=> Array.from ({length: this.length})
        
    ); 

}



arr3 = [[1, 2], [3, 4], [5, 6]]
console.log(arr3.mytranspose());



let newArray = Array.from(
    { length: arr[0].length };
    () => Array.from ({length: arr.length}));