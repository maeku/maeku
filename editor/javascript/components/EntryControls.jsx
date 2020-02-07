import React, {Component} from 'react';
import {CSSTransition} from 'react-transition-group';

class EntryControls extends React.Component {
  render() {
    const tabIndex = this.props.active ? 0 : -1;

    return (
      <CSSTransition in={this.props.active} timeout={500}>
        <div className="controls">
          <a
            role="button"
            tabIndex={tabIndex}
            className="control edit"
            href={this.props.urls.edit}>
            <span>Edit</span>
          </a>
          <a
            role="button"
            tabIndex={tabIndex}
            className="control view"
            href={this.props.urls.show}>
            <span>View</span>
          </a>
          <button
            role="button"
            className="control delete"
            onClick={this.props.ondelete}
            tabIndex={tabIndex}>
            <span>Delete</span>
          </button>
        </div>
      </CSSTransition>
    );
  }
}

export default EntryControls;
