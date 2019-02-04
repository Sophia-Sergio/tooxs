import React, { Component } from 'react';
import 'moment/locale/es';
import FullCalendar from 'fullcalendar-reactwrapper';

class DaysOff extends Component {
  state = {
    events: [
      {
        title: 'Turno 1 de 45 horas',
        start: '2018-12-31',
        textColor: 'white'
      },
      {
        title: 'Turno 1 de 45 horas',
        start: '2019-01-02'
      },
      {
        title: 'Turno 1 de 45 horas',
        start: '2019-01-03'
      },
      {
        title: 'Turno 1 de 45 horas',
        start: '2019-01-04'
      },
      {
        title: 'Conference',
        start: '2017-05-11',
        end: '2017-05-13'
      },
      {
        title: 'Meeting',
        start: '2017-05-12T10:30:00',
        end: '2017-05-12T12:30:00'
      },
      {
        title: 'Birthday Party',
        start: '2017-05-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2017-05-28'
      }
    ],		
  }
  render () {
    const { events } = this.state;
    return (
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
        events={events}
        eventColor="#47c4fe"
        firstDay="1"
      />
    );
  }
}

export default DaysOff;
