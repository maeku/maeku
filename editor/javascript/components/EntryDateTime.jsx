import React, {Component} from 'react';

const EntryDateTime = ({datetime}) => (
  <time className="created-at" dateTime={datetime.iso.created}>
    {datetime.created}
  </time>
);

export default EntryDateTime;
