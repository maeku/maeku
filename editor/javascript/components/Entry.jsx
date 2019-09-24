import React, {Component} from 'react';

import EntryTitle from './EntryTitle';
import EntryControls from './EntryControls';

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
          <time
            dateTime={this.props.datetime.iso.created}
            className="created-at">
            {this.props.datetime.created}
          </time>
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
