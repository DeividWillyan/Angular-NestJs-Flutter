import { Module } from '@nestjs/common';
import { TodoService } from './todo.service';
import { TodoController } from './todo.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Todo } from './todo.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([Todo]),
  ],
  providers: [TodoService],
  controllers: [TodoController]
})
export class TodoModule {}
