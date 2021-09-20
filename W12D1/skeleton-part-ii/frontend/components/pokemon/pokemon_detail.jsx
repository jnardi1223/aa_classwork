import React from 'react'; 
import { requestPokemon } from '../../actions/pokemon_actions';


class PokemonDetail extends React.Component {
    componentDidMount() {
        requestPokemon()
    }

    render() {
        return(

        )
    }
}
    

export default PokemonDetail; 