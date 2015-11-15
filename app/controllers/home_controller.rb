class HomeController < ApplicationController
	@location = Dir["/home/pi/RailsServer/swiftshareOnRails/Store/" + @hash.to_s + "/*"]

	def numOfFiles
		@hash = params[:hash]
		puts @hash
		@location = Dir["/home/pi/RailsServer/swiftshareOnRails/Store/" + @hash.to_s + "/*"]
		count = @location.size.to_s
		head fileCount: count
	end

  def download
	@hash = params[:hash]
	@index = params[:file]
	#puts @hash, @index
	
	@location = Dir["/home/pi/RailsServer/swiftshareOnRails/Store/" + @hash.to_s + "/*"]
	#puts "loc", @location, "size", @location.size
	
	#puts file
	@file = File.new(@location[@index.to_i])
	response.headers['Content-Length'] = @file.size.to_s
	response.headers['name']=File.basename(@file)
	#puts @location[@index.to_i], @file.size.to_s
	send_file @location[@index.to_i], :x_sendfile => true
	
	#format.js { render js: "window.location.href = '#{controller_download()}';" }
	
	
=begin
	@file_loc = '/home/pi/RailsServer/tmp_data/Led.pdf'
	@file = File.new(@file_loc)
	response.headers['Content-Length'] = @file.size.to_s
	response.headers['name']=File.basename(@file)
	puts @file.size.to_s
    send_file @file_loc, :x_sendfile => true
=end
  end
  
  def upload
	 puts "Enter Home\n"
    post = DataFile.save(params[:fileUpload])
    
    puts "\n"
    puts post
    puts "\n"
    
    render :text => post
  end
  
  def updateFiles
	require 'fileutils'
	threshold = Time.now.to_i - 60
	Dir["/home/pi/RailsServer/swiftshareOnRails/Store/*"].each do |dir|
		begin
			#puts dir
			if Dir.exist?(dir)
				puts dir
				FileUtils.rm_r(dir) if File.stat(dir).ctime.to_i < threshold
			end
		end
	end
  end

end
