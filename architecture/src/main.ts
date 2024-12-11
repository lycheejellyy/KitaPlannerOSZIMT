import { bootstrapApplication, provideProtractorTestingSupport } from '@angular/platform-browser';

import {AppComponent} from './app/app.component';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { provideRouter } from '@angular/router';
import { HomeComponent } from './app/home/home.component';
import { routes } from './app/app.routes';
import { appConfig } from './app/app.config';

bootstrapApplication(AppComponent, appConfig).catch((err) => console.log(err));
