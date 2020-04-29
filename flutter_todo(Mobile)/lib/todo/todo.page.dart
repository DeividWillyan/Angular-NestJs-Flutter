import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_todo/todo/todo.controller.dart';
import 'package:flutter_todo/todo/todo.model.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TodoController _controller = new TodoController();
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo APP'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _controller.fetchTodos();
            },
          )
        ],
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () => _modelAddTodo(context),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _controller.todos?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            Todo _todo = _controller.todos[index];
            return ListTile(
              title: Text(_todo.description),
              leading: Checkbox(
                activeColor: Colors.white,
                checkColor: Colors.black,
                value: _todo.done,
                onChanged: (val) => {_todo.done = val, _updateTodo(_todo)},
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _controller.remove(_todo.id);
                },
              ),
              onLongPress: () {
                _textEditingController.text = _todo.description;
                _modelAddTodo(context, todo: _todo);
              },
            );
          },
        );
      }),
    );
  }

  _modelAddTodo(context, {Todo todo}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(todo != null ? 'Update todo' : 'Create todo'),
          content: TextFormField(
            controller: _textEditingController,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                todo != null ? _updateTodo(todo) : _addTodo();
              },
              child: Text('Save'),
            )
          ],
        );
      },
    ).then((_) => {_textEditingController.clear()});
  }

  _addTodo() async {
    if (_validInput()) {
      await _controller.create(_textEditingController.text);
      Navigator.pop(context);
    }
  }

  _updateTodo(Todo todo) async {
    if (_validInput()) {
      todo.description = _textEditingController.text;
      await _controller.update(todo);
      Navigator.pop(context);
      return;
    }
    await _controller.update(todo);
  }

  bool _validInput() {
    return (_textEditingController.text != null &&
        _textEditingController.text != '');
  }
}
