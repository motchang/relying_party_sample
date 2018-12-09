# frozen_string_literal: true

class SamlController < ApplicationController
  protect_from_forgery except: :consume
  skip_before_action :authenticate_user!

  def init
    req = OneLogin::RubySaml::Authrequest.new

    redirect_to(req.create(saml_settings))
  end

  def consume
    res          = OneLogin::RubySaml::Response.new(params[:SAMLResponse])
    res.settings = saml_settings

    # We validate the SAML Response and check if the user already exists in the system
    if res.is_valid?
      # authorize_success, log the user
      # session[:userid] = res.nameid
      # session[:attributes] = res.attributes

      sign_in(:user, User.find_or_create_by!(email: res.nameid))

      redirect_to root_url # or user_root_url
    else
      authorize_failure # This method shows an error message
    end
  end

  private

  def saml_settings
    settings = OneLogin::RubySaml::Settings.new

    settings.assertion_consumer_service_url = "http://#{request.host}:#{request.port}/saml/consume"
    settings.issuer                         = "http://#{request.host}:#{request.port}/"
    settings.idp_sso_target_url             = 'http://localhost:3000/saml/auth'
    settings.idp_cert_fingerprint           = '9E:65:2E:03:06:8D:80:F2:86:C7:6C:77:A1:D9:14:97:0A:4D:F4:4D'
    # settings.idp_cert_fingerprint_algorithm = "http://www.w3.org/2000/09/xmldsig#sha1"

    settings.name_identifier_format         = 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress'

    settings
  end
end
