import 'package:graphql_flutter/graphql_flutter.dart';

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

  static final fragment = gql("""
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
""");
  static Map<String, Map<String, String>> getCredentials(email, pass) => {
        "input": {"email": "admin@admin.com", "password": "1234"}
      };
  static final loginQuery = gql('''
  query login(\$input: userInput!) {
      login(input: \$input) {
        firstName
        lastName
        token
      }
    }
''');
  static final list = gql('''
  query employees(\$input:employeeInput){
      employees(input:\$input) {
        _id
        firstName
        email
    		company
    		_groups{
          name
        }
      }
    }
    
    
''');
  /* = gql('''
  query login(\$input: userInput!) {
      login(input: \$input) {
        ...userFragment
      }
    }
''')..definitions.addAll(User.fragment.definitions);*/
}
