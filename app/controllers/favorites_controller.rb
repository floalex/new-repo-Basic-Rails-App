class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite
    
    if favorite.save
      flash[:notice] = "Favorited sucessfully!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Unable to add favorite, please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    # Get the post from the params
    @post = Post.find(params[:post_id])
    # Find the current user's favorite with the ID in the params
    favorite = current_user.favorites.find(params[:id])

    authorize favorite
    
    if favorite.destroy
      flash[:notice] = "Remove favorite sucessfully."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Unable to remove favorite, please try again."
      redirect_to [@post.topic, @post]
    end
  end
end
