import { Component, OnInit } from '@angular/core';
import { NavBarComponent } from "../components/nav-bar/nav-bar.component";
import { ChildCardComponent } from "../components/child-card/child-card.component";
import { ChildService } from '../services/child.services';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, NavBarComponent, ChildCardComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit {

  cards: any[] = [];

  constructor(private childService: ChildService) {}
  ngOnInit(): void {
    this.childService.getChildren().subscribe(data => this.cards = data);
  }

}
