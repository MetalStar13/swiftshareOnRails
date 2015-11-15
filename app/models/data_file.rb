class DataFile < ActiveRecord::Base
  def self.save(fileUpload)
	require 'digest'
	require 'uri'

=begin	
	upload['datafile'].each do |f|
		name = f.original_filename
		directory = "/home/kishan/ruby-web/tmp_data"
		path = File.join(directory, name)
		File.open(path, "wb") { |file| file.write(f.read) }
	end
=end
	 puts "Enter DataFile\n"
	hash = Digest::MD5.hexdigest(fileUpload.join)
	time = Time.now.to_i
	#MD5 32, SHA1 40, SHA256 64
	
	directory = "/home/pi/RailsServer/swiftshareOnRails/Store/" + hash
	
	#puts "\n\n"
	#puts hash, hash.length, directory, time
	#puts "\n\n"
	
	Dir.mkdir directory
	
	fileUpload.each do |f|
		name = f.original_filename
		path = File.join(directory, name)
		File.open(path, "wb") { |file| file.write(f.read) }
	end	
	
	return hash
	
  end
end
