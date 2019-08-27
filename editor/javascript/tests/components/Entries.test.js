import React from 'react';
import renderer from 'react-test-renderer';
import {configure, shallow, mount} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({adapter: new Adapter()});

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

const entriesWrapper = mount(<Entries entries={entries} />);

test('the Entries component displays many entries', () => {
  const component = renderer.create(<Entries entries={entries} />).toJSON();
  expect(component).toMatchSnapshot();
});

test('when no Entry is clicked, no EntryControls are displayed', () => {
  expect(!entriesWrapper.find('.controls'));
});

test("when an Entry is clicked, only the active Entry's EntryControls are \
  displayed", () => {
  const firstEntry = entriesWrapper.find('.entry').at(0);
  firstEntry.simulate('click');
  expect(entriesWrapper.find('.controls')).toHaveLength(1);
});

test('when an Entry is clicked and then clicked again, no EntryControls are \
  displayed', () => {
  const firstEntry = entriesWrapper.find('.entry').at(0);
  firstEntry.simulate('click');
  const entryControls = entriesWrapper.find('.controls');
  firstEntry.simulate('click');
  expect(entryControls).not;
});

test('when two different Entry components are clicked, only the most recently \
  clicked Entry has its EntryControls displayed', () => {
  const firstEntry = entriesWrapper.find('.entry').at(0);
  const secondEntry = entriesWrapper.find('.entry').at(1);
  firstEntry.simulate('click');
  secondEntry.simulate('click');
  expect(secondEntry.find('.controls'));
  expect(firstEntry.find('.controls')).not;
});
