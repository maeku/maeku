import React from 'react';
import renderer from 'react-test-renderer';
import {configure, shallow} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({adapter: new Adapter()});

import Entry from '../../components/Entry.jsx';

const props = {
  id: '1',
  title: 'I walked for a while',
  content: 'I dozed off.',
};

const entryWrapper = shallow(
  <Entry key={props.id} title={props.title} content={props.content} />,
);

test('the Entry component displays one entry', () => {
  const component = renderer
    .create(
      <Entry key={props.id} title={props.title} content={props.content} />,
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
