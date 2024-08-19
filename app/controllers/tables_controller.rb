require 'json'

class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])
    @season = params[:season]

    rows = @table.table_rows.where(season: @season)

    seasons = @table.table_rows.distinct.pluck(:season) << "2024-2025"
    @available_seasons = seasons - [@season]

    # sorting code mostly from https://code.avi.nyc/turbo-sortable-paginated-tables
    sort_column = params[:sort] || "position"
    sort_direction = params[:direction].presence_in(%w[asc desc]) || "asc"

    if %w[position team_name points goal_difference xg_diff_per90].include?(sort_column)
      @table_rows = rows.order("#{sort_column} #{sort_direction}")
    else
      # works for integer sort - necessary if avoiding db sort
      @table_rows = rows.all.sort_by do |row|
        row.send(sort_column.to_sym) || 0
      end

      @table_rows.reverse! if sort_direction == "desc"
    end
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)

    if @table.save
      redirect_to @table
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])

    if @table.update(table_params)
      redirect_to @table
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def refresh
    @table = Table.find(params[:id])

    if table_refresh_service.refresh_table(params[:id])
      sleep(1.0)
      redirect_to @table
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def refresh_all
    if table_refresh_service.refresh_all_tables
      sleep(1.0)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def table_params
    raw_params = params.require(:table).permit(:country_abbr, :level, :name, :gender, :club_or_international, :fbref_table_name, :fbref_url)
    params_with_config = raw_params

    # will likely end up refactoring this to handle multiple additional fields at some point
    params_with_config[:config] = {
      fbref_table_name: raw_params[:fbref_table_name],
      fbref_url: raw_params[:fbref_url]
    }
    params_with_config.except(:fbref_table_name, :fbref_url)
  end

  def table_refresh_service
    TableRefreshService.new
  end
end
