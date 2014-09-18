class PhotoSearchesController < ApplicationController

	def new
		@search = PhotoSearch.new
	end

	def create
		@search = PhotoSearch.new(params[:photo_search][:stock_ref], params[:photo_search][:registration])
		puts @search.make_reference
		if @search.valid?
			redirect_to photo_searches_path(:ref => @search.make_reference)
		else
			render :action => 'new'
		end
	end

	def index
		@large_images = PhotoSearch.new.fetch_large_images(params[:ref])
		@small_images = PhotoSearch.new.fetch_small_images(params[:ref])
	end

end