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
        key={entry.id}
        active={Object.is(entry.id, activeEntryId)}
        onClick={this.toggleActivatedEntry.bind(this, entry.id)}
        id={entry.id}
        title={entry.title}
        datetime={entry.datetime}
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
