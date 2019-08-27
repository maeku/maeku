import React from 'react';
import renderer from 'react-test-renderer';
import Entries from '../../components/Entries.jsx';


const entries = [
  {
    id: '1',
    title: 'I walked for a while',
    content: 'I dozed off.',
  },
  {
    id: '2',
    title: 'In my sleep',
    content: 'I dreamed of you.',
  },
];

test("the Entries component displays many entries", () => {
  const component = renderer.create(<Entries entries={entries} />).toJSON();
  expect(component).toMatchSnapshot();
});
