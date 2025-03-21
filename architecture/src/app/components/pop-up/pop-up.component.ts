import {ChangeDetectionStrategy, Component, inject, Input, Type} from '@angular/core';
import {MatButtonModule} from '@angular/material/button';
import {
  MatDialog
} from '@angular/material/dialog';
import { DefaultDialog, DialogContainerComponent } from '../dialog-container/dialog-container.component';
import { AddChildDialog, ActionsChildDialog } from '../dialog-container/dialog-container.component';
import {MatIconModule} from '@angular/material/icon';

/**
 * @title Dialog Animations
 */
@Component({
  selector: 'dialog-animations-example',
  styleUrl: 'pop-up.component.css',
  templateUrl: 'pop-up.component.html',
  standalone: true,
  imports: [MatButtonModule, MatIconModule],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class DialogAnimationsExample {
  @Input() buttontxt: string = '';
  @Input() iconname: string = '';
  @Input() dialogComponent: Type<any> = DefaultDialog;
  readonly dialog = inject(MatDialog);

  AddChildDialog = AddChildDialog;
  ActionsChildDialog = ActionsChildDialog;

  openDialog(): void {
    this.dialog.open(DialogContainerComponent, {
      width: '400px',
      data: { component: this.dialogComponent},
    });
  }
}

