import React, {Component} from 'react';
import {CSSTransition} from 'react-transition-group';

class EntryControls extends React.Component {
  render() {
    return (
      <CSSTransition appear={true} in={this.props.active} timeout={500}>
        <div className="controls">
          <a className="control edit" href={this.props.urls.edit}>
            <span>Edit</span>
          </a>
          <a className="control view" href={this.props.urls.show}>
            <span>View</span>
          </a>
          <button className="control delete" onClick={this.props.ondelete}>
            <span>Delete</span>
          </button>
        </div>
      </CSSTransition>
    );
  }
}

export default EntryControls;
