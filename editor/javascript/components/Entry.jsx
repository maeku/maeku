import React, {Component} from 'react';

import EntryControls from './EntryControls';
import EntryDateTime from './EntryDateTime';
import EntryTitle from './EntryTitle';

class Entry extends React.Component {
  constructor(props) {
    super(props);
    this.entry = React.createRef();
    this.state = {active: null, displayed: true};
    this.disappearEntry = this.disappearEntry.bind(this);
    this.forceCloseInactiveEntry = this.forceCloseInactiveEntry.bind(this);
  }

  deleteEntry() {
    const url = this.props.urls.show;
    return fetch(url, {
      method: 'DELETE',
    });
  }

  disappearEntry() {
    this.deleteEntry();
    this.setState({displayed: !this.state.displayed});
  }

  forceCloseInactiveEntry() {
    if (this.entry.current.contains(document.activeElement)) {
    } else this.props.deactivateEntry;
  }

  render() {
    return (
      this.state.displayed && (
        <article
          className="entry"
          onBlur={this.forceCloseInactiveEntry}
          onClick={this.props.toggleActivatedEntry}
          onKeyPress={this.props.toggleActivatedEntry}
          ref={this.entry}
          tabIndex="0">
          <EntryTitle title={this.props.title} />
          <EntryDateTime dateTime={this.props.dateTime} />
          <EntryControls
            id={this.props.id}
            active={this.props.active}
            ondelete={this.disappearEntry}
            urls={this.props.urls}
          />
        </article>
      )
    );
  }
}

export default Entry;
