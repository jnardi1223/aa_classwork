const View = require('./ttt-view.js'); 
window.view = View; 
const Game = require('../ttt_node/game.js'); 
window.Game = Game; 


document.addEventListener("DOMContentLoaded", () => {
  const gameView= document.getElementsByClassName('ttt');    
  const game = new Game(); 
  const view = new View(game, gameView); 
  //return view; 
});
