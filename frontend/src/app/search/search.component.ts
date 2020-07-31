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
  constructor(private formBuilder: FormBuilder, private service: ApiService) {}
  public searchForm: FormGroup;
  public age = '';
  public gender = '';
  public toys: Product[];
  ngOnInit(): void {
    this.getProducts();
    this.searchForm = this.formBuilder.group({
      age: ['', Validators.required],
      gender: ['', Validators.required],
    });
  }
  getProducts(): void {
    this.service.getAllToys().subscribe((products) => {
      return (this.toys = products);
    });
  }
  changeAge(e: any): void {
    this.f.age.setValue(e.target.value, {
      onlySelf: true,
    });
    console.log(this.f.age.value);
  }
  changeGender(e: any): void {
    this.f.gender.setValue(e.target.value, {
      onlySelf: true,
    });
    console.log(this.f.gender.value);
  }
  onProductClick(toy: Product): void {
    console.log(toy);
  }
  private get f(): any {
    return this.searchForm.controls;
  }
  public onSubmit(): void {
    this.age = this.f.age.value;
    this.gender = this.f.gender.value;
    this.toys = this.toys.filter((t) => t.age === this.age);
    this.toys = this.toys.filter((t) => t.gender === this.gender);
    console.log(this.age, this.gender);
  }
}
