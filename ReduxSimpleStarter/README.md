# Design
1. Draw a mock up of the app e.g. video player with search bar and video player.
2. Break down each element of the design into a component e.g. SearchBar, VideoDetail.
3. Establish and draw a component hierarchy.
```
       App
        |
     -----------
     |          |
 SearchBar  VideoDetail 
```

# Basic React Concepts

## JSX
### Conversion
Babel converts ES6 JS and/or JSX to ES5 JS.

To see what it actually converts to you can go to [babel](https://babeljs.io/repl).

### Styling
```html
<div style="background-color: red;"></div>
```
We provide a JS object instead.
```jsx
<div style={{ backgroundColor: 'red'}}></div>
```
#### Syntax
```html
<div class="sidebar" for="name"></div>
```
In JSX, class and for become className and htmlFor as both are already sytax in JS.
```jsx
<div className="sidebar" htmlFor="name"></div>
```

#### JS Variables
JS variables can be parsed to to HTML using curly braces.
```js
<div>{buttonText}</div>
<p>{buttonFunc()}</p>
```

## Props
A system for passing data from a parent to a child component. Kind of like parsing properties to a class.
```jsx
// parsing props.name to Mega component
<Mega name='Sam' />
```
### Parsing Child Component
To parse a child component to a parent component. Everything between the Parent tags is parsed to parent as props.children (this could be a bunch of HTML code.
```jsx
<Parent>
  <Child
    name="Sam"
  />
</Parent>
```
To access the child component within the parent component.
```jsx
// children is the default props vaiable if none specified.
const Parent = (props) => {
  return (
    <div>{props.children}</div>
  );
};
```


## State
Allows you to rerender the page when a state variable is altered/set.
### Rules
- Only usable with class components.
- State is a JS object that contains data relevant to a component.
- Updating state on a component causes the conponent to instantly rerender.
- State must be initialised when a component is created.
- State can only be updated using the function setState.



## Arrow Function
```js
function f(args){
  return 2
}

// same as above
let f = (args) => 2
```


## Event Handeling
`onClick` executes a function when clicked.
```js
<button onClick={(e) => "active"}>
  Activate Lasers
</button>
```
`onChange` executes a function when text is changed.

## this Keyword
Essentialy same as self in python.

Some oddities are that `this` is not always bound to the class in a method and you will have to change it to an arrow function which will then bind it to our class.

Another way to resolve this is to use the `bind` keyword. but that is only used in legacy code now.
```js
class C {
  constructor() {
    this.method = this.method.bind(this)
  }

  method() {
    return "do stuff"
  }
}
```

## Promise
The Promise object represents the eventual completion (or failure) of an asynchronous operation, and its resulting value.
### then
The `then` keyword can be used to parse the returned object into another function.


## Asynchorous Function
An asynchronous function is a function which operates asynchronously via the event loop, using an implicit Promise to return its result.
To declare an asynchronous function

```js
aysnc multiply(n){
  var result = await resolveAfter2Seconds()
}
```

## Requests
### AJAX
This can be used to make requests to various APIs. It is asynchronous nature, which means it can communicate with the server, exchange data, and update the page without having to refresh the page.
### Axios
A library that makes using AJAX much easier.

## Controlled Vs Uncontrolled Elements
- Uncontrolled element/component is one in which information is stored in HTML. This would mean extracting it from the DOM.
- Controlled is one in which the information is centralised inside our react component (via state etc). Such that our reacxt application is what is driving our data is insode the app.


## Map
Kind of like a list comp.
```js
n = [1, 2, 3, 4]
m = n.map((x) => {
  x * 10
});

// m = [10, 20, 30, 40]
```
To extract attributes from an obj:
```js
const images = props.images.map(({ id, urls }) => {
  return (
    <img 
      key={id}
      src={urls.regular}
    />
  )
});
```


## Lists
JS assigns ids to a list element (kind of like an index). Place a key attribute into a html tag to ensure they are properly associated with the correct list item.


## Refs
The `ref` gives you access to a single DOM element.

We create `refs` in our constructor, assign them to instance variables, then pass to a particular JSX element as props.


## Libraries
### CDN CSS
#### Install
Go to [cdnjs](https://cdnjs.com) and copy the semantic.min.css path into public/index.html head tag:
```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" />
```

#### Usage
Go to [Semantics-UI](https://semantic-ui.com) click on sidebar and desired component (e.g. Card). Copy the desired image and copy into your component. All class names are already altered to actually CSS things.


### Faker
Fake data like address, avatars etc.
```bash
npm install faker
```
## API
### Unsplash
Stock image retrieval.


# Redux
## Definition
- State management library (manages react state globally)
- Not explicitly designed to work with React


*Action Creator*; a function that creates or returns a plain JS object (an action). 
*Action*; describes some change that we want to make to our data in our application. An action has a type and payload property. The type describes some change that we want to make inside of our data. The payload property describes some context around the changes that we want to make.
*Dispatch*; takes in an action, make copies of that object and then pass it off to a bunch of different places inside our app.
*Reducer*; takes in an action and some existing data. The data is then processed/altered using the value of the action and returned. The returned data can then be stored/centralised in a store.
*State*; central repository of all data created by our reducer.

## React-Redux
![](songs/docs/Redux-React.png?raw=true)
```
Provider <--- Store
   |
   |
  App
   |
   |
Connect <--- ActionCreators
   |
   |
Component
```
*Provider*;
Store is passed to the provider as a prop. Provider is rendered at the very top of our app hierarchy. Even above our App component, technically we are going to show the App within the Provider thing.
It provides the store to all the different components inside of the App.

*Connect*;
Connect communicates with the provider via context system, allowing to communicate through components. 
It requests the store from the provider which passes it to the Connect component which in turn passes it down to the Component.

The action creators are connected to the Connect component and passed down to the Component.

So now the store and actions are stored as props in the Component component.

```js
const mapStateToProps = (state) => {
  return { var: state.var }
}

// maps component props to reduc store state.
// makes actionCreators available in the components props and
// automatically dispatches them upon action execution.
export default connect(mapStateToProps, {actionCreator})(Component)
```

## Middelware
A function that gets called after every action we dispatch and can modify actions before they are passed onto the reducers.

Middelware can be applied by parsing it to the creatStore func.
```js
const store = createStore(reducers, applyMiddleware(thunk))

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.querySelector('#root')
);
```

## Redux-Thunk
Middleware that allows action creators to return functions, not just plain JS objects.

After dispatch, redux thunk detects whether the object given is a plain JS object or a function. If a plain object, the middleware passes it onto the reducers as normal. If a function is parsed, then the function is invoked with the dispatch and getState args.
