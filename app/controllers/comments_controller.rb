class CommentsController < ApplicationController


  def create
    #input_photo_id #input_author_id #input_comment
    comment_pic = params.fetch("input_photo_id")
    comment_auther = params.fetch("input_author_id")
    comment_text = params.fetch("input_comment")

    new_comment = Comment.new
    new_comment.photo_id = comment_pic
    new_comment.author_id = comment_auther
    new_comment.body = comment_text
    new_comment.save

    redirect_to("/photos/" + new_comment.photo_id.to_s)

  end

end
