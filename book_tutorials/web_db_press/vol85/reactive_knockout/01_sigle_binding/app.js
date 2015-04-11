function ViewModel() {
    this.email = observable();
}

function observable() {
    var value;
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
        observable['subscriber'](value);
    };
    return observable;
}

function bindViewModel(viewModel) {
  var props = Object.getOwnPropertyNames(viewModel);
  props.forEach(function(prop) {
    var view = document.getElementById(prop);
    var prop = viewModel[prop];

    // ViewModel -> View
    prop.subscriber = function(newValue) {
      view.value = newValue;
    };

    // View -> ViewModel
    view.addEventListener('input', function(e) {
      prop(e.target.value);
    });
  });
}

var viewModel = new ViewModel();
bindViewModel(viewModel);
viewModel.email('terasawan@gmail.com');
