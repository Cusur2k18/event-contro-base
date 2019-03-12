import React from 'react'
import ToolItem from './ToolItem'

class Tools extends React.Component {

  onDragStart = () => {
    console.log('start')
  }

  onDragStop = () => {
    console.log('end')
  }

  onDrag(e, ui) {
    console.log(e)
    console.log('--------------')
    console.log(ui)
  }

  render () {
    return (
      <React.Fragment>
        <div className="sidebar-tools">
          <ul className="tools">

            <ToolItem onStart={this.onDragStart} onStop={this.onDragStop} onDrag={this.onDrag}>
             [NOMBRE_DEL_ALUMNO]
            </ToolItem>

            <ToolItem>
             [NOMBRE_DEL_ALUMNO]
            </ToolItem>

            <ToolItem>
             [NOMBRE_DEL_ALUMNO]
            </ToolItem>

          </ul>
        </div>
      </React.Fragment>
    );
  }
}

export default Tools
