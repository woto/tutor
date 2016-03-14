document.addEventListener("turbolinks:load", function() {
  $(".btn-group .btn [type=radio]:checked").parent().addClass('active')

  $(".r-discipline-grade-slider").each(function(index){
    input_field = $("#user_profile_users_disciplines_form_attributes_" + index + "_discipline_grade")
    console.log(parseFloat(input_field.val()));
    noUiSlider.create(this, {
      start: parseFloat(input_field.val()),
      range: {
        'min': 0,
        'max': 100
      }
    });

    this.noUiSlider.on('update', function( values, handle ) {
      console.log(this);
      input_field.val(values[handle]);
    });
  })

})
