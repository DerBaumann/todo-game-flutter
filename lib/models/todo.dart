class Todo {
  final String name;
  final int points;
  bool checked = false;

  void toggle() {
    checked = !checked;
  }

  Todo(this.name, this.points);
}