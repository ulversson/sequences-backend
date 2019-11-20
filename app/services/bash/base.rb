module Services
  module Bash
    class Base 

      attr_reader :processing_script, :input_file, :processing_result

        def initialize(processing_script_id, processing_file_id)
          @processing_script = ProcessingScript.find(processing_script_id) 
          @input_file  = InputFile.find(processing_file_id)
          @processing_result = ProcessingResult.new
        end  

        private def script_output
          Rails.application.config.script_output_dir
        end    

    end
  end  
end      