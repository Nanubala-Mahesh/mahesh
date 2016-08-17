class AnnouncementsController < ApplicationController
	def index
		@announcements = Announcement.all
	end
	def new
	 @announcement = Announcement.new
	end
end
