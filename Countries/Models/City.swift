//
//  City.swift
//  Countries
//
//  Created by Sergej on 12.6.22..
//

import SwiftUI
import RealmSwift

class City: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted(originProperty: "cities") var country: LinkingObjects<Country>
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
    
}
