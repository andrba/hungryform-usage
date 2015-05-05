class HungryFormController < ApplicationController
  before_action :set_form, except: :submitted

  def show
    @form.validate if params[:errors]
  end

  def update
    case params[:form_action]
    when /next/
      if @form.current_page.valid?
        save_form
        redirect_to hungry_form_path(@form.next_page) 
      else
        render :show
      end
    when /prev/
      save_form
      redirect_to hungry_form_path(@form.prev_page)
    when /submit/
      if @form.valid?
        save_form
        redirect_to hungry_form_submitted_path
      else
        redirect_to hungry_form_path(@form.pages.find(&:invalid?), errors: true)
      end
    end
  end

  def submitted
  end

  private

  # Build a HungryForm::Form instance
  # See app/forms/sample_form.rb for definition
  def set_form
    @form = SampleForm.build(params.merge(get_form))
  end

  # A form can be stored anywhere as a hash
  # For a sake of simplicity the form
  # is stored in cookies
  def save_form
    cookies[:form] = JSON.generate @form.values
  end

  def get_form
    cookies[:form] ? JSON.parse(cookies[:form]) : {}
  end
end
