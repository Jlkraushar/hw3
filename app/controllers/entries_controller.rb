class EntriesController < ApplicationController
  def new
    @entry = Entries.new
  end

  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build(entry_params)
    if @entry.save
      redirect_to place_path(@place), notice: 'Entry added successfully.'
    else
      render :new
  end
end