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

  def add

    # query_image #query_caption #query_owner_id
    image_url = params.fetch("query_image")
    caption_url = params.fetch("query_caption")
    owner_id_url = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = image_url
    a_new_photo.caption = caption_url
    a_new_photo.owner_id = owner_id_url
    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update 

    #input_image #input_caption #updated_photo_id
    the_id = params.fetch("updated_photo_id")
    the_image = params.fetch("input_image")
    the_caption = params.fetch("input_caption")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.image = the_image
    the_photo.caption = the_caption
    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end



end
