ActiveAdmin.register User do


controller do
  defaults :finder => :find_by_slug!
end
  # before_action only: [:show, :edit] do
  #   @user = User.friendly.find(params[:id])
  # end


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :first_name, :last_name, :address, :slug
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    # id_column
    column :email
    column :first_name
    column :last_name
    column :address
    column :slug
    column :sign_in_count
    column :created_at
    actions
  end


end
