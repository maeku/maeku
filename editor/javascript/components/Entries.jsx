import React, {Component} from 'react';
import PropTypes from 'prop-types';

import EntryCard from './EntryCard';

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

  deactivateEntry() {
    this.setState({activeEntryId: null});
  }

  render() {
    const activeEntryId = this.state.activeEntryId;
    const entries = this.props.entries.map(entry => (
      <EntryCard
        id={entry.id}
        key={entry.id}
        active={Object.is(entry.id, activeEntryId)}
        dateTime={entry.dateTime}
        deactivateEntry={this.deactivateEntry.bind(this)}
        toggleActivatedEntry={this.toggleActivatedEntry.bind(this, entry.id)}
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
