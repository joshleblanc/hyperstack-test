// Import all the modules
import React from 'react';
import ReactDOM from 'react-dom';
import * as Mui from '@material-ui/core';
import * as Yup from 'yup';
import * as Formik from 'formik';
import * as FormikMui from 'formik-material-ui';
import * as Notistack from 'notistack';

// for opal/hyperstack modules to find React and others they must explicitly be saved
// to the global space, otherwise webpack will encapsulate them locally here
global.React = React;
global.ReactDOM = ReactDOM;
global.Mui = Mui;
global.Formik = Formik;
global.Yup = Yup;
global.FormikMui = FormikMui;
global.Notistack = Notistack