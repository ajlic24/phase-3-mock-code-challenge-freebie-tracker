class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie dev, item_name, value
        freebies << Freebie.create(dev: dev, item_name: item_name, value: value)
    end

    def self.oldest_company
        earliest = self.minimum("founding_year")
        self.find_by(founding_year: earliest)
    end
end
