import React, {Component} from 'react';
import PropTypes from 'prop-types';

import Entry from './Entry';

class Entries extends React.Component {
  constructor(props) {
    super(props);
    this.state = {activeEntryId: null};
  }

  toggleActivatedEntry(entryId) {
    if (this.state.activeEntryId === entryId) {
      this.setState({activeEntryId: null});
    } else {
      this.setState({activeEntryId: entryId});
    }
  }

  render() {
    const activeEntryId = this.state.activeEntryId;
    const entries = this.props.entries.map(entry => (
      <Entry
        id={entry.id}
        key={entry.id}
        active={Object.is(entry.id, activeEntryId)}
        datetime={entry.datetime}
        onClick={this.toggleActivatedEntry.bind(this, entry.id)}
        title={entry.title}
        urls={entry.urls}
      />
    ));

    return <div className="entries">{entries}</div>;
  }
}

Entries.propTypes = {
  active: PropTypes.bool,
};

export default Entries;
