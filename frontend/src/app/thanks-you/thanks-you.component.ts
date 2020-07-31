import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { Address } from '../models/address';
import { ActivatedRoute } from '@angular/router';
import { ToyCart } from '../models/toy-cart';

@Component({
  selector: 'app-thanks-you',
  templateUrl: './thanks-you.component.html',
  styleUrls: ['./thanks-you.component.css'],
})
export class ThanksYouComponent implements OnInit {
  constructor(
    private service: ApiService,
    private activatedRoute: ActivatedRoute
  ) {}
  public state: ToyCart[];
  public address: Address;
  public allItemQuantities = 0;
  public totalPrice = 0;
  public shippingFee = 35;
  ngOnInit(): void {
    this.state = JSON.parse(
      this.activatedRoute.snapshot.queryParamMap.get('order')
    );
    for (const item of this.state) {
      this.allItemQuantities += Number(item.quantity);
      this.totalPrice += Number(item.price);
    }
    console.log(this.state);
    this.getMockAddress();
    console.log(this.address);
  }
  getMockAddress(): void {
    this.address = this.service.getAddress();
  }
}
