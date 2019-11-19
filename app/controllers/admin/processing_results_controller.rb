class Admin::ProcessingResultsController < Admin::ApplicationController
  
    def index
      @processing_results = ProcessingResult.order("id DESC")
    end  
  
    def new
      @processing_result = ProcessingResult.new
    end  
  
    def create
      @processing_result = ProcessingResult.new(permitted_params)
      if @processing_result.save
        redirect_to admin_processing_results_path, notice: "File has been successfully added"
      else
        render :new
      end  
    end  
  
    def destroy
      @processing_result = ProcessingResult.find(params[:id])
      if @processing_result.destroy
        redirect_to admin_processing_results_path, notice: "File has been successfully deleted"
      else
        redirect_to admin_processing_results_path, error: "Unable to remove the file"
      end    
    end  
  
    private 
  
    def permitted_params
      params.require(:processing_result).permit(:file)
    end  
  
  
  end    