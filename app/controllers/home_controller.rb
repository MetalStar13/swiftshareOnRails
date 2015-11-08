class HomeController < ApplicationController

  def download
    send_file '/home/kishan/Downloads/1984.pdf', :type=>"application/pdf" 
  end
  
  def upload
	# puts "Enter Home\n"
    post = DataFile.save(params[:fileUpload])
    render :text => "File has been uploaded successfully"
  end

end
