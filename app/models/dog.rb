class Dog < ApplicationRecord
  belongs_to :user
  has_many :playdates

  def self.with_playdates(user_id)
    select('DISTINCT ON(dogs.id) dogs.id, dogs.name, dogs.breed, dogs.age, dogs.description, dogs.gender, p.id as playdate_id')
    .joins('INNER JOIN playdates p ON p.dog_id = dogs.id')
    .where('user_id = ?', user_id)
  end

end
