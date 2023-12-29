# ./camry.rb
require './lib/engine'

class Camry
  include Engine

  def drive
    "Back wheels go!"
  end
end
