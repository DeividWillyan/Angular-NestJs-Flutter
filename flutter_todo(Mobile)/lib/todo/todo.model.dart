class Todo {
  String description;
  int id;
  bool done;

  Todo({this.description, this.id, this.done});

  Todo.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['done'] = this.done;
    return data;
  }
}
