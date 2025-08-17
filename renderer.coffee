document.addEventListener 'DOMContentLoaded', ->
  input = document.getElementById 'todo-input'
  addButton = document.getElementById 'add-button'
  list = document.getElementById 'todo-list'

  addTask = ->
    taskText = input.value.trim()

    # if taskText isn't empty
    if taskText
      # Create a new list item
      li = document.createElement 'li'
      li.textContent = taskText
      list.appendChild li

      # Clear the input field
      input.value = ''

      # Add a click event to remove the item
      li.addEventListener 'click', ->
        list.removeChild li

  addButton.addEventListener 'click', addTask

  # Allow pressing Enter to add a task
  input.addEventListener 'keyup', (event) ->
    if event.key is 'Enter'
      addTask()
