import { createStore } from 'redux'

function counter(state = {counter: 0}, action) {
  return state
}

const store = createStore(counter)
console.log(store.getState())
