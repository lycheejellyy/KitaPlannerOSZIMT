import { Component, Inject, Type } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgComponentOutlet } from '@angular/common';
import { MatDialogTitle, MatDialogContent, MatDialogActions, MatDialogClose } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatButtonToggleModule } from '@angular/material/button-toggle';
import { MatIconModule } from '@angular/material/icon';
import { FormsModule } from '@angular/forms';
import { ChildService } from '../../services/child.services';
import { DialogAnimationsExample} from '../pop-up/pop-up.component';


@Component({
  selector: 'dialog-container',
  template: `
    <mat-dialog-content>
      <ng-container *ngComponentOutlet="data.component"></ng-container>
    </mat-dialog-content>
  `,
  standalone: true,
  imports: [NgComponentOutlet, MatDialogContent, MatDialogActions],
})
export class DialogContainerComponent {
  constructor(
    public dialogRef: MatDialogRef<DialogContainerComponent>,
    @Inject(MAT_DIALOG_DATA) public data: { component: Type<any> }
  ) {}
}

@Component({
  selector: 'add-child-dialog',
  templateUrl: 'dialogs/add-child-dialog.html',
  standalone: true,
  imports: [MatDialogTitle,
    MatDialogContent,
    MatDialogActions,
    MatDialogClose,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatButtonToggleModule,
    MatIconModule,
  FormsModule],
})
export class AddChildDialog {
  child = {
    name: '',
    gender: '',
    birthdate: '',
    kita: '',
    supervisor: ''
  }

  constructor(private childService: ChildService, private dialogRef: MatDialogRef<AddChildDialog>) {}

  addChild() {
    console.log('Before sending:', this.child);
    if (this.child.birthdate) {
      const dateObj = new Date(this.child.birthdate);
      this.child.birthdate = dateObj.toISOString().split('T')[0]; // Convert to 'YYYY-MM-DD'
    } else {
      console.warn('Birthdate is missing!');
    }

    this.childService.addChild(this.child).subscribe({
      next: (response) => {
        console.log('Child added successfully:', response);
      },
      error: (error) => {
        console.error('Error adding child:', error);
      }
    });
    window.location.reload();
  }

  close() {
    this.dialogRef.close();
  }

  save() {
    this.dialogRef.close(this.child); 
  }

}

@Component({
  selector: 'actions-child-dialog',
  templateUrl: 'dialogs/actions-child-dialog.html',
  standalone: true,
  imports: [MatDialogTitle,
    MatDialogContent,
    MatDialogActions,
    MatDialogClose,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatButtonToggleModule,
    MatIconModule,
  FormsModule, DialogAnimationsExample],
})

export class ActionsChildDialog{

  constructor(private dialogRef: MatDialogRef<ActionsChildDialog>) {}

}

//Fallback dialog - if visible check button which calls the dialog
@Component({
  selector: 'default-dialog',
  template: `<p>Please insert a valid Dialog-Path.</p>`,
  standalone: true,
})
export class DefaultDialog {}