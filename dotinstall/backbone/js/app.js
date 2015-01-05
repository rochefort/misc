(function() {
// Model
var Task = Backbone.Model.extend({
  defaults: {
    title: 'do something!',
    completed: false
  },
  validate: function(attrs) {
    if (_.isEmpty(attrs.title)) {
      return "title must not be empty!";
    }
  },
});

var task = new Task();

var TaskView = Backbone.View.extend({
  tagName: 'li'
});
var taskView = new TaskView({model: task});
console.log(taskView.$el);

})();
