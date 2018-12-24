/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Rails from 'rails-ujs';
import Chart from 'chart.js';
import 'bootstrap/dist/js/bootstrap';
import 'select2';
import Hello from '../src/javascript/hello';
import Select from '../src/javascript/filter';

console.log('Hello World from Tooxs App');

const components = [
  {
    class: Hello,
    selector: '.main-dashboard-chart'
  },
  {
    class: Select,
    selector: '.dashboard__filter-select'
  },
]

components.forEach(component => {
  if (document.querySelector(component.selector) !== null) {
    document.querySelectorAll(component.selector).forEach(
      element => new component.class(element, component.options)
    )
  }
})

// Support component names relative to this directory:
Rails.start();