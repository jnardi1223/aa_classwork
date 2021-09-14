import React from "react";
import Tile from "./Tile";

class Board extends React.Component {
    constructor(props){
        super(props);
      
        this.renderRows = this.renderRows.bind(this); 
        this.renderTiles = this.renderTiles.bind(this); 
    }

   

  renderRows() {
    const board = this.props.board.grid; //this gives us 2d Array 
    const rows = board.map((row, idx) => { //each subArray
      <div key={idx}>{this.renderTiles(row, idx)}</div>
    })
    return rows
  }

  renderTiles(row, idx) { 
    const board = this.props.board; 
    const tiles = row.map((tile, idx2) => {
      <Tile key={(idx * board.gridSize) + idx2}  update={this.props.updateGame} tile={tile} />
    })
    return tiles; 
  }
  
  render() {
    return (
      <div className="board">
        {this.renderRows()}
      </div>
    );
  }
}

export default Board;
