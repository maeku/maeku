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
          <p>{this.props.content}</p>
          {this.props.active && (
            <EntryControls
              id={this.props.id}
              urls={this.props.urls}
              ondelete={this.disappearEntry}
            />
          )}
        </article>
      )
    );
  }
}

export default Entry;
