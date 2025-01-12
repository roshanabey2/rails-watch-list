class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ destroy ]
  def new
    @list = List.find(params[:list_id])
    @bookmark =  Bookmark.new()
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    list = @bookmark.list
    if @bookmark.destroy!
      redirect_to list_path(list), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end


  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end


end
