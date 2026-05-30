class RegistrationController < ApplicationController
    def create
      super do |user|

      if user.persisted?

        project = Project.create(
          name: user.organization_name,
          plan: user.plan
        )

        Membership.create(
          user: user,
          project: project
        )
      end
     end
    end
end
