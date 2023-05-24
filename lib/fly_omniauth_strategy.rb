require 'omniauth-oauth2'

class Fly < OmniAuth::Strategies::OAuth2
  option :client_options, {
    :site => 'http://localhost:5001',
    :authorize_url => 'http://localhost:5001/oauth/authorize',
    :token_url => 'http://localhost:5001/oauth/token'
  }

  uid { raw_info['user_id'].to_s }

  info do
    {
        "email" => raw_info['email'],
        "organization_ids" => raw_info['organization_ids']
    }
  end

  def raw_info
    access_token.options[:mode] = :header
    @raw_info ||= access_token.get("/oauth/token/info").parsed
  end

end
