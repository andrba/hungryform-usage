HungryForm.configure do |config|
  config.text_field wrapper_class: "form-group", class: "form-control"
  config.select_field wrapper_class: "form-group", class: "form-control"
  config.text_area wrapper_class: "form-group", class: "form-control"

  config.rails.error_class = 'has-error'

  config.rails.prev_button_class = "btn btn-default"
  config.rails.next_button_class = "btn btn-primary"
  config.rails.submit_button_class = "btn btn-success"
end