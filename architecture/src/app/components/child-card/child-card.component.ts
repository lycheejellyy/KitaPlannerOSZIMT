import { Component, Input} from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-card',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './child-card.component.html',
  styleUrls: ['./child-card.component.css']
})
export class ChildCardComponent {
  @Input() title: string = '';
  @Input() description: string = '';
  @Input() imageUrl: string = '';
  @Input() buttonText: string = '';
  @Input() buttonLink: string = '#';
}
