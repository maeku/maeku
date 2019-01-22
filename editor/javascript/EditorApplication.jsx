const componentsDir = require.context('./components', true);
const ReactRailsUJS = require('react_ujs');

import {ApolloProvider} from 'react-apollo';
import Client from './components/queries/config';

import React, {Component} from 'react';
import ReactDOM from 'react-dom';

import AuthorEntries from './components/queries/AuthorEntries';

ReactRailsUJS.useContext(componentsDir);

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
