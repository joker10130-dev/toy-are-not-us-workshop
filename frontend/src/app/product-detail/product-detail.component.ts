import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Product } from '../models/product';
@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.css'],
})
export class ProductDetailComponent implements OnInit {
  constructor(private activatedRoute: ActivatedRoute) {}
  public state: Product;

  ngOnInit(): void {
    this.state = JSON.parse(
      this.activatedRoute.snapshot.queryParamMap.get('toy')
    );
  }
}
