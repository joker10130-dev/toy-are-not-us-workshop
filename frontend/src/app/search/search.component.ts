import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css'],
})
export class SearchComponent implements OnInit {
  constructor(private formBuilder: FormBuilder) {}
  public loginForm: FormGroup;
  public firstInput = '';
  public secondInput = '';
  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      firstInput: ['', Validators.required],
      secondInput: ['', Validators.required],
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
