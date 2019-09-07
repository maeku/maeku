import React, {Component} from 'react';

class EntryControls extends React.Component {
  render() {
    return (
      <div className="controls">
        <button className="control edit">
          <a href={this.props.urls.edit}>Edit</a>
        </button>
        <button className="control view">
          <a href={this.props.urls.show}>View</a>
        </button>
        <button className="control delete" onClick={this.props.ondelete}>
          Delete
        </button>
      </div>
    );
  }
}

export default EntryControls;
