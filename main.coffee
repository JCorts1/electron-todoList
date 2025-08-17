{app, BrowserWindow} = require 'electron'
path = require 'path'

createWindow = ->
  # Create the browser window.
  win = new BrowserWindow
    width: 800
    height: 600
    webPreferences:
      preload: path.join(__dirname, 'preload.js') # We won't use a preload script, but this is good practice
      nodeIntegration: yes # Allow Node.js APIs in the renderer
      contextIsolation: no # Required for nodeIntegration to work in older Electron versions

  # and load the index.html of the app.
  win.loadFile 'index.html'

# This method will be called when Electron has finished initialization
app.whenReady().then ->
  createWindow()

  # For macOS
  app.on 'activate', ->
    if BrowserWindow.getAllWindows().length is 0
      createWindow()

# Quit when all windows are closed, except on macOS.
app.on 'window-all-closed', ->
  if process.platform isnt 'darwin'
    app.quit()
