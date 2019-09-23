import React from 'react';
import renderer from 'react-test-renderer';
import {configure, shallow} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({adapter: new Adapter()});

import Entry from '../../components/Entry.jsx';

const props = {
  id: '1',
  title: 'I walked for a while',
  datetime: {created: '2019-09-02T19:47:41.113Z'},
  urls: {edit: '/entries/1/edit', show: '/entries/1'},
};

const entryWrapper = shallow(
  <Entry
    key={props.id}
    title={props.title}
    datetime={props.datetime.created}
    urls={props.urls}
  />,
);

test('the Entry component displays one entry', () => {
  const component = renderer
    .create(
      <Entry
        key={props.id}
        title={props.title}
        datetime={props.datetime.created}
        urls={props.urls}
      />,
    )
    .toJSON();

  expect(component).toMatchSnapshot();
});

test('when first rendered, an Entry does not display EntryControls', () => {
  expect(entryWrapper.find('.controls')).not;
});

test('when clicked, an Entry displays its EntryControls', () => {
  entryWrapper.simulate('click');
  expect(entryWrapper.find('.controls'));
});

test('when clicked and then clicked again, the Entry does not display its \
  EntryControls', () => {
  entryWrapper.simulate('click');
  entryWrapper.simulate('click');
  expect(entryWrapper.find('.controls')).not;
});
