const componentsDir = require.context('./components', true);
const ReactRailsUJS = require('react_ujs');

import React, {Component} from 'react';
import ReactDOM from 'react-dom';

import '../stylesheets/editor.scss';

ReactRailsUJS.useContext(componentsDir);
