import React from "react"; 

class Clock extends React.Component { 
    constructor(props){
        super(props)
        this.state = {
           date: new Date()
        }
    }

    tick() {
        this.setState({date: new Date()}, () => console.log(this.state));
        // console.log(this.state); 
    }

    componentDidMount() {
        setInterval(this.tick.bind(this), 1000); 
    }

    

    render(){
        let hours = this.state.date.getHours();
        let minutes = this.state.date.getMinutes();
        let seconds = this.state.date.getSeconds();
        // console.log (this.state);
        
        return(
            <div>
                <h1>{hours}:{minutes}:{seconds}</h1>
            </div>
        )
    }
    
}

export default Clock;