class Author < ActiveRecord::Base
    validates :name, :phone_number, presence: true
    validates :name, uniqueness: true
    validates :phone_number, { :length => { :is => 10} } 
    #presence unique and correct
end
