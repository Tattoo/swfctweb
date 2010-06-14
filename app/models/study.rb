class Study
  include Mongoid::Document

  field :key
  field :title
  field :researchers
  field :research_methods
  field :project_keys, :type => Array
  field :description
  field :contact_email
  field :contact_text

  #index :key, :unique => true

  validates_presence_of [:key, :title, :researchers, :contact_email, :contact_text]

  def projects
    p =[]
    return p unless project_keys
    project_keys.each do |project_key|
      p << Project.find(:first, :conditions => {:key => project_key})
    end
    return p
  end
end