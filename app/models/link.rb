class Link

include DataMapper::Resource # this makes the instances of this class Datamapper resources
# This block describes what resources our model will have
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :title,  String
  property :url,    String
  has n, :tags, :through => Resource

end

    