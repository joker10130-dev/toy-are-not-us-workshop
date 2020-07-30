import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PaymentComponent } from './payment/payment.component';
import { ProductDetailComponent } from './product-detail/product-detail.component';
import { SearchComponent } from './search/search.component';
import { ShippingComponent } from './shipping/shipping.component';
import { ShoppingCartComponent } from './shopping-cart/shopping-cart.component';
import { ThanksYouComponent } from './thanks-you/thanks-you.component';

const routes: Routes = [
  { path: 'payment', component: PaymentComponent },
  { path: 'product-detail', component: ProductDetailComponent },
  { path: 'search', component: SearchComponent },
  { path: 'shipping', component: ShippingComponent },
  { path: 'shopping-cart', component: ShoppingCartComponent },
  { path: 'thanks-you', component: ThanksYouComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
