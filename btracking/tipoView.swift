//
//  tipoView.swift
//  btracking
//
//  Created by Turma01-20 on 03/02/24.
//

import Foundation
import MapKit

struct ponto: Decodable, Identifiable, Hashable {
    var id: Int?
    var latitude: Double?
    var longitude: Double?
    var referencia: [Ref]
    var Onibus: [Onibus]
    var coordenadas: CLLocationCoordinate2D{CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)}

}

struct Ref : Decodable, Hashable {
    var idPonto : Int?
    var nome: String
}

struct Onibus: Decodable, Hashable{
    var rota: String?
    var onibus: String?
    var hora: String?
}

struct Grupos: Identifiable{
    let id: Int
    let nome: String
    let msg: String
    let foto: String
}
struct hist: Identifiable{
    let id: Int
    let nome: String
    let msg: String
    let foto: String
    let colorz: String
}


