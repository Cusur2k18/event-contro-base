module ActiveAdmin
  module Views
    class Footer < Component
      def build(namespace)
        super :id => 'footer'

        div(class: 'footer-content') do
          div(class: 'footer-left') do
            ul do
              li 'CENTRO UNIVERSITARIO DEL SUR'
              li 'Av. Enrique Arreola Silva No. 883, Colonia Centro'
              li 'C.P. 49000, Ciudad Guzmán, Jalisco, México'
              li 'Teléfono: +52 (341) 575 2222. Fax 01 (341) 5752223'
            end
          end
          div(class: 'footer-right') do
            ul do
              li 'Sitio desarrollado por:'
              li do
                image_tag(asset_url('logo_cta.png'), size: "50x50", alt: 'footer-cta-logo')
              end
            end
          end
        end
      end

    end
  end
end