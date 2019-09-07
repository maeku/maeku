import React from 'react';
import renderer from 'react-test-renderer';
import {configure, mount} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({adapter: new Adapter()});

import EntryControls from '../../components/EntryControls.jsx';

// Note: the contents of the URLs props are tested in the Rails EntryPresenter
// model that generates them.
function entryControlsWrapper() {
  const controls = (
    <EntryControls urls={{edit: '/entries/1/edit', show: '/entries/1'}} />
  );
  return mount(controls);
}

test('the EntryControls component a "show entry" button', () => {
  expect(entryControlsWrapper().find('.view'));
});

test('the EntryControls component has an "edit entry" button', () => {
  expect(entryControlsWrapper().find('.edit'));
});

test('the EntryControls component has a "delete entry" button', () => {
  expect(entryControlsWrapper().find('.delete'));
});
