class Project
  include Mongoid::Document

  field :key
  field :name
  field :starts_at, :type => Date
  field :ends_at, :type => Date

  validates :key, :presence => true
  validates :name, :presence => true
  validates :starts_at, :presence => true
  validates :ends_at, :presence => true
  validate :dates_must_be_in_order

  def active?
    starts_at <= Date.today and ends_at >= Date.today
  end

  def self.active_project
    # currently assumed that only one active project at a time (will change at least in Global SF)
    Project.find(:first, :conditions => {:starts_at.lte => Time.now, :ends_at.gte => Time.now})
  end

private
  def dates_must_be_in_order
    if starts_at and ends_at
      errors.add(:ends_at, "End date must be after start date") if ends_at <= starts_at
    end
  end
end
