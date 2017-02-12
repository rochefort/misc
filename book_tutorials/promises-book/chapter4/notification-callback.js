function notifyMessage(message, options, callback) {
  if (typeof Notification === 'undefined') {
    callback(new Error('doesn\'t support Notification API'));
    return;
  }
  if (Notification.permission === 'granted') {
    var notification = new Notification(message, options);
    callback(null, notification);
  } else {
    Notification.requestPermission(function (status) {
      if (Notification.permission !== status) {
        Notification.permission = status;
      }
      if (status === 'granted') {
        var notification = new Notification(message, options);
        callback(null, notification);
      } else {
        callback(new Error('user denied'));
      }
    });
  }
}
// 実行例
// 第二引数は `Notification` に渡すオプションオブジェクト
notifyMessage("Hi!", {}, function (error, notification) {
  if(error){
    console.error(error);
    return;
  }
  console.log(notification);// 通知のオブジェクト
});