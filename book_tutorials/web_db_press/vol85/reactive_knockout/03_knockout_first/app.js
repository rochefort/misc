function ViewModel() {
  this.email = ko.observable();
}

ko.applyBindings(new ViewModel());
