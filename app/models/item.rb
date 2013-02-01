class Item < ActiveRecord::Base
  attr_accessible :week_average, :month_average, :year_average,
    :lifetime_average, :name
  belongs_to :user

  has_many :traces, :dependent => :destroy

  default_scope order("created_at DESC")

  validates :name, :user, :presence => true

  def self.update_averages!
    all.collect(&:update_averages!)
  end

  def update_averages!
    update_attributes({
      :week_average => traces.week.sum(:count).to_f / [7, traces.day_count].min,
      :month_average => traces.month.sum(:count).to_f / [30, traces.day_count].min,
      :year_average => traces.year.sum(:count).to_f / [365, traces.day_count].min,
      :lifetime_average => traces.sum(:count).to_f / traces.day_count,
    })
  end
end
