import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { Address } from '../models/address';

@Component({
  selector: 'app-thanks-you',
  templateUrl: './thanks-you.component.html',
  styleUrls: ['./thanks-you.component.css'],
})
export class ThanksYouComponent implements OnInit {
  constructor(private service: ApiService) {}
  public address: Address;
  ngOnInit(): void {
    this.getMockAddress();
    console.log(this.address);
  }
  getMockAddress(): void {
    this.address = this.service.getAddress();
  }
}
