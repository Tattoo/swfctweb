class Project
  include Mongoid::Document

  field :name
  field :starts_at, :type => Date
  field :ends_at, :type => Date
end
