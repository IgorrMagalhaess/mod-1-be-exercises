# ./grubhub_order.rb
require './lib/online_order'

class GrubhubOrder
  include OnlineOrder

  def order
    "food"
  end
    
  def wait_time
    "45-60 minutes"
  end
end
