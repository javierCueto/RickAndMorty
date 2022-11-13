//
//  HttpResponseStatus.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

enum HttpResponseStatus {
    static let ok = 200...299
    static let clienteError = 400...499
    static let serverError = 500...599
}
