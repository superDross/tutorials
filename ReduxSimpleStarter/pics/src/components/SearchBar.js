import React from 'react';

class SearchBar extends React.Component {
  state = { term: 'Type Here!'};

  onFormSubmit = (e) => {
    // Stops form from refreshing when user presses enter.
    e.preventDefault();
    // Parse the state value to the parent component upon submission.
    this.props.onSubmit(this.state.term);
  }
     
  // Value of state.term is present in text box.
  // Typing in the text box changes state.term
  render() {
    return (
      <div className="ui segment">
        <form className="ui form" onSubmit={this.onFormSubmit}>
          <div className="field">
            <label>Image Search</label>
            <input
              type="text"
              value={this.state.term}
              onChange={(e) => this.setState({ term: e.target.value})}
            />
          </div>
        </form>
      </div>
    );
  }
}

export default SearchBar;
