require 'puppet/util/platform'

module Puppet::Util::Windows
  module ADSI
    class ADSIObject; end
    class User < ADSIObject; end
    class UserProfile; end
    class Group < ADSIObject; end
  end
  module File; end
  module Registry
  end
  module SID
    class Principal; end
  end
  class EventLog; end

  if Puppet::Util::Platform.windows?
    # Note: Setting codepage here globally ensures all strings returned via
    # WIN32OLE (Ruby's late-bound COM support) are encoded in Encoding::UTF_8
    #
    # Also, this does not modify the value of WIN32OLE.locale - which defaults
    # to 2048 (at least on US English Windows) and is not listed in the MS
    # locales table, here: https://msdn.microsoft.com/en-us/library/ms912047(v=winembedded.10).aspx
    require 'win32ole' ; WIN32OLE.codepage = WIN32OLE::CP_UTF8

    # these reference platform specific gems
    require 'puppet/ffi/windows'
    require 'puppet/util/windows/string'
    require 'puppet/util/windows/error'
    require 'puppet/util/windows/com'
    require 'puppet/util/windows/sid'
    require 'puppet/util/windows/principal'
    require 'puppet/util/windows/file'
    require 'puppet/util/windows/security'
    require 'puppet/util/windows/user'
    require 'puppet/util/windows/process'
    require 'puppet/util/windows/root_certs'
    require 'puppet/util/windows/access_control_entry'
    require 'puppet/util/windows/access_control_list'
    require 'puppet/util/windows/security_descriptor'
    require 'puppet/util/windows/adsi'
    require 'puppet/util/windows/registry'
    require 'puppet/util/windows/eventlog'
    require 'puppet/util/windows/service'
    require 'puppet/util/windows/monkey_patches/process'
  end
end
