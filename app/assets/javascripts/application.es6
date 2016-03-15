// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//# require_tree .
//
//= require tether
//
//= require bootstrap/js/dist/util
//= require bootstrap/js/dist/alert
//= require bootstrap/js/dist/button
//= require bootstrap/js/dist/carousel
//= require bootstrap/js/dist/collapse
//= require bootstrap/js/dist/dropdown
//= require bootstrap/js/dist/modal
//= require bootstrap/js/dist/scrollspy
//= require bootstrap/js/dist/tab
//= require bootstrap/js/dist/tooltip
//= require bootstrap/js/dist/popover
//
//= require noUiSlider/distribute/nouislider.min

document.addEventListener("turbolinks:load", function() {
  $(".btn-group .btn [type=radio]:checked").parent().addClass('active')
})

update_disciplines_cards = function() {
  $(".b-discipline-checkbox").each(function(){
    index = this.dataset.index;
    if($(this).is(":checked")) {
      $(".b-discipline-card-" + index).removeClass('hidden');
    } else {
      $(".b-discipline-card-" + index).addClass('hidden');
    }
  });
}

document.addEventListener("turbolinks:load", () => {
  update_disciplines_cards();
});

$(document).on("click", ".b-discipline-checkbox", function(){
  update_disciplines_cards();
})

document.addEventListener("turbolinks:load", function() {
  $(".b-discipline-grade-input").each(function(){
    index = this.dataset.index
    slider = document.getElementsByClassName('b-discipline-grade-slider-' + index)[0];
    //input_field = $("#user_profile_users_disciplines_form_attributes_" + index + "_discipline_grade")

    noUiSlider.create(slider, {
      start: parseFloat(this.value),
      range: {
        'min': 0,
        'max': 100
      }
    });

    slider.noUiSlider.on('update', ( values, handle ) => {
      this.value = values[handle];
    });
  })
})
