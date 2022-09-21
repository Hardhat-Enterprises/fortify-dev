import React from 'react';

const Protected = (props) => {
  return (
    <div>
        {props.name ? 'Hi ' + props.name : 'You are not logged in'}
    </div>
  );
};

export default Protected;