import React, {Component} from 'react';

import EntryTitle from './EntryTitle';
import EntryControls from './EntryControls';

class Entry extends React.Component {
  render() {
    return (
      <article onClick={this.props.onClick} className="entry">
        <EntryTitle title={this.props.title} />
        <p>{this.props.content}</p>
        {this.props.active && <EntryControls />}
      </article>
    );
  }
}

export default Entry;
