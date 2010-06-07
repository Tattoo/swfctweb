require 'rubygems'
require 'mongo'

@db = Mongo::Connection.new.db('swfctweb_development') # TODO: use ENV

# index to text_fragments keys
@db.collection("text_fragments").create_index("key")

# indexes to project dates
@db.collection("projects").create_index("starts_at")
@db.collection("projects").create_index("ends_at")