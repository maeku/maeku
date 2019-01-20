import {ApolloProvider} from 'react-apollo';

import Client from './configuration/apollo';

import React, {Component} from 'react';
import ReactDOM from 'react-dom';

class EditorApplication extends Component {
  render() {
    return (
      <ApolloProvider client={Client}>
        <main>This will be the main application container.</main>
      </ApolloProvider>
    );
  }
}

export default EditorApplication;

ReactDOM.render(
  <EditorApplication />,
  document.querySelector('#editor-application'),
);
