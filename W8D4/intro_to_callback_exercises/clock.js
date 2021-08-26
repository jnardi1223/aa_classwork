class Clock {
    constructor () {
        let date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();
        this.printTime();
        // this._tick.bind(this);
        const selfTick = this._tick.bind(this)
        
        setInterval(function () {
            selfTick();
        }, 1000);
    }

    printTime () {
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    }

    _tick () {
        this.seconds += 1;
        if (this.seconds === 60) {
            this.minutes += 1;
            this.seconds = 0;
            if (this.minutes === 60) {
                this.hours += 1;
                this.minutes = 0;
                if (this.hours === 25) {
                    this.hours = 0;
                }
            }
        }
        
        this.printTime();
    }
}