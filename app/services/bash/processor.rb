require 'bash/base'
require 'open3'
module Services
  module Bash
    class Processor < Services::Bash::Base

      BASH_BINARY = `which bash`.strip

      def call
        Open3.capture3(command_to_run)
      end  
      
      private def command_to_run
        "#{BASH_BINARY} #{processing_script.file_on_disk} #{input_file.file_on_disk} #{script_output}"
      end  

    end  
  end  
end    