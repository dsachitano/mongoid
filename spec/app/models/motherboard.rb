class Motherboard
  include Mongoid::Document
  identity :type => Integer
end
class Ram
  include Mongoid::Document
  belongs_to :motherboard
end