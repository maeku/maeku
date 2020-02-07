import React, {Component} from 'react';

const EntryDateTime = ({dateTime}) => (
  <time className="created-at" dateTime={dateTime.iso.created}>
    {dateTime.created}
  </time>
);

export default EntryDateTime;
