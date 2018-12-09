ActiveAdmin.register Event, as: 'Eventos' do
  menu label: 'Mis Eventos'
  permit_params :name, :career, :description, :location, :start_date, :end_date, :cover

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

  # Index
  index do
    selectable_column
    column "Imagen" do |evt|
      link_to image_tag(evt.get_index_image, size: "200x150", alt: evt.name), admin_evento_path(evt)
    end
    column "Nombre del evento" do |event|
      link_to event.name, admin_evento_path(event)
    end
    column 'Fecha de inicio', :start_date
    column 'Fecha de finalizacion', :end_date
    column 'Carrera', :career
    actions
  end

  # Form
  form do |f|
    f.inputs do
      f.input :name, label: 'Nombre del evento'
      f.input :career, label: 'Carrera a la que aplica'
      f.input :description, label: 'Descripcion general', as: :trumbowyg
      f.input :location, label: 'Lugar'
      columns do
        column max_width: "500px", min_width: "100px" do
          span 'Fecha de inicio'
          f.input :start_date, :as => 'string', label: false, :input_html => { :class => 'custom-datepicker'}
        end

        column max_width: "500px", min_width: "100px" do
          span 'Fecha de finalizacion'
          f.input :end_date, :as => 'string', label: false, :input_html => { :class => 'custom-datepicker'}
        end
      end
      f.input :cover, label: 'Imagen de portada', :as => 'file', :hint => image_tag(f.object.cover)
    end
    f.actions
  end

  # Filters
  filter :name_cont, label: 'Nombre'
  filter :career_cont, label: 'Carrera a la que aplica'
  filter :start_date, label: 'Fecha de inicio'

end
