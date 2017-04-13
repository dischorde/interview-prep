import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {};
    this.clockTick = this.clockTick.bind(this);
  }

  componentDidMount() {
    let day = new Date();
    let timeNow = day.toTimeString().split(' ')[0].split(':');

    this.setState({
      hrs: Number(timeNow[0]),
      min: Number(timeNow[1]),
      sec: Number(timeNow[2])
    });

    setInterval(this.clockTick, 1000);
  }

  clockTick() {
    let { hrs, min, sec } = this.state;
    sec += 1;
    if (sec >= 60) {
      min += 1;
      sec = 0;
    }
    if (min >= 60) {
      hrs += 1;
      min = 0;
    }
    if (hrs >= 24) {
      hrs = 0;
    }

    this.setState({
      hrs: hrs,
      min: min,
      sec: sec
    });
  }

  render() {
    let { hrs, min, sec } = this.state;

    const format = (num) => {
      return num < 10 ? `0${num}` : num;
    };

    return (
      <section>
        {format(hrs)} : {format(min)} : {format(sec)}
      </section>
  );
  }
}

export default Clock;
