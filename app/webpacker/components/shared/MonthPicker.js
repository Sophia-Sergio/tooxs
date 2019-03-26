import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import Icon from '../../images/icons/calendar-input.svg';

class MonthPicker extends Component {
  state = {
    currentDate: null,
    currentYear: null,
    currentMonth: null,
    years: [],
    months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    inputFocus: false,
    displayAlert: false,
    alertText: '',
    displayCalendar: false,
    currentMonth: this.props.maxMonth - 1,
    currentYear: this.props.maxYear,
    minYear: this.props.minYear,
    minMonth: this.props.minMonth - 1,
    maxYear: this.props.maxYear,
    maxMonth: this.props.maxMonth - 1,
  };

  componentWillMount() {
    this.createYears();
    document.addEventListener('mousedown', this.handleClickOutside, false);
  };

  componentWillUnmount() {
    document.addEventListener('mousedown', this.handleClickOutside, false);
  };

  componentDidMount() {
    this.props.onChange(this.state.currentYear, this.state.currentMonth);
  };

  range = (start, end) => {
    const length = end - start;
    return Array.from({ length }, (_, i) => start + i);
  }

  createYears = () => {
    this.setState({
      years: this.range(this.props.minYear, this.props.maxYear),
    });
  };

  onClickInput = e => {
    e.preventDefault();
    this.setState(prevState => ({
      inputFocus: !prevState.inputFocus, displayCalendar: !prevState.displayCalendar
    }));
  };

  handleClickOutside = e => {
    if(!ReactDOM.findDOMNode(this).contains(e.target)) {
      this.hideCalendar();
    }
  }

  changeYearPrev = e => {

    e.preventDefault();
    console.log(changedYear)
    console.log(this.state.currentYear)
    console.log(this.props.minYear)
    let changedYear = this.state.currentYear - 1;
    if (changedYear < this.props.minYear){
      this.setState({
        displayAlert: true,
        alertText: 'Año mínimo para comparar',
      });
      return;
    }
    if ( changedYear === this.props.minYear && this.state.currentMonth < this.props.minMonth ){
      this.setState({ currentMonth: this.state.minMonth });
    }
    this.setState({
      currentYear: changedYear,
      displayAlert: false,
      alertText: '',
    });
    this.props.onChange(changedYear, this.state.currentMonth);
  };

  changeYearNext = e => {
    e.preventDefault();
    let changedYear = this.state.currentYear + 1;
    if (changedYear > this.props.maxYear){
      this.setState({
        displayAlert: true,
        alertText: 'Año máximo para comparar',
      });
      return;
    }
    if ( changedYear === this.props.maxYear && this.state.currentMonth > this.props.maxMonth ){
      this.setState({ currentMonth: this.state.maxMonth });
    }
    this.setState({
      currentYear: changedYear,
      displayAlert: false,
      alertText: '',
    });
    this.props.onChange(changedYear, this.state.currentMonth);
  };

  changeMonth = (month, e) => {
    e.preventDefault();
    let year = this.state.currentYear;
    this.props.onChange(year, month);
    this.setState({ currentMonth: month });
    this.hideCalendar();
  };

  hideCalendar = () => {
    this.setState({
      inputFocus: false,
      displayCalendar: false,
      displayAlert: false,
      alertText: '',
    });
  };

  render() {
    const {
      currentMonth,
      currentYear,
      months,
      inputFocus,
      displayAlert,
      displayCalendar,
      alertText,
      minYear,
      minMonth,
      maxYear,
      maxMonth,
    } = this.state;

    let formattedMonth = currentMonth + 1;

    return (
      <div className="month-picker">
        <div
          className={"month-picker__input " + (inputFocus ? 'focus' : '')}
        >
          <span onClick={ this.onClickInput }>
            <div className="text">
              {`${formattedMonth < 10 ? '0' + formattedMonth : formattedMonth }/${currentYear}`}
            </div>
            <div className="icon">
              <img src={Icon} alt="Calendar icon" />
            </div>
          </span>
          { displayCalendar &&
            <div className="month-picker__calendar">
              <div className="month-picker__calendar__years">
                <button
                  className="month-picker__calendar__years__button"
                  type="button"
                  onClick={this.changeYearPrev.bind(this)}>
                  &lt;
                </button>
                <div className="month-picker__calendar__years__current">
                  { currentYear }
                </div>
                <button
                  className="month-picker__calendar__years__button"
                  type="button"
                  onClick={this.changeYearNext.bind(this)}
                >
                  &gt;
                </button>
              </div>
              { displayAlert &&
                <div className="month-picker__calendar__alert">
                  { alertText }
                </div>
              }
              <div className="month-picker__calendar__months">
                {months.map( (month, index) => (
                  <button
                    key={index}
                    className={"month-picker__calendar__months__button " + (currentMonth === index ? 'selected' : '')}
                    onClick={this.changeMonth.bind(this, index)}
                    disabled={((maxMonth < index) && (maxYear === currentYear)) || ((index < currentMonth) && (minYear === currentYear))}
                  >
                    {month}
                  </button>
                ))}
              </div>
            </div>
          }
        </div>
      </div>
    );
  }
}

MonthPicker.defaultProps = {
  minYear: new Date(2009, 0, 1).getFullYear(),
  minMonth: new Date(2009, 0, 1).getMonth() + 1,
  maxYear: new Date().getFullYear(),
  maxMonth: new Date().getMonth() + 1,
  onChange: (y, m) => { console.log({ year: y, month: m + 1 }); },
};

export default MonthPicker;
