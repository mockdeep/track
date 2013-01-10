class Item < ActiveRecord::Base
  attr_accessible :week_average, :month_average, :year_average,
    :lifetime_average, :name
  belongs_to :user

  has_many :traces

  validates :name, :user, :presence => true

  def update_averages!
    update_attributes({
      :week_average => traces.week.average(:count),
      :month_average => traces.month.average(:count),
      :year_average => traces.year.average(:count),
      :lifetime_average => traces.average(:count),
    })
  end
end
