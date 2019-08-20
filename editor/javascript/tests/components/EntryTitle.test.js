import React from 'react';
import renderer from 'react-test-renderer';
import EntryTitle from '../../components/EntryTitle.jsx';

test('the EntryTitle component displays en entry title', () => {
  const props = {
      title: "I walked for a while",
    }

  const component = renderer
    .create( <EntryTitle title={props.title} />)
    .toJSON();

  expect(component).toMatchSnapshot();
});
