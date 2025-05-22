import { Component } from '@angular/core';

interface ABC {
  name: string;
  age: number;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title: string = 'angular-online-cart';
  ip: string = 'test';
  abc!: ABC;
  abc2!: object;

  clickFunction(no: number): void {
    console.log('Clicked', no);
  }
}
