import React from "react";
import Tile from "./Tile";

class Board extends React.Component {
    constructor(props){
        super(props);
    }
  render() {
    return (
      <div className="board">
          {this.props.board.map((row, idx1)=>(
             <div>row.map((tile, idx2)=>(
                 <Tile/>
                  ))</div>
                  )
              )}
      </div>
    );
  }
}

export default Board;
