class PostsController < ApplicationController
  def new
    @post=Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id =  current_user.id #Assign the post to the user who created it.
    respond_to do |f|
      if (@post.save)
        f.html{ redirect_to "", notice: "Post created!"}
      else
        f.html{ redirect_to "", notice: "Error post not saved"}
      end
    end
  end

  def delete
    @u=User.find
    @u.post.delete
  end

  private
  def post_params #allows certain data to be passed via form_for
    params.require(:post).permit(:user_id, :content)
  end
end
