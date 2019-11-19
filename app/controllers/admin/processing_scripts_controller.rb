class Admin::ProcessingScriptsController < Admin::ApplicationController
  
    def index
      @processing_scripts = ProcessingScript.order("id DESC")
    end  
  
    def new
      @processing_script = ProcessingScript.new
    end  

    def update
      @processing_script = ProcessingScript.find(params[:id])
      @processing_script.update_column(:active, true)
      ProcessingScript.where("id <> ?", @processing_script.id).update_all(active: false) if @processing_script.active?
      redirect_to admin_processing_scripts_path, notice: "Script has been successfully marked as active"
    end    
  
    def create
      @processing_script = ProcessingScript.new(permitted_params)
      
      @processing_script.active 
      if @processing_script.save
        ProcessingScript.where("id <> ?", @processing_script.id).update_all(active: false) if @processing_script.active?
        redirect_to admin_processing_scripts_path, notice: "Script has been successfully added"
      else
        render :new
      end  
    end  
  
    def destroy
      @processing_script = ProcessingScript.find(params[:id])
      if @processing_script.destroy
        redirect_to admin_processing_scripts_path, notice: "Script has been successfully deleted"
      else
        redirect_to admin_processing_scripts_path, error: "Unable to remove this script"
      end    
    end  
  
    private 
  
    def permitted_params
      params.require(:processing_script).permit(:file, :active)
    end  
  
  
  end    