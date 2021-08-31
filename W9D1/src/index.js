const GameView = require("./game_view.js");


window.addEventListener('DOMContentLoaded', () => {
  console.log('DOM fully loaded');
  let canvas = document.getElementById('game-canvas');
  let ctx = canvas.getContext("2d");
  ctx.fillStyle = "black";
  
  let view = new GameView(ctx);
  view.start();

});