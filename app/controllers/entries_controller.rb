class EntriesController < ApplicationController

  # def index
  #   @entry = Entries.all
  # end

  def show
  @entry = Entry.find_by({ "id" => params["id"] })
  @place = Place.find_by({"id" => @entry["place_id"]})
  end

  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["posted_on"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
