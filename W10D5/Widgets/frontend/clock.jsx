import React from "react"; 

class Clock extends React.Component { 
    constructor(props){
        super(props)
        this.state = {
           date: new Date()
        }
    }

    render(){
        let hours = this.state.date.getHours();
        let minutes = this.state.date.getMinutes();
        let seconds = this.state.date.getSeconds();
        console.log (this.state);
        return(
            <div>
                <h1>{hours}:{minutes}:{seconds}</h1>
            </div>
        )
    }
}







export default Clock;