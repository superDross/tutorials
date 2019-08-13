import React from 'react';
import { connect } from 'react-redux';
import { selectSong } from '../actions';


class SongList extends React.Component {
  // due to connect, props will contain:
  //   - songs list present in the redux store
  //   - dispatch function reference
  //   - actionCreator selectSong

  renderList() {
    // pressing the button will initiate the selectSong action creator
    // with the parsed song. this will then be processed by the reducer
    // to place the selectedSong inside the store.
    return this.props.songs.map((song) => {
      return (
        <div className='item' key={song.title}>
          <div className='right floated content'>
            <button 
              className='ui button primary'
              onClick={() => this.props.selectSong(song)}
            >
              Select
            </button>
          </div>
          <div className='content'>{song.title}</div>
        </div>
      )
    })
  }

  render() {
    return <div className='ui divided list'>{this.renderList()}</div>
  }
}


const mapStateToProps = (state) => {
  return { songs: state.songs }
}


// Take our songs state objects from the Redux store,
// and place them as props in our SongList component.
// also, pass the action creator so the SongList can have
// it inside its props and it automatically dispatches when it
// is called.
export default connect(mapStateToProps, {selectSong})(SongList)
