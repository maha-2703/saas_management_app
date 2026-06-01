class Project < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  
  has_many :company_projects   # 👈 THIS IS MISSING

  def can_create_company_projects?
    (plan =='free' && company_projects.count < 1) || (plan == 'premium') 
  end
  

end