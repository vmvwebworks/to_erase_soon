class Zombie < ApplicationRecord
  has_many :zombie_armors
  has_many :zombie_weapons
end
