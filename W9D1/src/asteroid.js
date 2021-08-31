const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

const defaults = {COLOR: 'red', RADIUS: 10}; 

function Asteroid(object) {
    let options = {
      pos: object.pos, 
      game: object.game,
      color: defaults.COLOR, 
      radius: defaults.RADIUS, 
      vel: Utils.randomVec(5)}; 
    MovingObject.call(this, options);
}
Utils.inherits(Asteroid, MovingObject); 
module.exports = Asteroid;

//ParentClass.call(param1, param2)
