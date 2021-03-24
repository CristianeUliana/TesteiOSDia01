//
//  cepModel.swift
//  TesteiOSDia01
//
//  Created by Cristiane Goncalves Uliana on 11/03/21.
//  Copyright © 2021 Cristiane Goncalves Uliana. All rights reserved.
//

import Foundation

struct Ceps: Codable {
    let type, logradouro, complemento: String?
    let number: Int?
    let error: Error?
}
