import { Component } from '@angular/core';

import { HeroListComponent } from './hero-list.component';
import { SalesTaxComponent } from './sales-tax.component';
import { ChildCardComponent } from "./components/child-card/child-card.component";
import { NavBarComponent } from "./components/nav-bar/nav-bar.component";

@Component({
  standalone: true,
  selector: 'app-root',
  template: `
    <app-nav-bar></app-nav-bar>
    <app-child-card name="Laura Billhardt" alter="50 Monate" info="[platzhalter für weitere infos]"></app-child-card>
    <app-child-card name="Maya Billhardt" alter="50 Monate" info="[platzhalter für weitere infos]"></app-child-card>
    <app-child-card name="Henry Lackner" alter="54 Monate" info="[platzhalter für weitere infos]"></app-child-card>
  `,
  imports: [HeroListComponent, SalesTaxComponent, ChildCardComponent, NavBarComponent]
})
export class AppComponent { }

//
//<app-hero-list></app-hero-list>
//<app-sales-tax></app-sales-tax>
