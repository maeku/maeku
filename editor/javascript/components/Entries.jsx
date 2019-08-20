import React, {Component} from 'react';

import Entry from './Entry';

class Entries extends React.Component {
  render() {
    const entries = this.props.entries.map(entry => (
      <Entry key={entry.id} title={entry.title} content={entry.content} />
    ));

    return <div className="entries">{entries}</div>;
  }
}

export default Entries;
