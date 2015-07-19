class JournalsController < ApplicationController
  def new
    @journal = Journal.new
  end

  def create
    journal = Journal.new(journal_params)
    if journal.save
      flash[:notice] = "You have successfully created a new journal"
      redirect_to journal_path(journal)
    else
      @journal = journal
      render :new
    end
  end

  def show
    @journal = Journal.find(params[:id])
  end

  private

  def journal_params
    params.require(:journal).permit(:name)
  end

end
