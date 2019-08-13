import { combineReducers } from 'redux';

const songsReducer = () => {
  return [
    { title: 'No Scrubs', duration: '4:05' },
    { title: 'This Song Is About Yer Maw', duration: '69:69' },
    { title: 'Nut Flicker', duration: '0:05'},
    { title: 'Eating Burgers On a Rhino', duration: '2:30' },
  ];
};


const selectedSongReducer = (selectedSong=null, action) => {
  if (action.type === 'SONG_SELECTED') {
    return action.payload;
  }
  return selectedSong
}


export default combineReducers({
  songs: songsReducer,
  selectedSong: selectedSongReducer
});
