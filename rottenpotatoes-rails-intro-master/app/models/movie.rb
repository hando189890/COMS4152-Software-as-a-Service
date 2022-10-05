class Movie < ActiveRecord::Base

    def self.all_ratings
        self.select(:rating).distinct.map {|record|
            record.rating
        }
    end 

    def self.with_ratings rating_list
        if rating_list == [] then 
            self.all
        else 
            self.where(rating: rating_list)
        end
    end 

    def self.sort rating_list, sort_column
       self.with_ratings(rating_list).order(sort_column + ' asc') 
    end 
    
end
