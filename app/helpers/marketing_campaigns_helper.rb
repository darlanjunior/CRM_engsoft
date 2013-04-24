module MarketingCampaignsHelper
	def get_marketing_manager()
		return "CMRGM"
	end
	
	def get_financial_supervisor()
		return "FIN"
	end	
	
	def setReadonlyName(status)
		case status
			when 0
				return false
			when 1
				return false
			when 2
				return true
			when 3
				return true
			when 4
				return true
			when 5
				return true
			when 6
				return true
			when 7
				return false
			when 8
				return true
			when 9
				return true
			else
				return true
			end
	end
	
	def setReadonlyDescription(status)
		case status
			when 0
				return false
			when 1
				return false
			when 2
				return true
			when 3
				return true
			when 4
				return true
			when 5
				return true
			when 6
				return true
			when 7
				return false
			when 8
				return true
			when 9
				return true
			else
				return true
			end
	end
	
	def setReadonlyEstimatedBeginDate(status)
		case status
			when 0
				return true
			when 1
				return false
			when 2
				return true
			when 3
				return true
			when 4
				return true
			when 5
				return true
			when 6
				return true
			when 7
				return false
			when 8
				return true
			when 9
				return true
			else
				return true
			end
	end
	
	def setReadonlyEstimatedEndDate(status)
		case status
			when 0
				return true
			when 1
				return false
			when 2
				return true
			when 3
				return true
			when 4
				return true
			when 5
				return true
			when 6
				return true
			when 7
				return false
			when 8
				return true
			when 9
				return true
			else
				return true
			end
	end
	
	def setReadonlyEstimatedRevenue(status)
		case status
			when 0
				return true
			when 1
				return false
			when 2
				return true
			when 3
				return true
			when 4
				return true
			when 5
				return true
			when 6
				return true
			when 7
				return false
			when 8
				return true
			when 9
				return true
			else
				return true
			end
	end
	
	def setReadonlyRevenue(status)
		case status
			when 0
				return true
			when 1
				return true
			when 2
				return true
			when 3
				return true
			when 4
				return true
			when 5
				return true
			when 6
				return false
			when 7
				return true
			when 8
				return true
			when 9
				return true
			else
				return true
			end
	end
	
	def setReadonlyContactGroups(status)
		case status
			when 0
				return true
			when 1
				return false
			when 2
				return true
			when 3
				return true
			when 4
				return true
			when 5
				return true
			when 6
				return true
			when 7
				return false
			when 8
				return true
			when 9
				return true
			else
				return true
			end
	end
	
	def setReadonlyCommentary(status)
		case status
			when 0
				return true
			when 1
				return true
			when 2
				return false
			when 3
				return false
			when 4
				return false
			when 5
				return true
			when 6
				return true
			when 7
				return true
			when 8
				return true
			when 9
				return true
			else
				return true
			end
	end
end
