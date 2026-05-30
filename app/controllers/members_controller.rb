class MembersController < ApplicationController

  def new
  end

  def create

    password = "password123"

    user = User.new(
      email: params[:email],
      password: password,
      password_confirmation: password,
      organization_name: current_user.organization_name,
      plan: current_user.plan
    )

    if user.save

      Membership.create(
        user: user,
        project: current_user.projects.first
      )

    

      redirect_to root_path,
      notice: "New member added"

    else

      redirect_to new_member_path,
      alert: user.errors.full_messages.join(", ")

    end

  end

end