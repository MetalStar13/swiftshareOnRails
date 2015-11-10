class Scheduler < ActiveRecord::Base
  def self.updatefiles
	require 'fileutils'
	threshold = Time.now.to_i - 60
	Dir["/home/pi/RailsServer/swiftshareOnRails/Store/*"].each do |dir|
		begin
			#puts dir
			if Dir.exist?(dir)
				#puts dir
				FileUtils.rm_r(dir) if File.stat(dir).ctime.to_i < threshold
			end
		end
	end
  end
end
