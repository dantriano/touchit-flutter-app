class User {
  int id;
  String task = "";
  bool isCompleted = false;
  User.fromElements(int id, String task, bool isCompleted) {
    this.id = id;
    this.task = task;
    this.isCompleted = isCompleted;
  }
  Map toJson() {
    Map jsonData = {
      "__typename": "todos",
      "id": id,
      "title": task,
      "is_completed": isCompleted,
    };
    return jsonData;
  }
}
