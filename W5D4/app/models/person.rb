class Person < ApplicationRecord
    belongs_to(
        :house,
        class_name: 'House',
        foreign_key: house_id,
        primary_key: id,
        optional: true
    )
    validates :name, presence: true
end