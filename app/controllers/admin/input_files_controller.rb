class Admin::InputFilesController < Admin::ApplicationController
  
  def index
    @input_files = InputFile.order("id DESC")
  end  

  def new
    @input_file = InputFile.new
  end  

  def create
    @input_file = InputFile.new(permitted_params)
    if @input_file.save
      redirect_to admin_input_files_path, notice: "File has been successfully added"
    else
      render :new
    end  
  end  

  def destroy
    @input_file = InputFile.find(params[:id])
    if @input_file.destroy
      redirect_to admin_input_files_path, notice: "File has been successfully deleted"
    else
      redirect_to admin_input_files_path, error: "Unable to remove the file"
    end    
  end  

  private 

  def permitted_params
    params.require(:input_file).permit(:file)
  end  


end    