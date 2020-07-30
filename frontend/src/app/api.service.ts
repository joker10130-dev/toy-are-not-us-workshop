import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError } from 'rxjs/operators';

import { Product } from './models/product';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  constructor(private http: HttpClient) {}
  private url = 'https://asia-east2-simplecloudfirestoreapi.cloudfunctions.net/api?collection=toyRNotUs';
  private handleError(operation: string = 'operation', result?: any): any {
    return (error: any): Observable<Product> => {
      console.error(operation, error);
      // Let the app keep running by returning an empty result.
      return of(result as Product);
    };
  }
  getAllToys(): Observable<Product[]> {
    return this.http
      .get<Product[]>(this.url)
      .pipe(catchError(this.handleError('getAllToys', [])));
  }
  getToy(id: number): Observable<Product[]> {
    return this.http
      .get<Product[]>(this.url + `&id=${id}`)
      .pipe(catchError(this.handleError('getAllToys', [])));
  }
}
