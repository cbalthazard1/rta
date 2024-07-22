require 'json'

class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])

    # sorting code mostly from https://code.avi.nyc/turbo-sortable-paginated-tables
    # sort_column = params[:sort] || "position"
    # sort_direction = params[:direction].presence_in(%w[asc desc]) || "asc"
    # @club_rows = @club.club_rows.order("#{sort_column} #{sort_direction}")
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(table_params)

    if @club.save
      redirect_to @club
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])

    if @club.update(table_params)
      redirect_to @club
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def table_params
    raw_params = params.require(:club).permit(:name, :location, :country_abbr, :fbref_table_name, :fbref_url)
    params_with_config = raw_params

    # will likely end up refactoring this to handle multiple additional fields at some point
    params_with_config[:config] = {
      fbref_table_name: raw_params[:fbref_table_name],
      fbref_url: raw_params[:fbref_url]
    }
    params_with_config.except(:fbref_table_name, :fbref_url)
  end
end