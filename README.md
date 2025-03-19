### KitaPlannerOSZIMT
This is a project for our apprenticeship in software development. We will digitalize the "Entwicklungstabelle nach Beller" for kindergardens.

## CURRENT STATE: IN DEVELOPMENT
This project is not yet finished. Bugs may occur.

## Requirements for local development and testing

You will need **Angular Version 18**, **Node Version 23** (we recommend using nvm) and **pnpm**.

Other than that you will need **XAMPP** with a database. 
The database configuration file can be found in the repo. This file should be imported into an empty database.

To install the dependencies, you will need to use the `pnpm install` command twice, once in the **backend** folder and once in the **architecture** folder.

Down below are the dependencies, that should be installed with the command:

**For backend:**
```json
{
  "dependencies": {
    "body-parser": "^1.20.3",
    "cors": "^2.8.5",
    "express": "^4.21.2",
    "mysql": "^2.18.1",
    "mysql2": "^3.11.5",
    "nodemon": "^3.1.7"
  }
}
```
**For frontend/architecture:**

```json
{
"dependencies": {
    "@angular/animations": "17.2.4",
    "@angular/cdk": "17.3.10",
    "@angular/common": "17.2.4",
    "@angular/compiler": "17.2.4",
    "@angular/core": "17.2.4",
    "@angular/forms": "17.2.4",
    "@angular/material": "17.3.10",
    "@angular/platform-browser": "17.2.4",
    "@angular/platform-browser-dynamic": "17.2.4",
    "@angular/router": "17.2.4",
    "angular-in-memory-web-api": "~0.17.0",
    "cors": "^2.8.5",
    "date-fns": "^4.1.0",
    "rxjs": "~7.8.0",
    "tslib": "^2.3.0",
    "zone.js": "~0.14.0"
  },
  "devDependencies": {
    "@angular-devkit/build-angular": "17.2.3",
    "@angular/cli": "17.2.3",
    "@angular/compiler-cli": "17.2.4",
    "@types/jasmine": "~5.1.0",
    "@types/node": "^16.11.35",
    "copyfiles": "^2.4.1",
    "jasmine-core": "~5.1.0",
    "jasmine-marbles": "~0.9.2",
    "jasmine-spec-reporter": "~7.0.0",
    "karma": "~6.4.0",
    "karma-chrome-launcher": "~3.2.0",
    "karma-coverage": "~2.2.0",
    "karma-jasmine": "~5.1.0",
    "karma-jasmine-html-reporter": "~2.1.0",
    "protractor": "~7.0.0",
    "ts-node": "~10.9.0",
    "typescript": "^5.3.3"
  }
}
```

## Running the project

To run the project, make sure to have the database server with the needed database started.


To start the project run the following commands:

`ng serve` in the architecture folder
`nodemon server.js` in the backend folder

## Problems

If any problems occur while setting up the project, don't hesitate to contact our developers :D