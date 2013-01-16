class Item < ActiveRecord::Base
  attr_accessible :week_average, :month_average, :year_average,
    :lifetime_average, :name
  belongs_to :user

  has_many :traces

  validates :name, :user, :presence => true

  def update_averages!
    update_attributes({
      :week_average => traces.week.sum(:count) / [7, traces.day_count].min,
      :month_average => traces.month.sum(:count) / [30, traces_day_count].min,
      :year_average => traces.year.sum(:count) / [365, traces.day_count].min,
      :lifetime_average => traces.sum(:count) / traces.day_count,
    })
  end
end
