class Weapon < ApplicationRecord

    validates :name, presence: true
  validates :power_base, presence: true, numericality: { greater_than: 0 }
  validates :power_step, presence: true, numericality: { greater_than: 0 }
  validates :level, presence: true, numericality: { greater_than: 0 }

  def current_power
    power_base + ((level - 1) * power_step)
  end

  def title
    "#{name} ##{level}"
  end

end
