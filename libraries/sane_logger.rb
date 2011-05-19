class Chef
  class Log
    # Processing... messages should go in the debug level
    def self.info(msg=nil, &block)
      if msg =~ /^Processing/
        debug(msg, &block)
      else
        super
      end
    end
  end
end