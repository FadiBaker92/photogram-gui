class PhotosController < ApplicationController 


  def index
    matching_photos = Photo.all
    @list_of_all_photos = matching_photos.order({:created_at => :desc})
    render({:template => "photos_templates/index"})
  end

  def show
  

    render({:template => "photos_templates/show"})
  end




end
