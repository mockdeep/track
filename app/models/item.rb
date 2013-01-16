class Item < ActiveRecord::Base
  attr_accessible :week_average, :month_average, :year_average,
    :lifetime_average, :name
  belongs_to :user

  has_many :traces

  validates :name, :user, :presence => true

  def update_averages!
    update_attributes({
      :week_average => traces.week.sum(:count) / min(7, traces.day_count),
      :month_average => traces.month.sum(:count) / min(30, traces_day_count),
      :year_average => traces.year.sum(:count) / min(365, traces.day_count),
      :lifetime_average => traces.sum(:count) / traces.day_count,
    })
  end
end
