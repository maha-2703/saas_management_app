class CompanyProject < ApplicationRecord

  belongs_to :project

  validates_uniqueness_of :title

  validate :free_plan_can_only_have_one_project

  def free_plan_can_only_have_one_project

    if self.new_record? &&
       (project.company_projects.count > 0) &&
       (project.plan == 'free')

      errors.add(:base, 'free plans cannot have more than one project')

    end

  end


  def self.by_plan_and_project(project_id)

    project = Project.find(project_id)

    if project.plan == 'premium'

      project.company_projects

    else

      project.company_projects.order(:id).limit(1)

    end

  end

end