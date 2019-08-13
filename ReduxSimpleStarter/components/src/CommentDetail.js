import React from 'react';


const CommentDetail = (props) => {
  return (
      <div className="comment">
        <a className="avatar" href="/">
          <img alt="avatar" src={props.avatar} />
        </a>
        <div className="content">
          <a className="author" href="/">
            {props.author}
          </a>
          <div className="metadata">
            <span className="date">
              {props.date}
            </span>
          </div>
          <div className="text">
            {props.comment}
          </div>
        </div>
      </div>
  );
};


// allow component to be import-able
export default CommentDetail;
