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

describe('an entry is selected and showing its EntryControls', () => {
  let entries;
  let firstEntry;
  let wrapper;

  beforeEach(() => {
    entries = someEntries();
    entries[0].active = true;
    wrapper = mount(<Entries entries={entries} />);
    firstEntry = wrapper.find('.entry').at(0);
  });

  test('the EntryControls are displayed', () => {
    expect(firstEntry.find('div.controls.enter-done'));
  });

  test('on click, EntryControls are hidden', () => {
    firstEntry.simulate('click');
    expect(firstEntry.find('div.controls.enter-done')).not;
  });

  test('when second entry is clicked, those EntryControls are shown instead', () => {
    const secondEntry = wrapper.find('.entry').at(1);
    secondEntry.simulate('click');
    expect(firstEntry.find('div.controls.enter-done')).not;
    expect(secondEntry.find('div.controls.enter-done'));
  });
});
