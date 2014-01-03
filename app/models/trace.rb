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
  validate :executed_on_not_in_future

  def update_averages!
    item.update_averages!
  end

  def self.day_count
    start_date = (minimum(:executed_on) || Time.zone.now).beginning_of_day
    end_date = Time.zone.now.beginning_of_day
    count = ((end_date - start_date) / 1.day).to_i
    count + 1
  end

  private

  def executed_on_not_in_future
    if executed_on && executed_on > Time.zone.now
      errors.add(:executed_on, "cannot be in future")
    end
  end
end
