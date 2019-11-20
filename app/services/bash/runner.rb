require 'bash/base'

require 'bash/processor'
module Services
  module Bash
    class Runner < Services::Bash::Base
        
        def call
          processing_result.output, processing_result.std_err, processing_result.exit_code = bash_processor.call
          processing_result.file.attach(io: File.new(most_recent_file), filename: most_recent_file_name)
          processing_result.save(validate: false)  
          processing_result.processing_script = processing_script
          processing_result.input_file = input_file
          processing_result.save(validate: false)
          processing_result.id
        end    

        private def bash_processor
          Services::Bash::Processor.new(processing_script.id, input_file.id)
        end    

        private def most_recent_file
          Dir[script_output+"/*"].max_by {|f| File.mtime(f)}
        end    

        private def most_recent_file_name
          File.basename(most_recent_file)
        end  


    end  
  end  
end    