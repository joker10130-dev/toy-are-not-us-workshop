import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.css'],
})
export class ProductDetailComponent implements OnInit {
  constructor(private activatedRoute: ActivatedRoute) {}
  public state: any;

  ngOnInit(): void {
    this.state = JSON.parse(
      this.activatedRoute.snapshot.queryParamMap.get('toy')
    );
  }
}
