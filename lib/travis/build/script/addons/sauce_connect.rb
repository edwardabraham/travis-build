module Travis
  module Build
    class Script
      module Addons
        class SauceConnect
          def initialize(script, config)
            @script = script
            @config = config.respond_to?(:to_hash) ? config.to_hash : {}
          end

          def run
            if @config[:username]
              @script.set 'SAUCE_USERNAME', @config[:username], echo: false, assert: false
            end
            if @config[:access_key]
              @script.set 'SAUCE_ACCESS_KEY', @config[:access_key], echo: false, assert: false
            end

            info_echo = 'echo -e "\033[33;1mStarting Sauce Connect\033[0m"'
            command = "curl https://gist.github.com/santiycr/5139565/raw/sauce_connect_setup.sh | bash"
            command_echo = "echo \"#{command}\""

            @script.cmd "#{info_echo}; #{command_echo}; #{command}", assert: false, fold: 'sauce_connect', echo: false
            @script.set 'TRAVIS_SAUCE_CONNECT', 'true', echo: false, assert: false
          end
        end
      end
    end
  end
end
