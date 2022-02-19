class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_username = params.fetch("username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first


    # if @matching_username == nil
    #   redirect_to("/404")
    # else
      render({ :template => "user_templates/show.html.erb" })
    # end
  end

  def update
    user_id = params.fetch("path_id")
    new_username = params.fetch("browser_username")
    
    matching_users = User.where({ :username => user_id })

    the_user = matching_users.first
    the_user.username = new_username

    the_user.save

    next_url = "/users/" + the_user.username
    redirect_to(next_url)
    
  end
end