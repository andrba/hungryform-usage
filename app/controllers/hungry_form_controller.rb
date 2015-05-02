class HungryFormController < ApplicationController
  before_action :set_form, except: :submitted

  def show
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
      redirect_to hungry_form_path(@form.prev_page)
    when /submit/
      if @form.valid?
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
    @form = SampleForm.build(params)
  end

  def save_form
  end
end
