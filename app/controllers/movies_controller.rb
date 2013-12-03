class MoviesController < ApplicationController

  def index
    @movies = Movie.search_for(params[:q])
  end

  def show
    @movie = Movie.find params[:id]
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new safe_params
    if @movie.save
      flash[:notice] =  "Movie saved successfully"
      redirect_to @movie
    else
      render 'new'
    end
  end

  private

  def safe_params
    params.require(:movie).permit(:title, :description,:year_released, :rating)
  end
end
