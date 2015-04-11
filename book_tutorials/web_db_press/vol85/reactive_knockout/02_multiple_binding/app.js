function ViewModel() {
    this.email = observable();
}

function observable() {
    var value;
    var subscribers = [];
    var observable = function(newValue) {
        if (typeof(newValue) === 'undefined') {
            // getter
            return value;
        } else {
            // setter
            value = newValue;
            observable.valueChanged();
        }
    };
    observable.valueChanged = function() {
        subscribers.forEach(function(subscriber) {
          subscriber(value);
        });
    };
    observable.addSubscriber = function(subscriber) {
      subscribers.push(subscriber);
    };
    return observable;
}

function bindViewModel(viewModel) {
  var props = Object.getOwnPropertyNames(viewModel);
  props.forEach(function(prop) {
    var views = document.querySelectorAll('[data-bind=' + prop + ']'),
    prop = viewModel[prop],
    i;
    // ViewModel -> View
    for (i = 0; i < views.length; i++) {
      prop.addSubscriber((function(view) {
        return function(newValue) {
          if (view.hasOwnProperty('value')) {
            view.value = newValue;
          } else {
            view.innerText = newValue;
          }
        };
      })(views[i]));
    }
    // View -> ViewModel
    for (i = 0; i < views.length; i++) {
      views[i].addEventListener('input', function(e) {
        prop(e.target.value);
      });
    };
  });
}

var viewModel = new ViewModel();
bindViewModel(viewModel);
viewModel.email('terasawan@gmail.com');
