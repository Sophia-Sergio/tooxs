import React, {Component} from 'react';

class Loader extends Component {
  render() {
    return (
      <div className="dashboard__loader">
        <i className="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>
        <span className="sr-only">Loading...</span>
      </div>
    );
  }
}

export default Loader;