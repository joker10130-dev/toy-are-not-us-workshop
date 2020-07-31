import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { Address } from '../models/address';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { ToyCart } from '../models/toy-cart';

@Component({
  selector: 'app-shipping',
  templateUrl: './shipping.component.html',
  styleUrls: ['./shipping.component.css'],
})
export class ShippingComponent implements OnInit {
  constructor(
    private service: ApiService,
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) {}
  public state: ToyCart[];
  public address: Address;
  ngOnInit(): void {
    this.state = JSON.parse(
      this.activatedRoute.snapshot.queryParamMap.get('order')
    );
    this.getMockAddress();
    console.log(this.address);
  }
  getMockAddress(): void {
    this.address = this.service.getAddress();
  }
  onDeliver(): void {
    this.router.navigate(['payment'], {
      queryParams: { order: JSON.stringify(this.state) },
    });
  }
}
