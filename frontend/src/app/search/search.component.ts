import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ApiService } from '../api.service';
import { Product } from '../models/product';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css'],
})
export class SearchComponent implements OnInit {
  constructor(private formBuilder: FormBuilder, public service: ApiService) {}
  public loginForm: FormGroup;
  public firstInput = '';
  public secondInput = '';
  public toys: Product[];
  ngOnInit(): void {
    this.getProducts();
    this.loginForm = this.formBuilder.group({
      firstInput: ['', Validators.required],
      secondInput: ['', Validators.required],
    });
  }
  getProducts(): void {
    this.service.getAllToys().subscribe((products) => {
      return (this.toys = products);
    });
  }
  private get f(): any {
    return this.loginForm.controls;
  }
  public onSubmit(): void {
    this.firstInput = this.f.firstInput.value;
    this.secondInput = this.f.secondInput.value;
  }
}
