class Project
  include Mongoid::Document

  field :key
  field :name
  field :starts_at, :type => Date
  field :ends_at, :type => Date
  field :description
  field :technologies
  field :study_keys, :type => Array
  field :contact_email
  field :contact_text

  validates :key, :presence => true
  validates :name, :presence => true
  validates :starts_at, :presence => true
  validates :ends_at, :presence => true
  validate :dates_must_be_in_order

  def active?
    starts_at <= Date.today and ends_at >= Date.today
  end

  def upcoming?
    starts_at > Date.today
  end

  def previous
    projects = Project.where(:starts_at.lt => starts_at.to_time).order_by([:starts_at, :desc])
    return projects[0]
  end

  def next
    projects = Project.criteria.and(:starts_at.gt => starts_at.to_time, :key.ne => key).order_by([:starts_at, :asc])
    return projects[0]
  end

  def studies
    s = []
    return s unless study_keys
    study_keys.each do |study_key|
      s << Study.find(:first, :conditions => {:key => study_key})
    end
    return s
  end

  def self.past_projects
    Project.where(:ends_at.lt => Time.now).order_by([:ends_at, :desc])
  end

  def self.active_projects
    Project.where(:starts_at.lte => Time.now, :ends_at.gte => Time.now).order_by([:starts_at, :asc])
  end

  def self.future_projects
    Project.where(:starts_at.gt => Time.now).order_by([:starts_at, :asc])
  end

private
  def dates_must_be_in_order
    if starts_at and ends_at
      errors.add(:ends_at, "End date must be after start date") if ends_at <= starts_at
    end
  end
end
