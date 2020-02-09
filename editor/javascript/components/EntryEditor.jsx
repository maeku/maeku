import React, {Component} from 'react';
import {UnControlled as CodeMirror} from 'react-codemirror2'

require('codemirror/mode/markdown/markdown.js')
require('codemirror/addon/display/panel.js')



class EntryEditor extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <CodeMirror
        value={this.props.entry.content}
        options={{
          mode: 'markdown',
          lineWrapping: true,
          theme: 'maeku-editor'
        }}
        onChange={(editor, data, value) => {}}
      />
    )


  }
}

export default EntryEditor
