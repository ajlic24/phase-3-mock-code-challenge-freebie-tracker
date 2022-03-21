class Dev < ActiveRecord::Base
    has_many :freebies 
    has_many :companies, through: :freebies 

    def received_one? item_name
        freebies_arr = ""
        self.freebies.each do |f|
            freebies_arr << f.item_name
        end
        if freebies_arr.include? item_name
            true
        else false
        end
    end

    def give_away dev, freebie
        if self.received_one? freebie.item_name
            dev.freebies << freebie
        else
            nil
        end
    end
end
