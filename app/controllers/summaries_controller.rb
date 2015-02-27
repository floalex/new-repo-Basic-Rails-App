class SummariesController < ApplicationController
  def index
    
    @summaries = Summary.all
    authorize @summaries
  end

  def new
    
    @summary = Summary.new
    authorize @summary
  end

  def show
    
    @summary = Summary.find(params[:id])
    
    authorize @summary
  end

  def edit
    
    @summary = Summary.find(params[:id])
    authorize @summary
  end


  def create
    
    @summary = Summary.new(params.require(:summary).permit(:name, :description))
    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved successfully."
      redirect_to @summary
    else 
      flash[:error] = "There was an error creating a summary, please try again."
      render :new
    end 
  end

  def update
   
    @summary = Summary.find(params[:id])
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:name, :description))
       flash[:notice] = "Summary was updated."
       redirect_to @summary
     else
       flash[:error] = "Error saving summary. Please try again."
       render :edit
     end
  end
end