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

  static String fragment = """
  fragment userFragment on User {
      __typename
      _id
      firstName
      lastName
      picture
      email
      _company {
        _id
        name
      }
      _employee {
        _id
        firstName
      }
      token
    }
""";
  static Map<String, Map<String, String>> variables = {
    "input": {"email": "admin@admin.com", "password": "1234"}
  };
  static String test = """
  query login(\$input: userInput!) {
      login(input: \$input) {
        firstName
        lastName
      }
    }
""";
  static String loginQuery = """
  query login(\$input: userInput!) {
      login(input: \$input) {
        ...userFragment
      }
    }
    \${this.fragment}
""";
}
