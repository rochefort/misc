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
  tagName: 'li',
  template: _.template($('#task-template').html()),
  render: function() {
    var template = this.template(this.model.toJSON());
    this.$el.html(template);
    return this;
  }
});

// Colection
var Tasks = Backbone.Collection.extend({
  model: Task
});
var tasks = new Tasks([
  {
    titel: 'task1',
    completed: true
  },
  {titel: 'task2'},
  {titel: 'task3'},
]);
console.log(tasks.toJSON());
})();
