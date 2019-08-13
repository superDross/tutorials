import React from 'react';


class ImageCard extends React.Component {
  constructor(props) {
    super(props);

    this.state = { spans: 0 };

    // create ref to get access to DOM elements
    this.imageRef = React.createRef()
  }

  componentDidMount() {
    // Executes the given function after the image has loaded in the DOm
    this.imageRef.current.addEventListener('load', this.setSpans);
  }

  // arrow function so it can access `this`
  setSpans = () => {
    const height = this.imageRef.current.clientHeight;
    // grid-gap value described in css file
    const gridGap = 10
    // Number of spans/pixels to seperate each image by
    const spans = Math.ceil(height / gridGap)
    this.setState({ spans: spans });
  } 

  render() { 
    const { description, urls } = this.props.image;

    // Parse ref as an atttribute to the img element to store the resulting
    // DOM element as this.imageRef.
    // Parse the span value to grid-row-end style.
    return (
      <div style={{ gridRowEnd: `span ${this.state.spans}`}}>
        <img ref={this.imageRef} alt={description} src={urls.regular} />
      </div>
    );
  }
}

export default ImageCard;
