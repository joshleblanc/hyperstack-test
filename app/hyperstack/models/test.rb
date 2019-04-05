class Test < ApplicationRecord
    scope :test, -> () { all }
end
