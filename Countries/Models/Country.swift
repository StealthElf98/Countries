//
//  Country.swift
//  Countries
//
//  Created by Sergej on 12.6.22..
//

import Foundation
import RealmSwift

class Country: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var cities: List<City>
    @Persisted var flag = "🏳"
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
    
}
