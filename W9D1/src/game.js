const Asteroid = require("./asteroid.js");

const DIM_X = 640;
const DIM_Y = 480;
const NUM_ASTEROIDS = 10;

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < NUM_ASTEROIDS; ++i) {
    let pos = this.randomPosition();
    this.asteroids.push(new Asteroid({pos: pos, game: this}));
  }
  
}

Game.prototype.randomPosition = function() {
  let xPos = Math.floor(Math.random() * DIM_X);
  let yPos = Math.floor(Math.random() * DIM_Y);
  return [xPos, yPos];
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, DIM_X, DIM_Y);
  this.asteroids.forEach(asteroid => {
    asteroid.draw(ctx);
  })
}

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(asteroid => {
    asteroid.move();
  })
}

Game.prototype.wrap = function(pos) {
  if (pos[0] <= 0) return [639, pos[1]];
  if (pos[1] <= 0) return [pos[0], 479];
  if (pos[0] >= 640) return [1, pos[1]];
  if (pos[1] >= 480) return [pos[0], 1];
  return pos;
}

module.exports = Game;