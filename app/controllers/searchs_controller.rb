class SearchsController < ApplicationController
  def index
    #just redirect to metadocs index now!
    redirect_to :controller=>:metadocs, :action=>:index
  end
end
