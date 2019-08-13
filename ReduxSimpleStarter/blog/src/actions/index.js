import jsonPlaceholder from '../apis/jsonPlaceholder'

// doesn't work as you must return a plain js
// object from the action creator however the
// response var is async-await syntax is not 
// plain JS object.
//

// The whole Action creation to reducer steps take a fraction of 
// a second which finishes before we can fetch our data from an API.
// 
// So the action has been processed before we fetch our data.
//
//
// export const fetchPost = async () => {
//   const response = await jsonPlaceholder.get('/posts')
//   return {
//     type: 'FETCH_POSTS',
//     payload: response
//   }
// }

// With redux-thunk:
// I am not sure why this syntax is used.
//
// async action creator
export const fetchPosts = () => async dispatch => {
  const response = await jsonPlaceholder.get('/posts')

  dispatch( {
    type: 'FETCH_POSTS',
    payload: response
  })
}
