class User < ApplicationRecord
  has_many :products, dependent: :destroy
end
