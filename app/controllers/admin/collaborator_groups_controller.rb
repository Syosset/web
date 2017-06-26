module Admin
  class CollaboratorGroupsController < BaseController
    before_action :find_collaborator_group
    before_action :find_user, only: [:add_collaborator, :remove_collaborator]

    def add_collaborator
      authorize :edit, @collaborator_group.collaboratable
      @collaborator_group.add(@user)
      redirect_to edit_admin_collaborator_group_path(@collaborator_group), flash: {:success => "Collaborator was added"}
    end

    def remove_collaborator
      authorize :edit, @collaborator_group.collaboratable
      @collaborator_group.users.delete(@user)
      redirect_to edit_admin_collaborator_group_path(@collaborator_group), flash: {:success => "Collaborator was removed"}
    end

    def edit
      authorize @collaborator_group.collaboratable
    end

    def update
      authorize @collaborator_group.collaboratable
      @collaborator_group.update!(collaborator_group)
      redirect_to collaborator_group.collaboratable, flash: {:success => "Collaborators have been updated"}
    end

    private
    def find_user
      @user = User.find(collaborator_group_params[:user])
    end

    def find_collaborator_group
      @collaborator_group = CollaboratorGroup.find(collaborator_group_params[:id] || collaborator_group_params[:collaborator_group_id])
    end

    def collaborator_group_params
      params.permit!
    end
  end
end
