import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ToyCart } from '../models/toy-cart';
import { Router } from '@angular/router';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css'],
})
export class PaymentComponent implements OnInit {
  constructor(private activatedRoute: ActivatedRoute, private router: Router) {}
  public carts: ToyCart[];
  public allItemQuantities = 0;
  public totalPrice = 0;
  public shippingFee = 35;
  ngOnInit(): void {
    this.carts = JSON.parse(
      this.activatedRoute.snapshot.queryParamMap.get('order')
    );
    for (const item of this.carts) {
      this.allItemQuantities += Number(item.quantity);
      this.totalPrice += Number(item.price);
    }
  }
  placeOrder(): void {
    this.router.navigate(['thanks-you'], {
      queryParams: { order: JSON.stringify(this.carts) },
    });
  }
}
