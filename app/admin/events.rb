ActiveAdmin.register Event, as: 'Eventos' do
  menu label: 'Mis Eventos'

  permit_params :name, :career, :description, :location, :startDate, :endDate

  # Scope the events to the current user
  scope_to :current_admin_user, association_method: :events

  form do |f|
    f.inputs do
      f.input :name, label: 'Nombre del evento'
      f.input :career, label: 'Carrera a la que aplica'
      f.input :description, label: 'Descripcion general'
      f.input :location, label: 'Lugar'
      f.input :startDate, label: 'Fecha de inicio'
      f.input :endDate, label: 'Fecha de finzalizacion'
      f.input :img, label: 'Imagen de portada', :as => 'file'
    end
    f.actions
  end

end
