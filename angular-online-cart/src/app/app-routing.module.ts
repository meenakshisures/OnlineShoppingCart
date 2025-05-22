import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductComponent } from './product/product.component';
import { HomeComponent } from './home/home.component';
import { NotFoundComponent } from './not-found/not-found.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'abc', component: HomeComponent, pathMatch: 'prefix' },
  { path: 'home', component: HomeComponent },
  {
    path: 'product',
    children: [
       {path: '', component: ProductComponent },
       {path: ':id', component: ProductComponent },
       {path: '**', component: NotFoundComponent },

      ],
  },
  { path: '**', component: NotFoundComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
