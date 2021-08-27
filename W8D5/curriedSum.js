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

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); 


Function.prototype.curry = function(numArgs) { 
    let args = []; 
    let fn = this; 
    
    function _curriedFn(arg) { 
        args.push(arg); 
        if (args.length === numArgs) { 
            // args.forEach((ele) => {
                fn.apply(args); 
            // })
        } else { 
            return _curriedFn; 
        }
    }
    return _curriedFn; 

}