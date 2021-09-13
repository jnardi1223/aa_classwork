import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/Game';
import Tile from './components/Tile';


function Root(){ 
  return(
        <div className="root">
          <Game />
          <Tile />
        </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main);
});
