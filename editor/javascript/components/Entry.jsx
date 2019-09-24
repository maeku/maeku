import React, {Component} from 'react';

import EntryControls from './EntryControls';
import EntryDateTime from './EntryDateTime';
import EntryTitle from './EntryTitle';

class Entry extends React.Component {
  constructor(props) {
    super(props);
    this.state = {displayed: true};
    this.disappearEntry = this.disappearEntry.bind(this);
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

  render() {
    return (
      this.state.displayed && (
        <article onClick={this.props.onClick} className="entry">
          <EntryTitle title={this.props.title} />
          <EntryDateTime datetime={this.props.datetime} />
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
