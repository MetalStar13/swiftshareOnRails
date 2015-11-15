class DataFile < ActiveRecord::Base
  def self.save(fileUpload,hash)
	#require 'digest'
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
	 puts fileUpload
	 
	#hash = Digest::MD5.hexdigest(fileUpload.join)
	#time = Time.now.to_i
	#MD5 32, SHA1 40, SHA256 64
	
	
	#puts "\n\n"
	#puts hash, hash.length, directory, time
	#puts "\n\n"
	
	directory = "/home/pi/RailsServer/swiftshareOnRails/Store/" + hash
	#Dir.mkdir directory
	
	f=fileUpload
	name = f.original_filename
	path = File.join(directory, name)
	File.open(path, "wb") { |file| file.write(f.read) }
	
	return hash
	
  end
end
