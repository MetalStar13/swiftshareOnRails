class HomeController < ApplicationController

  def download
	@file_loc = '/home/pi/Documents/Led.pdf'
	@file = File.new(@file_loc)
	response.headers['Content-Length'] = @file.size.to_s
	response.headers['name']=File.basename(@file)
	puts @file.size.to_s
    send_file @file_loc, :x_sendfile => true
  end
  
  def upload
	# puts "Enter Home\n"
    post = DataFile.save(params[:fileUpload])
    
    puts "\n"
    puts post
    puts "\n"
    
    render :text => post
  end

end
