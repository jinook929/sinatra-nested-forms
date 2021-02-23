class Pirate
  @@all = []
  def self.all
    @@all
  end

  def initialize(attributes)
    attributes.each {|k, v|
      self.class.attr_accessor(k)
      self.send("#{k}=", v)
    }
    @@all << self
  end
end