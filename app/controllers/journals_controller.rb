class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update]

  def show
  end

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

  def edit
  end

  def update
    if @journal.update(journal_params)
      flash[:notice] = "you have successfully updated your journal"
      redirect_to journal_path(@journal)
    else
      render edit
    end
  end

  def destroy
    journal = Journal.find(params[:id])
    journal.destroy
    flash[:notice] = "You have Erased your Journal"
    redirect_to root_path
  end

  private

  def journal_params
    params.require(:journal).permit(:name)
  end

  def set_journal
    @journal = Journal.find(params[:id])
  end

end
