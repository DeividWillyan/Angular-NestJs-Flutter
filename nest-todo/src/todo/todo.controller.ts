import { Controller, Post, Body, Get, Put, Delete, Param } from '@nestjs/common';
import { TodoService } from './todo.service';
import { Todo } from './todo.entity';

@Controller('todo')
export class TodoController {

  constructor(private service: TodoService) { }

  @Post()
  async create(@Body('description') description: string) {
    return await this.service.save(description);
  }

  @Get()
  async listAllTodos() {
    return await this.service.findAll();
  }

  @Put()
  async updateTodo(@Body() todo: Todo) {
    return await this.service.update(todo);
  }

  @Delete(':id')
  async removeTodo(@Param('id') id: number) {
    return await this.service.remove(id);
  }

}
