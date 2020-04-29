// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoController on _TodoControllerBase, Store {
  final _$todosAtom = Atom(name: '_TodoControllerBase.todos');

  @override
  List<Todo> get todos {
    _$todosAtom.context.enforceReadPolicy(_$todosAtom);
    _$todosAtom.reportObserved();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.context.conditionallyRunInAction(() {
      super.todos = value;
      _$todosAtom.reportChanged();
    }, _$todosAtom, name: '${_$todosAtom.name}_set');
  }

  final _$fetchTodosAsyncAction = AsyncAction('fetchTodos');

  @override
  Future fetchTodos() {
    return _$fetchTodosAsyncAction.run(() => super.fetchTodos());
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future create(String description) {
    return _$createAsyncAction.run(() => super.create(description));
  }

  final _$removeAsyncAction = AsyncAction('remove');

  @override
  Future remove(int id) {
    return _$removeAsyncAction.run(() => super.remove(id));
  }
}
