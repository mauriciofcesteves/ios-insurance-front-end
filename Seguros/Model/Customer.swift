//
//  Customer.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2018-03-18.
//  Copyright © 2018 Mauricio Esteves. All rights reserved.
//

import UIKit

//open class Customer {
//    let id: Int      = 0
//    var ativo: Bool = false
//    var matricula: String = ""
//    var nome: String = ""
//    var email: String = ""
//    var telefone: String = ""
//    var cpf: String = ""
//    var cnpj: String = ""
//    var placa: String = ""
//    var seguradora: String = ""
//    var titulacao: String = ""
//    var vigenciaInicio: String = ""
//    var vigenciaFim: String = ""
//    var observacao: String = ""
//}


struct Customer: Codable {
    let id: Int
    var ativo: Bool
    var matricula: String?
    var nome: String?
    var email: String?
    var telefone: String?
    var cpf: String?
    var cnpj: String?
    var placa: String?
    var seguradora: String?
    var titulacao: String?
    var vigenciaInicio: String?
    var vigenciaFim: String?
    var observacao: String?
}
