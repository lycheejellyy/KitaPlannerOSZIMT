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
  @Input() child!: { name: string, gender: string, birthdate: string, kita: string, supervisor: string, age_in_months: number };
  @Input() title: string = '';
}
