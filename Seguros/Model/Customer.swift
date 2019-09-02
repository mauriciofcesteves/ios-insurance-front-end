//
//  Customer.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2018-03-18.
//  Copyright © 2018 Mauricio Esteves. All rights reserved.
//

import UIKit

struct Customer: Codable {
    //register id (database id)
    let id: Int
    
    //active
    var ativo: Bool
    
    var matricula: String?
    
    //name
    var nome: String?
    var email: String?
    
    //phone number
    var telefone: String?
    
    //license id
    var cpf: String?
    var cnpj: String?
    
    //license plate
    var placa: String?
    
    //insurance company
    var seguradora: String?
    
    var titulacao: String?
    
    //start date
    var vigenciaInicio: String?
    
    //end date
    var vigenciaFim: String?
    
    //description
    var observacao: String?
}
