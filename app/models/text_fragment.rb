class TextFragment
  include Mongoid::Document

  field :key
  field :value

  validates_presence_of [:key, :value]
end