class IlanceProject < ActiveRecord::Base
	belongs_to :ilance_user, :foreign_key => :user_id
	belongs_to :ilance_category, :foreign_key => :cid 
end
