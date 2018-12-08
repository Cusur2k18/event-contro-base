ActiveAdmin.register Event, as: 'Eventos' do
  menu label: 'Mis Eventos'
  permit_params :name, :career, :description, :location, :startDate, :endDate, :cover

  # Scope the events to the current user
  scope_to :current_admin_user, association_method: :events

  before_create do |event|
    event.uuid = SecureRandom.uuid
  end

  before_save do |event|
    unless params[:event][:cover].nil?
      result = Cloudinary::Uploader.unsigned_upload params[:event][:cover].path, 'cu8bwt31', :folder => 'cusur-eventos'
      event.cover = result['secure_url']
    end
  end

  # Form
  form do |f|
    f.inputs do
      f.input :name, label: 'Nombre del evento'
      f.input :career, label: 'Carrera a la que aplica'
      f.input :description, label: 'Descripcion general'
      f.input :location, label: 'Lugar'
      columns do
        column max_width: "500px", min_width: "100px" do
          span 'Fecha de inicio'
          f.input :startDate, :as => 'string', label: false, :input_html => { :class => 'datepicker with_time'}
        end

        column max_width: "500px", min_width: "100px" do
          span 'Fecha de finalizacion'
          f.input :endDate, :as => 'string', label: false, :input_html => { :class => 'datepicker with_time'}
        end
      end
      f.input :cover, label: 'Imagen de portada', :as => 'file', :hint => image_tag(f.object.cover)
    end
    f.actions
  end

end
