import React from 'react';
import SearchBar from './SearchBar';
import youtube from '../apis/youtube';
import VideoList from './VideoList';
import VideoDetail from './VideoDetail';

class App extends React.Component {
  state = { videos: [], selectedVideo: null };
  
  componentDidMount() {
    // parse a default search term
    this.onTermSubmit('Adventure Time');
  }

  onTermSubmit = async term => {
    // search youtube API with term
    const response = await youtube.get('/search', {
      params: {
        q: term
      }
    });
    
    // default video displayed being the first one within the search results
    this.setState({
      videos: response.data.items,
      selectedVideo: response.data.items[0]
    })

  };

  // callback function
  onVideoSelect = (video) => {
    this.setState({selectedVideo: video });
  };

  render() {
    return (
      <div className="ui container">
        <SearchBar onVideoSelect={this.onVideoSelect} onTermSubmit={this.onTermSubmit} />
        <div className="ui grid">
          <div className="ui row">
            <div className="eleven wide column">
              <VideoDetail video={this.state.selectedVideo} />
            </div>
            <div className="five wide column">
              <VideoList 
                onVideoSelect={this.onVideoSelect}
                videos={this.state.videos} 
              />
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
