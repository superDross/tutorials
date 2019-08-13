import axios from 'axios';
import UNSPLASH_KEY from '../API_KEYS';

/* Create axios instance with some default values.
 * This allows you you to this file instead of axios.
 */
export default axios.create({
  baseURL: 'https://api.unsplash.com',  
  headers: {
    Authorization: `Client-ID ${UNSPLASH_KEY}`
  }
});
