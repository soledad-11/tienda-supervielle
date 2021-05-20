/// <reference types="Cypress" />

import { SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS } from "constants";
import { Given, When, Then } from "cypress-cucumber-preprocessor/steps";
import HomePage from '../pages/HomePage';
import MiCuentaPage from '../pages/MiCuentaPage';


Given(`el usuario ha navegado al sitio de Supervielle`, () => {
  const page = new HomePage();
  page.navigateToThisPage(60);
});

When(`el usuario ingresa datos válidos de email y contraseña y hace click en el botón "Iniciar sesión"`, () => {
  const page = new HomePage();
  page.loginWithValidData();
});

Then(`el usuario visualiza la página "Mi Cuenta"`, () => {
  const page = new MiCuentaPage();
  cy.url().should('include', page.getUrl());
  page.getTitle().should('contain', 'Mi cuenta');
});
