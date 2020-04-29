import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Todo } from './todo.entity';
import { Repository } from 'typeorm';

@Injectable()
export class TodoService {

    constructor(
        @InjectRepository(Todo)
        private repository: Repository<Todo>,
    ) { }

    async findAll(): Promise<Todo[]> {
        return await this.repository.find({ order: { id: "DESC" } });
    }

    async findOne(id: string): Promise<Todo> {
        return await this.repository.findOne(id);
    }

    async save(description: string): Promise<Todo> {
        return await this.repository.save(new Todo(description));
    }

    async update(todo: Todo): Promise<any> {
        todo.done = todo.done + '' == 'true';
        return await this.repository.update(todo.id, todo);
    }

    async remove(id: number): Promise<void> {
        await this.repository.delete(id);
    }

}
