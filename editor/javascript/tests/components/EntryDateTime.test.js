import React from 'react';
import ReactTestUtils from 'react-dom/test-utils';
import renderer from 'react-test-renderer';
import {configure, shallow} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({adapter: new Adapter()});

import EntryDateTime from '../../components/EntryDateTime.jsx';

describe('<EntryDateTime/>', () => {
  const props = {
    datetime: {
      created: 'A million years ago',
      iso: {created: '2019-09-02T19:47:41.113Z'},
    },
  };

  const entryDateTimeWrapper = shallow(
    <EntryDateTime datetime={props.datetime} />,
  );

  test('it displays the created date', () => {
    expect(entryDateTimeWrapper.text()).toEqual(props.datetime.created);
  });

  test('it has ISO datetime metadata', () => {
    expect(entryDateTimeWrapper.prop('dateTime')).toEqual(
      props.datetime.iso.created,
    );
  });
});
