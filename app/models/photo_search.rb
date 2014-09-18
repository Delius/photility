class PhotoSearch

  include ActiveModel::Validations
  include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_reader :stock_ref, :registration, :reference

	validates_presence_of :stock_ref, :registration
	validates_length_of :stock_ref, :minimum => 11, :maximum => 20

	def initialize(stock_ref = "", registration = "" )
		if(stock_ref.size !=0)
			@stock_ref = stock_ref
		end
		if(registration.size !=0)
			@registration = registration
		end
	end

	def fetch_large_images(reference)
		images = []
		sizes = [800]
		cameras = ['4', 'i', '6', 'f', '5', 'r']
		sizes.each do |size|
			cameras.each do |camera|
				images << "http://imagecache.arnoldclark.com/imageserver/#{reference}/#{size}/#{camera}/"
			end
		end
		images
	end

	def fetch_small_images(reference)
		images = []
		sizes = [350]
		cameras = ['4', 'i', '6', 'f', '5', 'r']
		sizes.each do |size|
			cameras.each do |camera|
				images << "http://imagecache.arnoldclark.com/imageserver/#{reference}/#{size}/#{camera}/"
			end
		end
		images
	end

	def make_reference(stock_ref = "", registration = "")
		if(stock_ref.size !=0)
			@stock_ref = stock_ref
		end
		if(registration.size !=0)
			@registration = registration
		end

	  @reference = ""

	 # tis part produce ref string make registration reverse, 
	 # interleave and adds the 9 char to produce obfuscated-stock-reference
		
		registration = @registration.reverse
		stock_ref = @stock_ref					
		
		(0...registration.size*2).each do |index|

	  	if index.even?
	    	@reference << stock_ref[index/2]
	  	else
	    	@reference << registration[index/2]
	 		end
		end

		@reference << @stock_ref[8]			
	end																

	def persisted?
    false
  end

end