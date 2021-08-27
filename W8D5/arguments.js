// function sum(...nums) { 
//     let total = 0; 
//     for (let i = 0; i < nums.length; i++) { 
//         total += nums[i]; 
//     }
//     return total; 
// }; 

// console.log(sum(1, 2, 3, 4)); 


// sum(1, 2, 3, 4) === 10;
// sum(1, 2, 3, 4, 5) === 15;

class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }
  
  const markov = new Cat("Markov");
  const pavlov = new Dog("Pavlov");

 
//   Function.prototype.myBind = function(ctx, ...bindargs) { 
//       return (...callargs) => { 
//       return this.apply(ctx, bindargs.concat(callargs)); 
//       }
//   }

  Function.prototype.myBind = function(ctx, ...bindargs) { 
    let that = this; 
    return function () { 
        return that.apply(ctx, bindargs); 
    }
  }




  console.log(markov.says("meow", "Ned"));
  // Markov says meow to Ned!
  // true
  
  // bind time args are "meow" and "Kush", no call time args
  console.log(markov.says.myBind(pavlov, "meow", "Kush")());

  // Pavlov says meow to Kush!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "a tree"
  conosle.log(markov.says.myBind(pavlov)("meow", "a tree"));
  // Pavlov says meow to a tree!
  // true
  
  // bind time arg is "meow", call time arg is "Markov"
  conosol.log(markov.says.myBind(pavlov, "meow")("Markov"));
  // Pavlov says meow to Markov!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "me"
  const notMarkovSays = markov.says.myBind(pavlov);
  console.log(notMarkovSays("meow", "me"));
  // Pavlov says meow to me!
  // true
  