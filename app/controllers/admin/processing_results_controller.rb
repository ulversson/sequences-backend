require 'bash/runner'
class Admin::ProcessingResultsController < Admin::ApplicationController
  
    def index
      @processing_results = ProcessingResult.order("id DESC")
    end  

    def create
      @processing_result = bash_runner.call
      redirect_to admin_processing_results_path, notice: "Processing has started. Find processing results in the processing results section"
    end  
  
    def destroy
      @processing_result = ProcessingResult.find(params[:id])
      if @processing_result.destroy
        redirect_to admin_processing_results_path, notice: "Processing Results has been successfully deleted"
      else
        redirect_to admin_processing_results_path, error: "Processing Results to remove these results"
      end    
    end
    
    def show
      @processing_result = ProcessingResult.find(params[:id])
      render partial: "modal"
    end  
  
    private 
  
    def bash_runner
      Services::Bash::Runner.new(active_script_id, params[:id])
    end  

    def active_script_id
      ProcessingScript.active.first.id rescue 0
    end  


  
  
  end    