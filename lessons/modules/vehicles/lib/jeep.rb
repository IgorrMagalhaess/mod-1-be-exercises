# ./jeep.rb
require './lib/engine'

class Jeep
  include Engine
  
  def drive
    "All wheels go!"
  end
end
