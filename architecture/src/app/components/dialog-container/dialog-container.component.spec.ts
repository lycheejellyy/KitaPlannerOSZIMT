import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogContainerComponent } from './dialog-container.component';

describe('DialogContainerComponent', () => {
  let component: DialogContainerComponent;
  let fixture: ComponentFixture<DialogContainerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DialogContainerComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DialogContainerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
