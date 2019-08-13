import React from 'react';
import ReactDOM from 'react-dom';
import SeasonDisplay from './SeasonDisplay';
import Spinner from './spinner';


class App extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = { lat: null, errorMessage: '' };
  }

  // state can be written outside the constructor,
  // as the constructor is not needed
  // state = { lat: null, errorMessage: '' };

  // executed after the component is mountedinto the DOM.
  componentDidMount() {
    window.navigator.geolocation.getCurrentPosition(
      position => this.setState({ lat: position.coords.latitude }),
      err => this.setState({errorMessage: err.message})
    );
  }

  renderContent() {
    if (this.state.lat && !this.state.errorMessage) {
      return <SeasonDisplay lat={this.state.lat} />
    }
    if (!this.state.lat && this.state.errorMessage) {
      return <div>Error: {this.state.errorMessage} </div>
    }
    return <Spinner text='Please allow location access.'/>;
  }

  render() {
    return (
      <div className="border red">
        {this.renderContent()}
      </div>
    );
  }
}


ReactDOM.render(
  <App />,
  document.querySelector('#root')
);
