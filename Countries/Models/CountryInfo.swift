//
//  CountryInfo.swift
//  Countries
//
//  Created by Sergej on 30.7.22..
//

import Foundation

struct CountryInfo: Decodable, Identifiable {
    let name: String
    let flag: String
    let countryCode: String
    var id: String {
        countryCode
    }
    
    init() {
        name = " "
        flag = "🏳"
        countryCode = " "
    }
}
