# ./amazon_order.rb
require './lib/online_order'

class AmazonOrder
  include OnlineOrder

  def order
    "order"
  end

  def wait_time
    "2 business days"
  end
end
