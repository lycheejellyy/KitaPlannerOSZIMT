import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChildCardComponent } from '../components/child-card/child-card.component';
import { ChildService } from '../services/child.services';
import { format } from 'date-fns';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatIconModule} from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';

@Component({
  selector: 'app-view-child',
  standalone: true,
  imports: [ChildCardComponent, CommonModule, MatToolbarModule, MatIconModule, MatButtonModule],
  templateUrl: './view-child.component.html',
  styleUrl: './view-child.component.css'
})
export class ViewChildComponent {
  child: any | null = null;

  constructor(private childService: ChildService) {}

  ngOnInit(): void {
    const childId = 4; // Replace with the actual child ID
    this.childService.getChildById(childId).subscribe(
      (data) => {
        console.log('Raw data from API:', data);
        this.child = data; // Assign directly
      }
    );
    };
  

  private formatDate(dateString: string): string {
    return format(new Date(dateString), 'dd.MM.yyyy');
  }
}
