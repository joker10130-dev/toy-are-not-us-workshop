import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { ToyCart } from '../models/toy-cart';

@Component({
  selector: 'app-shopping-cart',
  templateUrl: './shopping-cart.component.html',
  styleUrls: ['./shopping-cart.component.css'],
})
export class ShoppingCartComponent implements OnInit {
  constructor(private service: ApiService) {}
  public carts: ToyCart[];
  public allItemQuantities = 0;
  ngOnInit(): void {
    this.getAllCarts();
  }
  getAllCarts(): void {
    this.service.getCarts().subscribe((carts) => {
      for (const item of carts) {
        this.allItemQuantities += Number(item.quantity);
      }
      return (this.carts = carts);
    });
  }
  removeCart(id: number): void {
    this.service.removeCart(id).subscribe((responseData) => {
      console.log(responseData);
      window.location.reload();
    });
  }
}
