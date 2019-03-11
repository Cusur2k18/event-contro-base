ActiveAdmin.register_page "Diploma Builder" do
  content title: 'Constancias' do
    render partial: 'diploma'
  end

  breadcrumb do
    ['admin', 'Constancias']
  end

  menu label: "Constancias", if: proc{ !current_admin_user.super_admin }
end