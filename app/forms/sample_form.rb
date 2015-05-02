module SampleForm
  def self.build(params = {})
    HungryForm::Form.new params: params do
      page :contacts, label: 'Contact details', title: 'Tell us about yourself' do
        text_field :first_name, required: true
        text_field :last_name, required: true
        text_field :email, required: true

        html :address, value: '<h3>Address</h3>'

        group :address_row1, wrapper_class: "row" do
          text_field :street_address, wrapper_class: "form-group col-xs-6"
          text_field :suburb, wrapper_class: "form-group col-xs-6"
        end
        group :address_row2, wrapper_class: "row" do
          select_field :state, wrapper_class: "form-group col-xs-6", prompt: "Select", options: { 
            :act => 'Australian Capital Territory',
            :nsw => 'New South Wales',
            :nt => 'Northern Territory',
            :qld => 'Queensland',
            :sa => 'South Australia',
            :tas => 'Tasmania',
            :vic => 'Victoria',
            :wa => 'Western Australia'
          }
          text_field :postcode, wrapper_class: "form-group col-xs-6"
        end

        text_area :comments
        checkbox_field :agree, label: "I would like to subscribe to your newsletter"
      end

      page :job_history do
        html :current, value: '<h3>Current job</h3>'
        text_field :job_title
        select_field :years, label: 'How long have you been working here?', prompt: "Select", options: {
          'l1' => 'Less than 1 year',
          '2' => '1 - 2 years',
          '5' => '2 - 5 years',
          'm5' => 'More than 5 years'
        }

        group :previous, dependency: { eq: [:job_history_years, 'l1'] } do
          html :current, value: '<h3>Previous job</h3>'
          text_field :job_title
        end
      end

      page :interests do
        text_area :interests, label: 'Tell us about your interests'
        select_field :age, options: { 
          18 => 'Less than 18', 
          30 => '18 - 30', 
          50 => '30 - 50', 
          '50+' => 'More than 50' 
        }
      end
    end
  end
end