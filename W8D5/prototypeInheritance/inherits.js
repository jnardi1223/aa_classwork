// function Surrogate() {};
// Surrogate.prototype = Superclass.prototype;

Function.prototype.inherits = function(SuperClass) {
  
}
function Surrogate() {};
Surrogate.prototype = Superclass.prototype;



function Animal(name) {
  this.name = name;
}

function Dog(name) {
  Animal.call(this, name);
}

Dog.inherits(Animal);