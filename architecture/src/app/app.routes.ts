import { Routes } from "@angular/router";
import { HomeComponent } from "./home/home.component";
import { ViewChildComponent } from "./view-child/view-child.component";

export const routes: Routes = [
    { path: 'home', component: HomeComponent },
    {path: 'view-child', component: ViewChildComponent},
    { path: '', redirectTo: '/home', pathMatch: 'full' },
  ]