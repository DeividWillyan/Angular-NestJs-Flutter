import { Component, OnInit } from '@angular/core';
import { TodoService } from './todo.service';
import { Todo } from './todo.model';

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html',
  styleUrls: ['./todo.component.css']
})
export class TodoComponent implements OnInit {

  constructor(private service: TodoService) { this.findAll(); }

  todos: Todo[];
  todo: Todo = new Todo();
  description: string;

  ngOnInit(): void { }

  findAll(): void {
    this.service.findAll()
      .subscribe(data => {
        this.todos = data;
        this.description = '';
      });
  }

  done(todo: Todo) {
    todo.done = true;
    this.update(todo);
  }

  update(todo: Todo) {
    this.service.update(todo)
      .subscribe(_ => { this.findAll(), this.todo = new Todo() });
  }

  create() {
    if (this.todo.description !== undefined && this.todo.description.trim() !== '') {
      this.service.create(this.todo.description)
        .subscribe(_ => { this.findAll(), this.todo = new Todo() });
    }
  }

  remove(id: number) {
    this.service.delete(id)
      .subscribe(_ => this.findAll());
  }

  prepareUpdate(todo: Todo) {
    this.todo = todo;
  }


}
