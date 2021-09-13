import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/Game.jsx'

function Root() { 
  return(
        <div className="root">
          <Game />
        </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main);
});
