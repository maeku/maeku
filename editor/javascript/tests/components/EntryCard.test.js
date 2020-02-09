import React from 'react';
import renderer from 'react-test-renderer';
import {configure, shallow} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({adapter: new Adapter()});

import EntryCard from '../../components/EntryCard.jsx';

const props = {
  id: '1',
  title: 'I walked for a while',
  dateTime: {
    created: 'A million years ago',
    iso: {created: '2019-09-02T19:47:41.113Z'},
  },
  urls: {edit: '/entries/1/edit', show: '/entries/1'},
};

const entryWrapper = shallow(
  <EntryCard
    key={props.id}
    title={props.title}
    dateTime={props.dateTime}
    urls={props.urls}
  />,
);

test('when first rendered, an EntryCard does not display EntryControls', () => {
  expect(entryWrapper.find('.controls')).not;
});

test('when clicked, an EntryCard displays its EntryControls', () => {
  entryWrapper.simulate('click');
  expect(entryWrapper.find('.controls'));
});

test('when clicked and then clicked again, the EntryCard does not display its \
  EntryControls', () => {
  entryWrapper.simulate('click');
  entryWrapper.simulate('click');
  expect(entryWrapper.find('.controls')).not;
});
