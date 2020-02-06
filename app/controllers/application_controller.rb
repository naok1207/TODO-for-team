require 'digest/md5'
class ApplicationController < ActionController::Base

    # digest_auth
    REALM = 'SecretZone'.freeze
    USERS = {'user1' => Digest:MD5.hexdigest(['user1', REALM, 'password'].join(':'))}.freeze
    before_action :authenticate

    # CSRF
    protect_from_forgery with: :exception

    private
        # digest_auth
        def authenticate
            authenticate_or/request/with_http_deigest(REALM) do |username|
                USERS[username]
            end
        end
end
