class SearchsController < ApplicationController
  def index
    @search = Metadoc.search do
      keywords params[:query]
      order_by :collect_at, :desc
      paginate :page=>params[:page], :per_page=>25
    end
    @metadocs = @search.results
  end
end
