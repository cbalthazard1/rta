require 'json'

class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])

    # sorting code mostly from https://code.avi.nyc/turbo-sortable-paginated-tables
    sort_column = params[:sort] || "position"
    sort_direction = params[:direction].presence_in(%w[asc desc]) || "asc"
    @table_rows = @table.table_rows.order("#{sort_column} #{sort_direction}")
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

    if UpdateTablesJob.perform_later(params[:id])
      sleep(0.5)
      redirect_to @table
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
    raw_params = params.require(:table).permit(:country_abbr, :level, :name, :fbref_url)
    params_with_config = raw_params

    # will likely end up refactoring this to handle multiple additional fields at some point
    params_with_config[:config] = {
      fbref_url: raw_params[:fbref_url]
    }
    params_with_config.except(:fbref_url)
  end
end
