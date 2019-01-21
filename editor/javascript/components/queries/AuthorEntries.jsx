import React, {Component} from 'react';
import {Query} from 'react-apollo';

import gql from 'graphql-tag';

import Entries from '../Entries';

const AuthorEntriesQuery = gql`
  {
    currentAuthorEntries {
      id
      content
    }
  }
`;

const AuthorEntries = () => (
  <Query query={AuthorEntriesQuery}>
    {({loading, error, data}) => {
      if (loading) return `Loading...`;
      if (error) return `Error.`;

      const entriesData = data.currentAuthorEntries.map(entry => [
        entry.id,
        entry.content,
      ]);

      return <Entries entries={entriesData} />;
    }}
  </Query>
);

export default AuthorEntries;