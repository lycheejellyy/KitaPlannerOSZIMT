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
    MatIconModule]
})
export class AddChildDialog {}

//Fallback dialog - if visible check button which calls the dialog
@Component({
  selector: 'default-dialog',
  template: `<p>Please insert a valid Dialog-Path.</p>`,
  standalone: true,
})
export class DefaultDialog {}