class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("path_id")

    matching_photo = Photo.where({ :id => url_id })

    @the_photo = matching_photo.first

    render({ :template => "photo_templates/show.html.erb" })
  end

  def delete
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.first

    the_photo.destroy

    # render({ :template => "photo_templates/delete.html.erb" })

    redirect_to("/photos")
  end

  def insert_photo
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render({ :template => "photo_templates/insert.html.erb" })
    next_url = "/photos/" + a_new_photo.id.to_s
    redirect_to(next_url)
  end

  def update
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.first

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    # render({ :template => "photo_templates/update.html.erb"})
    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url)
  end

  def comment
    comment_photo = params.fetch("input_photo_id")
    comment_author = params.fetch("input_author_id")
    comment_body = params.fetch("input_body")

    new_comment = Comment.new
    new_comment.photo_id = comment_photo
    new_comment.author_id = comment_author
    new_comment.body = comment_body

    new_comment.save

    new_url = "/photos/" + comment_photo.to_s
    redirect_to(new_url)
  end

end