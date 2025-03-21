import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class ChildService {
  private apiUrl = 'http://localhost:3000/api/children';

  constructor(private http: HttpClient) {}

  getChildren(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

  addChild(childData: any): Observable<any> {
    return this.http.post<any>(this.apiUrl, childData);
  }

}