class IlanceCategory < ActiveRecord::Base
	has_many :ilance_projects, :foreign_key => :cid
end
