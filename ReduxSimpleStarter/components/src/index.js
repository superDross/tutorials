import React from 'react';
import ReactDOM from 'react-dom';
import faker from 'faker';
import CommentDetail from './CommentDetail';
import ApprovalCard from './ApprovalCard';


const App = () => {
  return (
    <div className="ui container comments">
      <ApprovalCard>
        <CommentDetail 
          author="Sam" 
          date="6:00pm" 
          comment="You Suck!"
          avatar={faker.image.avatar()}
        />
      </ApprovalCard>
      <ApprovalCard>
        <CommentDetail 
          author="James" 
          date="6:09pm" 
          comment="*Crys*"
          avatar={faker.image.avatar()}
        />
      </ApprovalCard>
    </div>
  );
};


ReactDOM.render(<App />, document.querySelector('#root'));
