class PhotosController < ApplicationController 


  def index
    matching_photos = Photo.all
    @list_of_all_photos = matching_photos.order({:created_at => :desc})
    render({:template => "photos_templates/index"})
  end

  def show
  
    photo_id_url = params.fetch("path_photo_id")
    matching_photos = Photo.where({:id => photo_id_url})
    @the_photo = matching_photos.at(0)
    render({:template => "photos_templates/show"})
  end

  def delete
  
    deleted_photo_url = params.fetch("deleted_photo_id")
    matching_photos = Photo.where({:id => deleted_photo_url})
    deleted_photo = matching_photos.at(0)
    deleted_photo.destroy
    redirect_to("/photos")
  end



end
