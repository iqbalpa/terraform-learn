import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }

  getHelloId(id: string): string {
    return `Hello id: ${id}`;
  }
}
