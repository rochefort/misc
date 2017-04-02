const {app, BrowserWindow, globalShortcut} = require('electron');

module.exports = class FormWindow {
  constructor() {
    this.window = null;
    this.start();
  }

  start() {
    app.on('ready', () => {
      this.createWindow();
      this.registerGlobalShortcut();
    });

    app.on('showForm', () => {
      this.window.show();
    });

    app.on('will-quit', () => {
      globalShortcut.unregisterAll();
    });
  }

  createWindow() {
    this.window = new BrowserWindow({
      title: 'ツイート',
      center: true,
      resizable: false,
      minimizable: false,
      maximizable: false,
      width: 300,
      height: 250,
      show: false
    });
    this.window.loadURL(`file://${__dirname}/../../html/form.html`);
  }

  registerGlobalShortcut() {
    const accelarator = 'CommandOrControl+Shift+N';
    if (globalShortcut.isRegistered(accelarator)) {
      return;
    }
    globalShortcut.register(accelarator, () => {
      this.window.show();
    });
  }
};
