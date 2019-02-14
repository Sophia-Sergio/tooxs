const { render } = ReactDOM,
      { Component } = React;

const months = [
  "Jan", "Feb", "Mar",
  "Apr", "May", "Jun",
  "Jul", "Aug", "Sep",
  "Oct", "Nov", "Dec" ];

const styles = {
  termInput: "termInput",
  active: "active",
  termInputControl: "termInputControl",
  selecting: "selecting",
  picker: "picker",
  pickerCaret: "pickerCaret",
  yearOneContext: "yearOneContext",
  yearTwoContext: "yearTwoContext",
  pickerControl: "pickerControl",
  isStartMonth: "isStartMonth",
  isEndMonth: "isEndMonth",
  pickerControlInner: "pickerControlInner",
  cellWithinRange: "cellWithinRange",
  selected: "selected"
}
const {
  termInput,
  active,
  termInputControl,
  selecting,
  picker,
  pickerCaret,
  yearOneContext,
  yearTwoContext,
  pickerControl,
  isStartMonth,
  isEndMonth,
  pickerControlInner,
  cellWithinRange,
  selected
} = styles;

function pad(pad, str, padLeft) {
  if (typeof str === "undefined") return pad;
  if (padLeft) return (pad + str).slice(-pad.length);
  else return (str + pad).substring(0, pad.length);
}
const dateToLocalMidnightDateTime = date=>(new Date((new Date(date)).setTime((new Date(date)).getTime() + (((new Date(date)).getTimezoneOffset() / 60)*60*60*1000))))

//Props:
 // - onChange (Function)
 // - startName (String)
 // - defaultStartValue (ISO Date)
 // - endName (String)
 // - defaultEndValue (ISO Date)
 // - dayOfMonth (Number)
class TermPicker extends Component {
  constructor(p,c) {
    super(p,c);
    const { defaultStartValue, defaultEndValue } = p,
          currentDate = new Date(),
          startDate = defaultStartValue?
            dateToLocalMidnightDateTime(defaultStartValue)
            :new Date(new Date(currentDate).setMonth(currentDate.getMonth() + 1)),
          endDate = defaultEndValue?
            dateToLocalMidnightDateTime(defaultEndValue)
            :new Date(new Date(currentDate).setMonth(currentDate.getMonth() + 12))

    // this._state = {};
    // Object.defineProperty(this, "state", {
    //   set: nextState=>{
    //     console.log("Setting state", nextState);
    //     this._state = nextState;
    //   },
    //   get: ()=>(this._state)
    // })
    this.state = {
      selectingStart: false,
      selectingEnd: false,
      yearContext: startDate.getFullYear(),
      startMonth: startDate.getMonth(),
      endMonth: endDate.getMonth(),
      startYear: startDate.getFullYear(),
      endYear: endDate.getFullYear(),
      startMonthCaretPosition: "66px",
      endMonthCaretPosition: "190px"
    }
    const { dayOfMonth=1 } = p;
    this.start = {_value: `${this.state.startYear}-${pad("00",this.state.startMonth + 1,true)}-${pad("00",dayOfMonth,true)}` }
    this.end = {_value: `${this.state.endYear}-${pad("00",this.state.endMonth + 1,true)}-${pad("00",dayOfMonth,true)}` }

    Object.defineProperty(this.start, "value", {
      set: nextValue=>{
        this.start._value = nextValue
        this.onChange("start")
      },
      get: ()=>(this.start._value)
    })
    Object.defineProperty(this.end, "value", {
      set: nextValue=>{
        this.end._value = nextValue
        this.onChange("end")
      },
      get: ()=>(this.end._value)
    })
  }

  render(){
    const {
            selectingStart, selectingEnd, yearContext,
            startMonth, endMonth, startYear, endYear,
            endMonthCaretPosition, startMonthCaretPosition
          } = this.state,
          picking = selectingStart || selectingEnd;

    const pickerMarkup = picking?
      <div className={picker}>
        <div style={{left:selectingEnd? endMonthCaretPosition : startMonthCaretPosition }} className={pickerCaret}></div>
        {
          [
            [[0,1,2],[3,4,5],[6,7,8],[9,10,11]],
            [[0,1,2],[3,4,5],[6,7,8],[9,10,11]]
          ].map((year,yearIndex)=>(
            <div key={yearIndex} className={yearIndex==0? yearOneContext:yearTwoContext}>
              <table>
                <thead>
                  <tr>
                    <th
                      width="15"
                       onClick={this.onSelectYear.bind(this,"decrement")}
                    >
                      {
                        yearIndex==0?
                        <svg viewBox="0 0 51.4 51.4"><path d="M31.4 45.8L15.3 29.7h36.1v-8H15.3L31.4 5.6 25.7 0 0 25.7l25.7 25.7"/></svg>
                        :null
                      }
                    </th>
                    <th width="70">{yearIndex == 0? yearContext : yearContext + 1}</th>
                    <th
                      width="15"
                       onClick={this.onSelectYear.bind(this,"increment")}
                    >
                      {
                        yearIndex==1?
                        <svg viewBox="0 0 51.4 51.4"><path d="M20 5.6l16.1 16.1H0v8h36.1L20 45.8l5.7 5.6 25.7-25.7L25.7 0"/></svg>
                        :null
                      }
                    </th>
                  </tr>
                </thead>
              </table>
              <table>
                <tbody>
                  {year.map((quarter,index)=>(
                    <tr key={index}>
                      {quarter.map((month,index)=>{
                        const currentYear = yearIndex == 0? yearContext : yearContext + 1,
                              pickerControlClassName = [pickerControl];
                        let tdClassName = null;
                        if (currentYear == startYear) {
                          if (month == startMonth) pickerControlClassName.push(selected, isStartMonth);
                          if (month > startMonth) tdClassName = [cellWithinRange]
                          if (currentYear == endYear && month >= endMonth) tdClassName = null;
                        }
                        if (currentYear == endYear) {
                          if (month == endMonth) pickerControlClassName.push(selected, isEndMonth);
                          if (month < endMonth) tdClassName = [cellWithinRange]
                          if (currentYear == startYear && month <= startMonth) tdClassName = null;
                        }
                        if (currentYear > startYear && currentYear < endYear) tdClassName = [cellWithinRange]

                        return(
                          <td className={tdClassName}>
                            <div
                              onClick={this.onSelectMonth.bind(this, month, currentYear, "click")}
                              onMouseEnter={this.onSelectMonth.bind(this, month, currentYear, "hover")}
                              className={pickerControlClassName.join(" ")}
                            >
                              <div className={pickerControlInner}>
                                {months[month]}
                              </div>
                            </div>
                          </td>
                        )
                      })}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          ))
        }
      </div>
      :null

    return(
      <div
        className={[
          termInput,
          selectingStart || selectingEnd? active:null
        ].join(" ")}
        tabIndex="-1"
        onBlur={()=>this.setState({ selectingStart: false, selectingEnd: false})}
      >
        <i className="fa fa-calendar"></i>
        &nbsp;
        <span
          className={[
            termInputControl,
            isStartMonth,
            selectingStart? selecting:null
          ].join(" ")}
          ref={ref=>this.startMonthControl=ref}
          onClick={()=>{
            this.setState({
              yearContext: startYear,
              selectingStart: true,
              selectingEnd: false
            })
          }}
        >
          {months[startMonth]} {startYear}
        </span>
        &nbsp;&mdash;&nbsp;
        <span
          className={[
            termInputControl,
            isEndMonth,
            selectingEnd? selecting:null
          ].join(" ")}
          ref={ref=>this.endMonthControl=ref}
          onClick={()=>{
            this.setState({
              yearContext: endYear == startYear? endYear : endYear - 1,
              selectingStart: false,
              selectingEnd: true
            })
          }}
        >
          {months[endMonth]} {endYear}
        </span>
        {pickerMarkup}
      </div>
    )
  }

  onSelectMonth(newMonth, newYear, eventType){
    let {
          selectingStart,
          startMonth,
          startYear,
          endMonth,
          endYear,
          yearContext
        } = this.state;

    if (selectingStart) {
      startMonth = newMonth;
      startYear = newYear;
      if (eventType == "click") {
        yearContext = newYear;
        // Since they are selecting the start month,
        // Go ahead and give them an end month that
        // is 11 months later
        endMonth = (startMonth + 11) % 12;
        endYear = endMonth == 11? startYear : startYear + 1;
      }
    }
    else {
      endMonth = newMonth;
      endYear = newYear;
    }
    let nextState = {
      ...this.state,
      startMonth,
      endMonth,
      startYear,
      endYear,
      yearContext
    }
    if (eventType == "click") {
      nextState = this.fixDates(nextState);
      if (selectingStart) {
        nextState.selectingStart = false;
        nextState.selectingEnd = true;
      }
    }
    this.setState({ ...nextState });
    if (eventType == "click") {
      this.set()
      if (!selectingStart)
        setTimeout(()=>this.setState({selectingStart:false,selectingEnd:false}),200)
    }
  }

  onSelectYear(direction) {
    const {
            yearContext:oldYear,
            selectingStart
          } = this.state,
          yearContext = direction == "increment"? oldYear + 1 : oldYear - 1;
    let { startYear, endYear } = this.state;
    if (selectingStart) { startYear = yearContext; }
    else { endYear = yearContext; }

    this.setState(this.fixDates({
      ...this.state,
      yearContext,
      startYear,
      endYear
    }))
    this.set()
  }

  fixDates({ selectingStart, selectingEnd, yearContext, startMonth, startYear, endMonth, endYear }) {
    if (selectingStart) {
      // Do not let the start year go past the end year
      if (startYear > endYear) {
        endYear++
      }
      // If they're now on the same year,
      // do not let the end month be before the start month
      if (startYear == endYear && startMonth >= endMonth) {
        endMonth = (startMonth + 1) % 12
        //If this puts the end month in January, increment the year 1 as well
        if (endMonth == 0) endYear++
      }
    }
    else {
      // Must be selecting end month
      // Do not let the end year go before the start year
      if (endYear < startYear) {
        startYear--
      }
      // If they're now on the same year,
      // do not let the start month be after the end month
      if (startYear == endYear && startMonth >= endMonth) {
        startMonth = (endMonth + 11) % 12
        //If this puts the start month in December, decrement the year 1 as well
        if (startMonth == 11) startYear--
      }
    }
    return { selectingStart, selectingEnd,
             yearContext, startMonth,
             startYear, endMonth,
             endYear }
  }

  onChange(field) {
    const {
      onChange:onChangeProp=false,
      startName="start",
      endName="end",
      dayOfMonth=1
    } = this.props;
    if (onChangeProp && typeof onChangeProp === "function") {
      const { start: { value:startValue }, end: { value:endValue } } = this;
      if (field == "start") onChangeProp({ target: { name:startName, value:startValue }})
      else onChangeProp({ target: { name:endName, value:endValue }})
    }
  }

  set(field="all") {
    const { startYear, startMonth, endYear, endMonth } = this.state,
          { dayOfMonth=1 } = this.props;
    if (field=="start" || field=="all") {
      this.start.value = `${startYear}-${pad("00",startMonth + 1,true)}-${pad("00",dayOfMonth,true)}`
    }
    if (field=="end" || field=="all") {
      this.start.value = `${endYear}-${pad("00",endMonth + 1,true)}-${pad("00",dayOfMonth,true)}`
    }
  }
}


render(
  <TermPicker onChange={(e)=>{ console.log(e.target.value); }} />,
  document.body
);
