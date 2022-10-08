//
//  Migrator.swift
//  Countries
//
//  Created by Sergej on 30.7.22..
//

import Foundation
import RealmSwift

class Migrator {
    
    init() {
        updateScheme()
    }
    
    func updateScheme() {
        let config = Realm.Configuration(schemaVersion: 1) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: Country.className()) { _, newObject in
                    newObject!["flag"] = "🏳"
                }
            }
        }
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
    }
}
