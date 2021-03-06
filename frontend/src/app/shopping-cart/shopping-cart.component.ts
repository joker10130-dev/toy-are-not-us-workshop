import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { ToyCart } from '../models/toy-cart';
import { Router } from '@angular/router';

@Component({
  selector: 'app-shopping-cart',
  templateUrl: './shopping-cart.component.html',
  styleUrls: ['./shopping-cart.component.css'],
})
export class ShoppingCartComponent implements OnInit {
  constructor(private service: ApiService, private router: Router) {}
  public carts: ToyCart[];
  public allItemQuantities = 0;
  public totalPrice = 0;
  public shippingFee = 35;
  ngOnInit(): void {
    this.getAllCarts();
  }
  getAllCarts(): void {
    this.service.getCarts().subscribe((carts) => {
      for (const item of carts) {
        this.allItemQuantities += Number(item.quantity);
        this.totalPrice += Number(item.price);
      }
      return (this.carts = carts);
    });
  }
  removeCart(id: string): void {
    this.service.removeCart(id).subscribe((responseData) => {
      console.log(responseData);
      window.location.reload();
    });
  }
  checkout(id: string): void {
    this.service.removeCart(id).subscribe((responseData) => {
      console.log(responseData);
      this.router.navigate(['shipping'], {
        queryParams: { order: JSON.stringify(this.carts) },
      });
    });
  }
}
