class UsersController < ApplicationController 

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({ :template => "users_templates/index"})
  end

  def show 
    url_username = params.fetch("path_username")
    matching_username = User.where({:username => url_username})
    @the_user = matching_username.at(0)
    if @the_user == nil
      redirect_to("/404")
    else
    render({ :template => "users_templates/show"})
    end

  end

  def add
    added_username = params.fetch("user_input").to_s
    new_user = User.new
    new_user.username = added_username
    new_user.save
    new_user_url = new_user.username
    redirect_to("/users/" + new_user_url)
  end

  
end
