require 'multi_json'
require 'tweetstream/version'

module TweetStream
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring TweetStream.
    VALID_OPTIONS_KEYS = [
      :parser,
      :username,
      :password,
      :user_agent,
      :auth_method,
      :consumer_key,
      :consumer_secret,
      :oauth_token,
      :oauth_token_secret].freeze

    # The parser that will be used to connect if none is set
    DEFAULT_PARSER = MultiJson.default_engine

    # By default, don't set a username
    DEFAULT_USERNAME = nil

    # By default, don't set a password
    DEFAULT_PASSWORD = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "TweetStream Ruby Gem #{TweetStream::VERSION}".freeze

    # The default authentication method
    DEFAULT_AUTH_METHOD = :oauth

    VALID_FORMATS = [
      :basic,
      :oauth].freeze

    # By default, don't set an application key
    DEFAULT_CONSUMER_KEY = nil

    # By default, don't set an application secret
    DEFAULT_CONSUMER_SECRET = nil

    # By default, don't set a user oauth token
    DEFAULT_OAUTH_TOKEN = nil

    # By default, don't set a user oauth secret
    DEFAULT_OAUTH_TOKEN_SECRET = nil

    # Default time interval for use with on_interval
    DEFAULT_TIMER_INTERVAL = 30

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      Hash[*VALID_OPTIONS_KEYS.map {|key| [key, send(key)] }.flatten]
    end

    # Reset all configuration options to defaults
    def reset
      self.parser             = DEFAULT_PARSER
      self.username           = DEFAULT_USERNAME
      self.password           = DEFAULT_PASSWORD
      self.user_agent         = DEFAULT_USER_AGENT
      self.auth_method        = DEFAULT_AUTH_METHOD
      self.consumer_key       = DEFAULT_CONSUMER_KEY
      self.consumer_secret    = DEFAULT_CONSUMER_SECRET
      self.oauth_token        = DEFAULT_OAUTH_TOKEN
      self.oauth_token_secret = DEFAULT_OAUTH_TOKEN_SECRET
      self
    end
  end
end
