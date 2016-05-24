class EntriesController < ApplicationController
  def index
  	@entries = Entry.all
  end

  def show
  	@entry = Entry.find(params[:id])
  end

  def new
  	@entry = Entry.new
  end

  def create
	if Entry.create(entry_params)
		redirect_to entries_path
	else
		render :new
	end
  end

  private

  def entry_params
  	params.require(:entry).permit(:title, :body)
  end

end

