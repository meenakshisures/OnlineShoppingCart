import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Route, Router } from '@angular/router';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html'
})
export class ProductComponent implements OnInit {
  productId: string | null = null;

  constructor(private route: ActivatedRoute,private routes:Router) {}

  ngOnInit(): void {
    // Subscribe to route param changes
    this.route.paramMap.subscribe(params => {
      this.productId = params.get('id');
      if(isNaN(+this.productId)){
      console.error("Not valid")
      this.routes.navigate(['home'])
      }
    });
  }
  
}
