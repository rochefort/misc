function getURL(URL) {
  return new Promise(function(resolve, reject) {
    var req = new XMLHttpRequest();
    req.open('GET', URL, true);
    req.onload = function() {
      if (req.status === 200) {
        resolve(req.responseText);
      } else {
        reject(new Error(req.statsText));
      }
    };
    req.onerror = function() {
      reject(new Error(req.statsText))
    };
    req.send();
  });
}

var URL = "http://httpbin.org/get";
getURL(URL).then(function onFulfilled(value) {
  console.log(value);
}).catch(function onRejected(error) {
  console.error(error);
});

var URL = "http://httpbin.org/status/500";
getURL(URL).then(function onFulfilled(value){
  console.log(value);
}).catch(function onRejected(error){
  console.error(error);
});
