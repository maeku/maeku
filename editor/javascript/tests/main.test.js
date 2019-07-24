import React from 'react';
import renderer from 'react-test-renderer';

jest.mock('../main.jsx', () => 'require.context');
import '../main.jsx';

test('Maeku imports React', () => {
  expect(React);
});
