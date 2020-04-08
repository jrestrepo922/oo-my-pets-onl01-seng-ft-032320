require "pry"
class Owner
  attr_reader :name, :species #can have a name, cannot change owner's name. Same case for species

  @@all = []

  def initialize(name)

    @name = name
    @species = "human"
    @@all << self

  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
    #binding.pry
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
    #binding.pry
  end

  def buy_cat(cat_name)
    # this will create a new cat object and set it's name to the provided argument

    new_cats = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    # this will create a new cat object and set it's name to the provided argument

    new_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.collect{|dog| dog.mood == "happy"}
    binding.pry
  end
end
