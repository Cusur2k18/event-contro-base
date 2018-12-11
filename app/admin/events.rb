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

  # ================================================= START CONTROLLER =========================================================
  #   _____ ____  _   _ _______ _____   ____  _      _      ______ _____  
  #  / ____/ __ \| \ | |__   __|  __ \ / __ \| |    | |    |  ____|  __ \ 
  # | |   | |  | |  \| |  | |  | |__) | |  | | |    | |    | |__  | |__) |
  # | |   | |  | | . ` |  | |  |  _  /| |  | | |    | |    |  __| |  _  / 
  # | |___| |__| | |\  |  | |  | | \ \| |__| | |____| |____| |____| | \ \ 
  #  \_____\____/|_| \_|  |_|  |_|  \_\\____/|______|______|______|_|  \_\
  controller do
    def index

      respond_to do |format|
        format.html { super }
        format.csv  { super }
        format.xml  { super }
        format.json { super }

        format.pdf do
          @events = Event.all
          render pdf: 'events', layout: 'pdf', template: 'admin/events/show_pdf.html.erb'
        end
      end
    end
  end # ================================================= END CONTROLLER =========================================================


  # ================================================= START INDEX =========================================================
  #  _____ _   _ _____  ________   __
  # |_   _| \ | |  __ \|  ____\ \ / /
  #   | | |  \| | |  | | |__   \ V / 
  #   | | | . ` | |  | |  __|   > <  
  #  _| |_| |\  | |__| | |____ / . \ 
  # |_____|_| \_|_____/|______/_/ \_\
  index do
    selectable_column
    column "Imagen" do |event|
      link_to image_tag(event.get_transformed_image('w_200,h_150'), size: "200x150", alt: event.name), admin_evento_path(event)
    end
    column "Nombre del evento" do |event|
      link_to event.name, admin_evento_path(event)
    end
    column 'Fecha de inicio', :start_date
    column 'Fecha de finalizacion', :end_date
    column 'Carrera', :career
    actions
  end # ================================================= END INDEX =========================================================



  # ================================================= START SHOW =========================================================
  #  ____ ___ ____  _____ ____    _    ____      ___       ____  _   _  _____        __
  # / ___|_ _|  _ \| ____| __ )  / \  |  _ \    ( _ )     / ___|| | | |/ _ \ \      / /
  # \___ \| || | | |  _| |  _ \ / _ \ | |_) |   / _ \/\   \___ \| |_| | | | \ \ /\ / / 
  #  ___) | || |_| | |___| |_) / ___ \|  _ <   | (_>  <    ___) |  _  | |_| |\ V  V /  
  # |____/___|____/|_____|____/_/   \_\_| \_\   \___/\/   |____/|_| |_|\___/  \_/\_/  
  show do
    attributes_table do
      row 'Nombre' do |event|
        event.name
      end
      row 'Carrera' do |event|
        event.career
      end
      row 'Lugar del evento' do |event|
        event.location
      end
      row 'Fecha de inicio' do |event|
        event.start_date
      end
      row 'Fecha de finalizacion' do |event|
        event.end_date
      end

      panel 'Descripcion' do
        attributes_table_for resource do
          insert_tag(Arbre::HTML::Div) { content_tag(:span, raw(resource.description)) }
        end
      end
    end
  end
  # ============ SIDEBAR ============
  sidebar 'Imagen de Portada', only: :show do
    attributes_table  do
      row ' ' do |event|
        image_tag(event.get_transformed_image('w_200,h_200'), size: "200x200", alt: event.name)
      end
    end
  end # ================================================= END SHOW =========================================================



  # ================================================= START FORM =========================================================
  #  ______ ____  _____  __  __ 
  # |  ____/ __ \|  __ \|  \/  |
  # | |__ | |  | | |__) | \  / |
  # |  __|| |  | |  _  /| |\/| |
  # | |   | |__| | | \ \| |  | |
  # |_|    \____/|_|  \_\_|  |_|
  form do |f|
    f.inputs do
      span '* Requeridos', class: 'required-label'
      f.input :name, label: 'Nombre del evento'
      f.input :career, label: 'Carrera a la que aplica'
      f.input :description, label: 'Descripcion general', as: :trumbowyg
      f.input :location, label: 'Lugar'
      columns do
        column max_width: "500px", min_width: "100px" do
          span 'Fecha de inicio'
          span '*', class: 'required'
          f.input :start_date, :as => 'string', label: false, :input_html => { :class => 'custom-datepicker'}
        end

        column max_width: "500px", min_width: "100px" do
          span 'Fecha de finalizacion'
          span '*', class: 'required'
          f.input :end_date, :as => 'string', label: false, :input_html => { :class => 'custom-datepicker'}
        end
      end
      f.input :cover, label: 'Imagen de portada', :as => 'file', :hint => (image_tag(f.object.cover) if f.object.cover)
    end
    f.actions
  end # ================================================== END FORM ==========================================================

  

  # ================================================= START FILTERS ======================================================
  #  ______ _____ _   _______ ______ _____   _____ 
  # |  ____|_   _| | |__   __|  ____|  __ \ / ____|
  # | |__    | | | |    | |  | |__  | |__) | (___  
  # |  __|   | | | |    | |  |  __| |  _  / \___ \ 
  # | |     _| |_| |____| |  | |____| | \ \ ____) |
  # |_|    |_____|______|_|  |______|_|  \_\_____/
  filter :name_cont, label: 'Nombre'
  filter :career_cont, label: 'Carrera a la que aplica'
  filter :start_date, label: 'Fecha de inicio'
  # ================================================== END FILTERS ========================================================

end
