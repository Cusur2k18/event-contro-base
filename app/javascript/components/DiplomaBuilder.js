import React from "react"
import SelectSearch from 'react-select-search'
import PropTypes from 'prop-types'

class DiplomaBuilder extends React.Component {

  state = {
    selectedEvent: '',
    image: '',
    events: [
      {name: 'Swedish', value: 'sv'},
      {name: 'English', value: 'en'},
      {name: 'Germany', value: 'gm'},
      {name: 'Italy', value: 'it'},
      {name: 'London', value: 'ln'},
      {name: 'Mexico', value: 'mx'},
      {name: 'Canada', value: 'cn'},
  ]
  }

  showUploader = () => {
    const uploader = window.cloudinary.createUploadWidget({ cloudName: "crystalstream", uploadPreset: "buv4mps0" }, (error, result) => {
      console.log(error)
      console.log(result)
     });
     
    uploader.open()
  }

  render () {
    return (
      <React.Fragment>
        <div className="diploma-builder">
          <section className="bordered">
            <div className="diploma-builder-item header">
              <div className="item-title">
                <span>1.- Escoge un evento</span>
              </div>
              <div className="item-body">
                <SelectSearch 
                  options={this.state.events} 
                  value={this.state.selectedEvent}
                  name="Evento"
                  placeholder="Escoge un evento" />
              </div>
            </div>
            <div className="diploma-builder-item subheader">
              <div className="item-title">
                <span>2.- Sube la base del diploma</span>
              </div>
              <div className="item-body">
                <button onClick={this.showUploader}>Subir foto</button>
              </div>
            </div>
          </section>

          <section className="bordered with-sidebar">
            <div className="diploma-builder-item body">
              <div className="item-title">
                <span>3.- Arrastra los components</span>
              </div>

              <div className="outter">
                <div className={`diploma-builder__body--container ${this.state.image ? 'has-image' : 'no-image'}`}>
                { this.state.image && <img src={this.state.image.src} alt={this.state.image.name} />}
                </div>
              </div>
            </div>


            <div className="sidebar">
              <section className="bordered">
                <div className="diploma-builder-item">
                  <div className="item-title center">
                    <span>Elementos</span>
                  </div>
                  <div className="sidebar-tools">


                    <ul className="tools">


                      <li className="item-tool" draggable>
                        <span>[NOMBRE_DEL_ALUMNO]</span>
                      </li>
                      <li className="item-tool" draggable>
                        <span>[NOMBRE_DEL_ALUMNO]</span>
                      </li>
                      <li className="item-tool" draggable>
                        <span>[NOMBRE_DEL_ALUMNO]</span>
                      </li>
                      <li className="item-tool" draggable>
                        <span>[NOMBRE_DEL_ALUMNO]</span>
                      </li>
                      <li className="item-tool" draggable>
                        <span>[NOMBRE_DEL_ALUMNO]</span>
                      </li>


                    </ul>



                  </div>
                </div>
              </section>
            </div>



          </section>
        </div>
      </React.Fragment>
    );
  }
}

export default DiplomaBuilder
