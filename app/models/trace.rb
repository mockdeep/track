class Trace < ActiveRecord::Base
  attr_accessible :count, :executed_on

  belongs_to :item

  after_save :update_averages!

  delegate :user, :to => :item

  scope :week, where("executed_on >= ?", 1.week.ago)
  scope :month, where("executed_on >= ?", 1.month.ago)
  scope :year, where("executed_on >= ?", 1.year.ago)

  default_scope order("executed_on DESC")

  validates :count, :item, :executed_on, :presence => true

  def update_averages!
    item.update_averages!
  end

  def self.day_count
    start_date = minimum(:executed_on) || Time.zone.now
    count = ((Time.zone.now - start_date) / 1.day).to_i
    count > 0 ? count : 1
  end
end
