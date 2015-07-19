class JournalEntriesController < ApplicationController
  before_action :set_journal
  before_action :set_journal_entry, only:[:show, :edit, :update]

  def index
    @journal_entries = @journal.journal_entries
  end

  def show
  end

  def new
    @journal_entry = JournalEntry.new
  end

  def create
    journal_entry = JournalEntry.new(journal_entry_params)
    journal_entry.journal_id = @journal.id
    if journal_entry.save
      flash[:notice] = "You have created an entry"
      redirect_to journal_path(@journal)
    else
      @journal = journal_entry
      render :new
    end
  end

  def edit
  end

  def update
    if @journal_entry.update(journal_entry_params)
      flash[:notice] = "You have updated your entry!"
      redirect_to journal_path(@journal)
    else
      render :edit
    end
  end

  def destroy
    journal_entry = JournalEntry.find(params[:id])
    journal_entry.destroy
    flash[:notice] = "You have removed an entry"
    redirect_to journal_path(@journal)
  end

  private

  def journal_entry_params
    params.require(:journal_entry).permit(:date, :content, :rating)
  end

  def set_journal
    @journal = Journal.find(params[:journal_id])
  end

  def set_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
  end
end
