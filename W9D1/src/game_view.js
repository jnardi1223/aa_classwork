const Game = require("./game");

function GameView(ctx) {
  this.ctx = ctx;
  this.game = new Game();
}

GameView.prototype.start = function() {
  let that = this;
  setInterval(function() {
    that.game.moveObjects();
    that.game.draw(that.ctx);
  }, 20);
}

module.exports = GameView;