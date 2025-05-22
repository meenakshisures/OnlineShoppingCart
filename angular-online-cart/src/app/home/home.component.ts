import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

export interface Product {
  name: string;
  price: number;
  image: string;
  description: string;
}

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  productList: Product[] = [
    {
      name: 'Pen',
      price: 20,
      image: 'https://picsum.photos/64/64?random=1',
      description:
        'On the other hand, we denounce with righteous indignation and dislike',
    },
    {
      name: 'Pencil',
      price: 10,
      image: 'https://picsum.photos/64/64?random=7',
      description:
        'men who are so beguiled and demoralized by the charms of pleasure of the',
    },
    {
      name: 'Paper',
      price: 30,
      image: 'https://picsum.photos?random=5',
      description:
        ' These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.',
    },
  ];
  constructor(private route: ActivatedRoute) {}

  ngOnInit(): void {
    console.log('home');
    this.route.queryParamMap.subscribe((x) => {
      console.log(x);
    });
  }
}
