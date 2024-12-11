import { Component } from '@angular/core';
import { NavBarComponent } from "../components/nav-bar/nav-bar.component";
import { ChildCardComponent } from "../components/child-card/child-card.component";

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [NavBarComponent, ChildCardComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {

}
