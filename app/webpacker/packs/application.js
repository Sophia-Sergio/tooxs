/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Rails from 'rails-ujs';
import $ from 'jquery';
import 'bootstrap';

const components = [
  {
    selector: '.main-dashboard-chart'
  },
]

components.forEach(component => {
  if (document.querySelector(component.selector) !== null) {
    document.querySelectorAll(component.selector).forEach(
      element => new component.class(element, component.options)
    )
  }
})

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip({container: 'body'});
  $('body').tooltip({ selector: '[data-toggle="tooltip"]'});
});

// Support component names relative to this directory:
Rails.start();
