import React from 'react'; 

export const PokemonIndexItem = (props) => {
    return (
        <li className="pokemon-index-item">
            <span>{props.key}</span>
            <img src={props.imageUrl}/>
            <span> {props.name} </span>
        </li>
    )
}

  // <li className="pokemon-index-item">
        //   <span>{poke.id}</span>
        //   <img src={poke.imageUrl}/>
        //   <span>{poke.name}</span>
        // </li>