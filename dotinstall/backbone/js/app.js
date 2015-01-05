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
var taskView = new TaskView({model: task});
console.log(taskView.render().el);
$('body').append(taskView.render().el);
})();
