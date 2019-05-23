class User < ApplicationRecord
    has_many :drivers
    has_many :parents 

    has_many :reviews
end
