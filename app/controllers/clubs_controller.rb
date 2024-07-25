require 'json'

class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])

    @table_snippets = club_service.generate_table_snippets(@club)
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

  def refresh_all
    if club_refresh_service.refresh_all_clubs
      sleep(1.0)
      redirect_to root_path
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
    raw_params = params.require(:club).permit(:name, :location, :country_abbr, :gender, :club_or_international, :fbref_table_name, :fbref_url)
    params_with_config = raw_params

    # will likely end up refactoring this to handle multiple additional fields at some point
    params_with_config[:config] = {
      fbref_table_name: raw_params[:fbref_table_name],
      fbref_url: raw_params[:fbref_url]
    }
    params_with_config.except(:fbref_table_name, :fbref_url)
  end

  def club_service
    ClubService.new
  end
end