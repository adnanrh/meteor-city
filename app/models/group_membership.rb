class GroupMembership < ApplicationRecord
	belongs_to :group
	belongs_to :friend, class_name: "User"
end