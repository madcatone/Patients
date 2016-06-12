var React = require('react');
var renderReact = require('hypernova-react').renderReact;

function MyComponent(props) {
  return React.createElement('div', {
    onClick: function () {
      alert('Click handlers work.');
    },
  }, 'Hello, ' + props.name + '!' + ',And' + props.params[0]["id"]);
}

module.exports = renderReact('MyComponent.js', MyComponent);
