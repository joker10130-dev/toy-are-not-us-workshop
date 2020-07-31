import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ApiService } from '../api.service';
import { Product } from '../models/product';
import { Router } from '@angular/router';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.css'],
})
export class ProductDetailComponent implements OnInit {
  constructor(
    private activatedRoute: ActivatedRoute,
    private formBuilder: FormBuilder,
    private service: ApiService,
    private router: Router
  ) {}
  public productForm: FormGroup;
  public state: Product;

  ngOnInit(): void {
    this.state = JSON.parse(
      this.activatedRoute.snapshot.queryParamMap.get('toy')
    );
    this.productForm = this.formBuilder.group({
      quantity: ['', Validators.required],
    });
  }
  onSubmit(quantity: string): void {
    this.service
      .setCart(
        {
          toyId: this.state.toyId,
          toyName: this.state.toyName,
          gender: this.state.gender,
          age: this.state.age,
          price: this.state.price,
          availability: this.state.availability,
          brand: this.state.brand,
          quantity: Number(quantity),
        },
        this.state.toyId
      )
      .subscribe((responseData) => {
        console.log(responseData);
        this.router.navigate(['shopping-cart']);
      });
  }
}
