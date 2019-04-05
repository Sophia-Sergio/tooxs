import React, { Component } from 'react';
import $ from "jquery";
import axios from 'axios';
import { monthFormat } from '../../helpers';
import 'moment/locale/es';
import FullCalendar from 'fullcalendar-reactwrapper';

class Schedule extends Component {
  constructor(props) {
    super(props);
    this.state = {
      events: [],
    }
  }

  componentDidMount = () => {
    this.getShifts();
  }

  getShifts = () => {
    const addMonths = (date, months) => {
      date.setMonth(date.getMonth() + months);
      return date;
    }
    const minDate = addMonths(new Date(), -6),
          maxDate = addMonths(new Date(), 3),
          minMonth = minDate.getMonth(),
          minYear = minDate.getFullYear(),
          maxMonth = maxDate.getMonth(),
          maxYear = maxDate.getFullYear();
    var parameters = `store=13&department=1&year_start=${minYear}&month_start=${minMonth}&year_end=${maxYear}&month_end=${maxMonth}`;
    axios.get(`${this.props.root_url}/api/v1/employees/${this.props.employee.id}/calendar_shift?${parameters}`)
      .then(res => {
        const dataShifts = res.data;
        const defaultStyles = {
          editable: false,
          className: 'schedule__item',
          textColor: 'white',
          borderColor: 'transparent',
        }
        const divideWorkHours = (date, hours) => {
          return hours ?
            { ...defaultStyles, title: hours, start: date, end: date, backgroundColor: '#353E4F' } :
            { ...defaultStyles, title: 'Libre', start: date, end: date, backgroundColor: '#89DA59' };
        };
        this.setState({
          events: res.data.map( data => ( divideWorkHours(data[0], data[1]) ) ),
        });
      })
      .catch(error => {
        console.log(error);
      });
  }

  render () {
    const { currentMonth, currentYear, shifts, events } = this.state;
    return (
      <div className="tab-pane fade show active" id="shifts" role="tabpanel" aria-labelledby="shifts-tab">
        <div className="tab-pane__content schedule">
          <FullCalendar
            locale="es"
            header={{
              left: 'title',
              center: '',
              right: 'prev,next'
            }}
            defaultDate={new Date()}
            navLinks={false} // can click day/week names to navigate views
            editable={true}
            eventLimit={true} // allow "more" link when too many events
            eventRender={(eObj, el) => {
              el.attr('data-toggle', 'tooltip');
              el.attr('data-placement', 'top');
              el.attr('data-trigger', 'hover click');
              el.attr('title', eObj.title);
            }}
            events={events}
            firstDay="1"
          />
        </div>
      </div>
    );
  }
}

export default Schedule;
