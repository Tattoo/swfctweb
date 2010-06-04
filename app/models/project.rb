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
end
