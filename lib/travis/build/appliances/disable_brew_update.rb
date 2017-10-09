require 'travis/build/appliances/base'

module Travis
  module Build
    module Appliances
      class DisableBrewUpdate < Base
        def apply
          sh.cmd <<-EOF
if [ $(command -v sw_vers) ]; then
  echo "Disabling Homebrew auto update. If your Homebrew package requires Homebrew DB be up to date, please run \\`brew update\\` explicitly.", ansi: :yellow
  export 'HOMEBREW_NO_AUTO_UPDATE', '1', echo: true
fi
          EOF
        end
      end
    end
  end
end
