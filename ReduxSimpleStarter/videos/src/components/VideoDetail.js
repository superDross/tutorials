import React from 'react';

const VideoDetail = ({ video }) => {
  if (!video) {
    return (
      <div class="ui large active centered inline loader"></div>
    );
  } 

  const video_url = `https://www.youtube.com/embed/${video.id.videoId}`

  return (
    <div>
      <div className='ui embed'>
        <iframe title="video player" src={video_url} />
      </div>
      <div className="ui segment">
        <h4 className="ui header">{video.snippet.title}</h4>
        <p>{video.snippet.description}</p>
      </div>
    </div>
  );
};

export default VideoDetail;
