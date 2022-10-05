class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    all = @all_ratings.map{|r| [r,1]}.to_h

    @ratings_to_show = params[:ratings] ? params[:ratings] : all 
    session[:ratings] = @ratings_to_show if params[:commit] == "Refresh"
    @ratings_to_show = session[:ratings] if session[:ratings]

    @sort_column = params[:sort_column] ? params[:sort_column] : ''
    if @sort_column == ''  then 
      @sort_column = session[:sort_column] if session[:sort_column]
    else 
        session[:sort_column] = @sort_column
    end 
     
    if !params.has_key?(:ratings) || !params.has_key?(:sort_column) then 
      redirect_to movies_path(:ratings=>@ratings_to_show,:sort_column=>@sort_column)       
      return 
    end 


    if @sort_column == '' then
      @movies = Movie.with_ratings @ratings_to_show.keys
    else 
      @movies = Movie.sort @ratings_to_show.keys, @sort_column
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
