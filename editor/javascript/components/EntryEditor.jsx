import React, {Component} from 'react';
import {UnControlled as CodeMirror} from 'react-codemirror2'

require('codemirror/mode/markdown/markdown.js')
require('codemirror/addon/display/panel.js')

class EntryEditor extends React.Component {
  constructor(props) {
    super(props)
    this.state = { value: props.entry.content };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateEntry = this.updateEntry.bind(this);
  }

  updateEntry() {
    const url = this.props.entry.urls.show;

    fetch(url, {
      method: 'PATCH',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json;charset=utf-8'
      },
      body: JSON.stringify({
        'entry': {
          'entry_content_attributes': {
            'content': this.state.value
          }
        }
      })
    })
      .then(response => response.json())
      .then((result) => this.handleSuccess())
      .catch((error) => console.error(error))
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.updateEntry();
  }

  handleSuccess() {
    console.log('nice');
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input type='text' value={this.state.value} onChange={this.handleChange}/>
        <input type='submit' value='Submit' />
      </form>
    )
  }
}

export default EntryEditor;
