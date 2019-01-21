import React, {Component} from 'react';

class Entry extends React.Component {
  render() {
    return (
      <article key={this.props.id} className="entry">
        <p>{this.props.content}</p>
      </article>
    );
  }
}

export default Entry;
