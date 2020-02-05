import React from 'react';
import renderer from 'react-test-renderer';
import {configure, shallow, mount} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({adapter: new Adapter()});

import EntryTitle from '../../components/EntryTitle.jsx';

describe('<EntryTitle/>', () => {
  const props = {
    title: 'A title',
  };

  const entryTitleWrapper = shallow(<EntryTitle title={props.title} />);

  test('it displays the title', () => {
    expect(entryTitleWrapper.text()).toEqual(props.title);
  });
});
