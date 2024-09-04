require 'json'

class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])

    @table_snippets = club_service.generate_table_snippets(@club)

    @matches = club_service.find_matches(@club)
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(table_params)

    if @club.save
      club_service.associate_club(@club)
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
      club_service.associate_club(@club)
      redirect_to @club
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def refresh
    @club = Club.find(params[:id])

    if club_service.refresh_club(params[:id])
      sleep(2.0)
      redirect_to @club
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def refresh_all
    if club_service.refresh_all_clubs
      sleep(2.0)
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
    raw_params = params.require(:club).permit(:name, :short_name, :location, :country_abbr, :gender, :club_or_international, :fbref_table_name, :fbref_club_page_name, :fbref_url, :club_elo_name)
    params_with_config = raw_params

    # will likely end up refactoring this to handle multiple additional fields at some point
    params_with_config[:config] = {
      fbref_table_name: raw_params[:fbref_table_name],
      fbref_club_page_name: raw_params[:fbref_club_page_name],
      fbref_url: raw_params[:fbref_url],
      club_elo_name: raw_params[:club_elo_name]
    }
    params_with_config.except(:fbref_table_name, :fbref_club_page_name, :fbref_url, :club_elo_name)
  end

  def club_service
    ClubService.new
  end
end