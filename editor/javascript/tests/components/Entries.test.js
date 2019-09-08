import React from 'react';
import renderer from 'react-test-renderer';
import {configure, shallow, mount} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({adapter: new Adapter()});

import Entries from '../../components/Entries.jsx';

function someEntries() {
  return [
    {
      id: '1',
      title: 'I walked for a while',
      datetime: '2019-09-02T19:47:41.113Z',
      urls: {edit: '/entries/1/edit', view: '/entries/1'},
    },
    {
      id: '2',
      title: 'In my sleep',
      datetime: '2019-09-02T19:47:41.113Z',
      urls: {edit: '/entries/2/edit', view: '/entries/2'},
    },
  ];
}

function entriesWrapper() {
  return mount(<Entries entries={someEntries()} />);
}

test('the Entries component displays many entries', () => {
  const component = renderer
    .create(<Entries entries={someEntries()} />)
    .toJSON();
  expect(component).toMatchSnapshot();
});

test('when no Entry is clicked, no EntryControls are displayed', () => {
  const wrapper = entriesWrapper();
  expect(wrapper.find('.controls')).not;
});

test("when an Entry is clicked, only the active Entry's EntryControls are \
  displayed", () => {
  const wrapper = entriesWrapper();
  const firstEntry = wrapper.find('.entry').at(0);
  firstEntry.simulate('click');
  expect(wrapper.find('.controls')).toHaveLength(1);
});

test('when an Entry is clicked and then clicked again, no EntryControls are \
  displayed', () => {
  const wrapper = entriesWrapper();
  const firstEntry = wrapper.find('.entry').at(0);
  firstEntry.simulate('click');
  const entryControls = wrapper.find('.controls');
  firstEntry.simulate('click');
  expect(entryControls).not;
});

test('when two different Entry components are clicked, only the most recently \
  clicked Entry has its EntryControls displayed', () => {
  const wrapper = entriesWrapper();
  const firstEntry = wrapper.find('.entry').at(0);
  const secondEntry = wrapper.find('.entry').at(1);

  firstEntry.simulate('click');
  secondEntry.simulate('click');

  expect(firstEntry.find('.controls')).not;
  expect(secondEntry.find('.controls'));
});
