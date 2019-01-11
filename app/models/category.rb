class Category < ApplicationRecord
  enum level: {
    world: 0,
    line: 1,
    subline: 2,
    category: 3,
    subcategory: 4,
  }

  class << self
    Category.levels.keys.each do |attribute|
      define_method :"is_#{attribute}?" { attributte? }
    end
  end
end
