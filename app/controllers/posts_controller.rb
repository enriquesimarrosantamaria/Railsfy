class PostsController < ApplicationController
  def new
    @post=Post.new(post_params)
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

  # def show
  #     @post = Post.find params[:id]
  # end

  def destroy
    puts 'PRINT POSTS'
    puts params[:id]
    @post = Post.find params[:id]
    respond_to do |f|
      if(@post.destroy)
        f.html{ redirect_to "", notice: "Deleted!"}
      else
        f.html{ redirect_to "", notice: "Not deleted!"}
      end
    end
  end

  def upvote 
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end  

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end

  private
  def post_params #allows certain data to be passed via form_for
    params.require(:post).permit(:user_id, :content,:image)
  end
  # private 
  #   def permit_post
  #     params.require(:post).permit(:image,:description)
  #   end
end
