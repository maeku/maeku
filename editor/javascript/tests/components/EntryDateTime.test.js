import React from 'react';
import renderer from 'react-test-renderer';
import EntryDateTime from '../../components/EntryDateTime.jsx';

test("the EntryDateTime component displays an entry's creation date", () => {
  const props = {
    datetime: {
      created: 'A million years ago',
      iso: {created: '2019-09-02T19:47:41.113Z'},
    },
  };

  const component = renderer
    .create(<EntryDateTime datetime={props.datetime} />)
    .toJSON();

  expect(component).toMatchSnapshot();
});
