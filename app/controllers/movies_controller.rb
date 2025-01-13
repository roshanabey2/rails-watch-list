class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = movie.new(movie_params)
      if @movie.save
        redirect_to movies_path(), status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    list.update(list_params)
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:review).permit(:title, :overview, :poster_url)
    end
end
