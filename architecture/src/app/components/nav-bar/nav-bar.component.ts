import { Component } from '@angular/core';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatIconModule} from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';
import { DialogAnimationsExample} from '../pop-up/pop-up.component';
import { AddChildDialog } from '../dialog-container/dialog-container.component';

@Component({
  selector: 'app-nav-bar',
  standalone: true,
  imports: [MatToolbarModule, MatIconModule, MatButtonModule, DialogAnimationsExample],
  templateUrl: './nav-bar.component.html',
  styleUrl: './nav-bar.component.css'
})
export class NavBarComponent {
AddChildDialog = AddChildDialog;
}
