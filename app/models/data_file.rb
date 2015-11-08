class DataFile < ActiveRecord::Base
  def self.save(fileUpload)

=begin	
	upload['datafile'].each do |f|
		name = f.original_filename
		directory = "/home/kishan/ruby-web/tmp_data"
		path = File.join(directory, name)
		File.open(path, "wb") { |file| file.write(f.read) }
	end
=end
	# puts "Enter DataFile\n"
	fileUpload.each do |f|
		name = f.original_filename
		directory = "/home/pi/RailsServer/SwiftShare/Store/"
		path = File.join(directory, name)
		File.open(path, "wb") { |file| file.write(f.read) }
	end
  end
end
