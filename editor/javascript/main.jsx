const componentsDir = require.context('./components', true);
const ReactRailsUJS = require('react_ujs');

import React, {Component} from 'react';
import ReactDOM from 'react-dom';

ReactRailsUJS.useContext(componentsDir);
