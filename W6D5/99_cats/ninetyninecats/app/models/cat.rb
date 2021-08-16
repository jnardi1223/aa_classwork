require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :color, inclusion: { in: %w(Black Orange Brown White), mesage: "%{color} is not a valid color" }
    validates :sex, inclusion: { in: %w(M F), message: "%{sex} must be M or F" }

    def age
        age = time_ago_in_words(birth_date)
    end
end

