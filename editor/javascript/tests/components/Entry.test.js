import React from 'react';
import renderer from 'react-test-renderer';
import Entry from '../../components/Entry.jsx';

test('the Entry component displays one entry', () => {
  const props = {
      id: "1",
      title: "I walked for a while",
      content: "I dozed off."
    }

  const component = renderer
    .create( <Entry key={props.id} title={props.title} content={props.content} />)
    .toJSON();

  expect(component).toMatchSnapshot();
});
