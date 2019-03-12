import React from 'react'
import Draggable from 'react-draggable'

export default function ToolItem(props) {

  const dragHandlers = {onStart: props.onStart, onStop: props.onStop, onDrag: props.onDrag};

  return (
    <React.Fragment>
      <Draggable
        {...dragHandlers}>
          <li className="item-tool">
            {props.children}
          </li>
      </Draggable>
    </React.Fragment>
  );
}