import React from 'react';

export const wrap = (component) => {
    return class extends React.Component {
        constructor(props) {
            super(props);
            this.props = props;
        }

        render () {
            return React.createElement(component, this.props);
        }
    }
}
