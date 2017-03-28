function todos(state = [], action) {
  switch (action.type) {
  case 'ADD_TODO':
    return [
      ...state,
      { text: action.text, completed: false }
    ]
  case 'COMPLETE_TODO':
    const todos = state.slice(0)
    todos[action.id].completed = true
    return Object.assign({}, state, { todos: todos })
  default:
    return state
  }
}
export default todos
