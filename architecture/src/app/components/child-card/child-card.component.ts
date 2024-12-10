import { Component, Input } from '@angular/core';
import {MatCardModule} from '@angular/material/card';

@Component({
  selector: 'app-child-card',
  standalone: true,
  imports: [MatCardModule],
  templateUrl: './child-card.component.html',
  styleUrl: './child-card.component.css'
})
export class ChildCardComponent {
  @Input() name: string = ''; // Title for the card
  @Input() alter: string = ''; // Subtitle for the card
  @Input() info: string = ''; // Content inside the card
}
