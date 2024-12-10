import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeroListComponent } from './hero-list.component';
import { SalesTaxComponent } from './sales-tax.component';
import { ChildCardComponent } from "./components/child-card/child-card.component";
import { NavBarComponent } from "./components/nav-bar/nav-bar.component";

@Component({
  standalone: true,
  selector: 'app-root',
  templateUrl: './app.component.html',
  imports: [HeroListComponent, SalesTaxComponent, ChildCardComponent, NavBarComponent, CommonModule]
})
export class AppComponent { }

//
//<app-hero-list></app-hero-list>
//<app-sales-tax></app-sales-tax>
