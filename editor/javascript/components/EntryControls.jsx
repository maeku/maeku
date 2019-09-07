import React, {Component} from 'react';

class EntryControls extends React.Component {
  render() {
    return (
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
    );
  }
}

export default EntryControls;
