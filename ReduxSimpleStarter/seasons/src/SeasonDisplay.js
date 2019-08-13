import './SeasonDisplay.css'
import React from 'react';

// functional based components are much more difficult to understand, vompare this to the inde.js

const seasonConfig = {
  summer: {
    text: 'Lets hit the sun!',
    iconName: 'sun'
  },
  winter: {
    text: 'Brr, it is chilly.',
    iconName: 'snowflake'
  }
};


// returns season string determined by latitude and month
const getSeason = (lat, month) => {
  if (month > 2 && month < 9) {
    return lat > 0 ? 'summer' : 'winter'
} else {
    return lat > 0 ? 'winter' : 'summer'
  }
}


const SeasonDisplay = (props) => {
  var month = new Date().getMonth();
  const season = getSeason(props.lat, month);
  const { text, iconName } = seasonConfig[season]

  // backticks thing lets you declare a variable and
  // use the string icon e.g. 
  //   'snowflake icon' == {`S{iconName}` icon}
  return (
    <div className={`season-display ${season}`}>
      <i className={`icon-left massive ${iconName} icon`}/>
      <h1>{text}</h1>
      <i className={`icon-right massive ${iconName} icon`}/>
    </div>
  );
};

export default SeasonDisplay;
