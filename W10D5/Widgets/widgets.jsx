import React from 'react';
import ReactDOM from 'react-dom';

function Root() { 
  return(
        <div>
          Its working
        </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main);
});
