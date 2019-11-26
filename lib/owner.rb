class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    return self.all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.map { |dog| dog.mood = "happy" }
  end

  def feed_cats
    Cat.all.collect { |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.all_pets.collect do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.length} cat(s)."
  end

  # === helper methods ===
  def all_pets
    return Cat.all + Dog.all
  end


end