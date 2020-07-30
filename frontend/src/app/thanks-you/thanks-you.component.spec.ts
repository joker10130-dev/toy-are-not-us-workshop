import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ThanksYouComponent } from './thanks-you.component';

describe('ThanksYouComponent', () => {
  let component: ThanksYouComponent;
  let fixture: ComponentFixture<ThanksYouComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ThanksYouComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ThanksYouComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
