import React, {Component} from 'react';

class EntryTitle extends React.Component {
  render() {
    return (
      <h1 className="title">{this.props.title}</h1>
    )
  }
}

export default EntryTitle;
