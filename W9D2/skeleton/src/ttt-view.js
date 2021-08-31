const Game = require('../ttt_node/game.js');
const Board = require('../ttt_node/board.js'); 

class View {
  constructor(game, el) {
    this.game = game; 
    this.el = el; 
  }

  setupBoard() {
    
    const board = document.createElement('ul'); 
    this.el.appendChild(board); 
      board.style.flex; 
      board.setAttribute('id', 'gameBoard'); 
      for (let i = 0; i < 9; i++) {
        let cell = document.createElement('li');
    }
    const cells = document.querySelectorAll('li'); 
      for (let i = 0; i < 9; i++) {
        cells[i].setAttribute('id', `${cells[i]}`); 
        board.appendChild(cells[i]); 
        //document.getElementById('gameBoard').appendChild(cells[i]); 
    }
  }
      
  bindEvents() { 

  }

  handleClick(e) { 

  }

  makeMove(square) { 

  }

}

module.exports = View;
