// ES5 way of importing
var Redux = require('redux')

// ACTION CREATORS
// they represent various forms
const createPolicy = (name, amount) => {
  // returns an ACTION
  return {
    type: 'CREATE_POLICY',
    payload: {
      name: name,
      amount: amount
    }
  }
}

const deletePolicy = (name) => {
  return {
    type: 'DELETE_POLICY',
    payload: {
      name: name
    }
  }
}

const createClaim = (name, amountClaimed) => {
  return {
    type: 'CREATE_CLAIM',
    payload: {
      name: name,
      amountClaimed: amountClaimed
    }
  }
}


// REDUCERS
// each reducer models a department
const claimsHistory = (oldClaims=[], action) => {
  if (action.type == 'CREATE_CLAIM') {
    // update claims with new one by creating a new list
    return [...oldClaims, action.payload]
  }
  return oldClaims
}

// bagOfMoney represents the amount of money the company has
const accounting = (bagOfMoney=100, action) => {
  if (action.type === 'CREATE_CLAIM') {
    return bagOfMoney - action.payload.amountClaimed
  } else if (action.type === 'CREATE_POLICY') {
    return bagOfMoney + action.payload.amount
  }
  
  return bagOfMoney
}

const policies = (policyList=[], action) => {
  if (action.type === 'CREATE_POLICY') {
    return [...policyList, action.payload.name]
  } else if (action.type === 'DELETE_POLICY') {
    // produces a new list after removing value
    return policyList.filter(name => name !== action.payload.name)
  }
  
  return policyList
}


// STORE
const { createStore, combineReducers } = Redux

// combine all our reducers
const ourDepartments = combineReducers({
  // the returned value from each reducer is stored in this dict
  accounting: accounting,
  claimsHistory: claimsHistory,
  policies: policies
})

// add all our reducers to a store
const store = createStore(ourDepartments)

// DISPATCH
// passing the dispatch function to the store results in it being parsed to all of our reducers in the store
const action = createPolicy('David', 20)
store.dispatch(action)

// TEST
store.dispatch(createPolicy('Jim', 40))
store.dispatch(createPolicy('Ben', 50))
console.log('Create Policies\n', store.getState())

store.dispatch(createClaim('Jim', 20))
console.log('\nCreate Claim\n', store.getState())

store.dispatch(deletePolicy('David'))
console.log('\nDelete Policy\n', store.getState())
