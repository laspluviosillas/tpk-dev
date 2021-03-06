class Certificate < ActiveRecord::Base
  attr_accessible :name, :description, :skill_ids
  attr_accessible :approved, :as => :admin
   
  has_many :certifications
  has_many :affiliates, :through => :certifications
  has_and_belongs_to_many :skills
end
