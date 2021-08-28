function curriedSum(numArgs) { 
    let numbers = []; 

    return function _curriedSum(num) { 
        numbers.push(num); 
        if (numbers.length === numArgs) {
            let total = 0; 
            numbers.forEach((n) => { 
                total += n; 
            }) 
            return total; 
        } else { 
            return _curriedSum; 
        }
        
    }  
    // return _curriedSum; 
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); 


Function.prototype.curry = function(numArgs, ctx) { 
    let args = []; 
    let fn = this; 
    
    function _curriedFn(arg) { 
        args.push(arg); 
        if (args.length === numArgs) { 
            // args.forEach((ele) => {
                return fn.apply(ctx, args); 
                // return fn(...args)
            // })
        } else { 
            return _curriedFn; 
        }
    }
    return _curriedFn; 

}

function multiply (...nums) {
    let total = 1;
    nums.forEach((n) => {total *= n})
    // console.log(this);
    return total;
    
}
function Cat(name) {
    this.name =name;
};
const cat1 = new Cat('fluppy');

let mult = multiply.curry(4)
console.log(mult(2)(3)(4)(5));
// console.log(multiply.curry(4, cat1)(2)(3)(4)(5));
