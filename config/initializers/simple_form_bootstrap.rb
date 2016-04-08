# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'btn'
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'form-control-label'

    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' } # Don't use .b-error text-help here, since this will apply the error color which we dont want for the hint
  end

  config.wrappers :vertical_file_input, tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'form-control-label'

    b.use :input, class: 'form-control-file'
    b.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
  end

  config.wrappers :vertical_boolean, tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'checkbox' do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
  end

  config.wrappers :horizontal_btn_group_radion_and_checkboxes, item_wrapper_tag: nil, :item_label_class => 'btn btn-secondary', tag: 'div', class: 'form-group row', error_class: 'has-danger' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'col-sm-8 form-control-label'

    b.wrapper tag: 'div', class: 'col-sm-16' do |ba|
      ba.wrapper tag: 'div', html: {"data-toggle" => 'buttons'}, class: 'btn-group btn-group-justified' do |bb|
        bb.use :input
      end
      ba.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }, class: 'form-control-danger'
      ba.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
    end
  end

  config.wrappers :vertical_btn_group_radion_and_checkboxes, item_wrapper_tag: nil, :item_label_class => 'btn btn-secondary', tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'form-control-label'

    b.wrapper tag: 'div', html: {"data-toggle" => 'buttons'}, class: 'btn-group btn-group-justified' do |bb|
      bb.use :input
    end
    b.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }, class: 'form-control-danger'
    b.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
  end

  config.wrappers :horizontal_custom_file, tag: 'div', class: 'form-group row', error_class: 'has-danger' do |b|
    b.use :label, class: 'col-sm-8 form-control-label'
    b.wrapper tag: 'div', class: 'col-sm-16' do |ba|
      ba.wrapper tag: :label, class: 'custom-file' do |bb|
        bb.use :input, class: 'custom-file-input'
        bb.wrapper tag: :span, class: 'custom-file-control' do end
      end
    end
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'form-control-label'
    b.use :input
    b.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
  end

  config.wrappers :horizontal_form, tag: 'div', class: 'form-group row', error_class: 'has-danger' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'col-sm-8 form-control-label'

    b.wrapper tag: 'div', class: 'col-sm-16' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }, class: 'form-control-danger'
      ba.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
    end
  end

  config.wrappers :horizontal_file_input, tag: 'div', class: 'form-group row', error_class: 'has-danger' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'col-sm-8 form-control-label'

    b.wrapper tag: 'div', class: 'col-sm-16' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }, class: 'form-control-danger'
      ba.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
    end
  end

  config.wrappers :horizontal_boolean, tag: 'div', class: 'form-group row', error_class: 'has-danger' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'col-sm-offset-8 col-sm-16' do |wr|
      wr.wrapper tag: 'div', class: 'checkbox' do |ba|
        ba.use :label_input
      end

      wr.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }
      wr.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'form-group row', error_class: 'has-danger' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'col-sm-8 form-control-label'

    b.wrapper tag: 'div', class: 'col-sm-16' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }, class: 'form-control-danger'
      ba.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
    end
  end

  config.wrappers :inline_form, tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'sr-only'

    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
  end

  config.wrappers :multi_select, tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'form-control-label'
    b.wrapper tag: 'div', class: 'form-inline' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }, class: 'form-control-danger'
      ba.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
    end
  end

  config.wrappers :horizontal_multi_select, tag: 'div', class: 'form-group row', error_class: 'has-danger' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'col-sm-8 form-control-label'
    b.wrapper tag: 'div', class: 'col-sm-16 form-inline' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'p', class: 'b-error text-help' }, class: 'form-control-danger'
      ba.use :hint,  wrap_with: { tag: 'p', class: 'b-help text-muted' }
    end
  end

  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :vertical_form
  config.wrapper_mappings = {
    check_boxes: :vertical_radio_and_checkboxes,
    radio_buttons: :vertical_radio_and_checkboxes,
    file: :vertical_file_input,
    boolean: :vertical_boolean,
    datetime: :multi_select,
    date: :multi_select,
    time: :multi_select
  }
end
