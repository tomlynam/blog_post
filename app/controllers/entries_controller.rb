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

  def edit
  	@entry = Entry.find(params[:id])
  end

  def update
  	@entry = Entry.find(params[:id])
  	if @entry.update(entry_params)
  		redirect_to entries_path
  	else
  		render :edit
  	end
  end

  def destroy
   	Entry.find(params[:id]).destroy
   	redirect_to entries_path
  end

  private

  def entry_params
  	params.require(:entry).permit(:title, :body)
  end

end

