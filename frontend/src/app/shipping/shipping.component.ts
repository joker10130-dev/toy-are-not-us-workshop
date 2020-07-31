import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { Address } from '../models/address';
import { Router } from '@angular/router';

@Component({
  selector: 'app-shipping',
  templateUrl: './shipping.component.html',
  styleUrls: ['./shipping.component.css'],
})
export class ShippingComponent implements OnInit {
  constructor(private service: ApiService, private router: Router) {}
  public address: Address;
  ngOnInit(): void {
    this.getMockAddress();
    console.log(this.address);
  }
  getMockAddress(): void {
    this.address = this.service.getAddress();
  }
  onDeliver(): void {
    this.router.navigate(['payment']);
  }
}
