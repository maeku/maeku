import React from "react";
import { Component } from "react";
import ReactDOM from "react-dom";

class EditorApplication extends Component{
  render() {
    return(<main> This will be the main application container.</main>);
  }
}

export default EditorApplication;

ReactDOM.render(<EditorApplication />, document.querySelector('#editor-application'));
