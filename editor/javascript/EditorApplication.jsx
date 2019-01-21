import {ApolloProvider} from 'react-apollo';

import Client from './configuration/apollo';

import React, {Component} from 'react';
import ReactDOM from 'react-dom';

import AuthorEntries from './components/queries/AuthorEntries';

class EditorApplication extends Component {
  render() {
    return (
      <ApolloProvider client={Client}>
        <AuthorEntries />
      </ApolloProvider>
    );
  }
}

export default EditorApplication;

ReactDOM.render(
  <EditorApplication />,
  document.querySelector('#editor-application'),
);
