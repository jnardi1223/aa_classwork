import {Route, Switch} from "react-router-dom";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import PokemonDetail from "./pokemon/pokemon_detail"
import React from 'react';

const App = () =>  (
    <Switch>
        <Route path="/pokemon/:pokemonId" component={PokemonDetail}/>
        <Route path="/" component={PokemonIndexContainer}/>
    </Switch>
    
)

export default App