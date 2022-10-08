//
//  CountriesApp.swift
//  Countries
//
//  Created by Sergej on 12.6.22..
//

import SwiftUI

@main
struct CountriesApp: App {
    let migrator = Migrator()
    var body: some Scene {
        WindowGroup {
            TabView {
                CountriesListView()
                    .tabItem {
                        Label("Countries", systemImage: "list.dash")
                    }
                AllCitiesView()
                    .tabItem {
                        Label("Cities", systemImage: "list.dash")
                    }
                
            }
            .onAppear {
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
        }
    }
}
