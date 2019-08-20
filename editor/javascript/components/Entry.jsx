import React, {Component} from 'react';

import EntryTitle from './EntryTitle';

class Entry extends React.Component {
  render() {
    return (
      <article key={this.props.id} className="entry">
        <EntryTitle title={this.props.title}/>
        <p>{this.props.content}</p>
      </article>
    );
  }
}

export default Entry;
