ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Bienvenido a control eventos CUSUR"
      end
    end
    div class: "blank_slate_container" do
      image_tag(asset_url('cusur-home.png'), size: "500x200", alt: 'hero')
    end
    
  end # content
end
