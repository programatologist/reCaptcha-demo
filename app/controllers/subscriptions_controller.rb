class SubscriptionsController < ApplicationController

  def show
  end

  def subscribe
    email = params[:email]
    recaptcha = RecaptchaV2.new(params["g-recaptcha-response"])

    if email.present?
      if recaptcha.verify!
        @message = "Subscribed #{email}"
      else
        @message = "Captcha Verification Failed"
      end
    else
      @message = "No email provied"
    end
    render :show
  end

end
