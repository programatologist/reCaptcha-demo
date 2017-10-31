require 'net/http'
class RecaptchaV2
  API_URL = "https://www.google.com/recaptcha/api/siteverify"
  SECRET_KEY = "6LdvvDYUAAAAALbtvn0EfqhL-ps6uFlAwP0BWZwH"

  def initialize(response)
    @params = {}
    @params[:response] = response
    @params[:secret] = SECRET_KEY
  end

  def verify!
    response = Net::HTTP.post_form(URI.parse(API_URL), @params)
    response_body = JSON.parse(response.body)
    response_body["success"]
  end
end
