class Project
  include Mongoid::Document

  field :name
  field :starts_at, :type => Date
  field :ends_at, :type => Date

  validates :name, :presence => true
  validates :starts_at, :presence => true
  validates :ends_at, :presence => true 
end
