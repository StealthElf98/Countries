//
//  AllCitiesView.swift
//  Countries
//
//  Created by Sergej on 27.7.22..
//

import SwiftUI
import RealmSwift

struct AllCitiesView: View {
    @ObservedResults(City.self, sortDescriptor : SortDescriptor(keyPath: "name")) var cities
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cities) { city in
                    HStack {
                        Text(city.name)
                        Spacer()
                        Text(city.country.first?.name ?? "No country")
                    }
                }
                .onDelete(perform: $cities.remove)
            }
            .navigationTitle("All Cities")
        }
    }
}

struct AllCitiesView_Previews: PreviewProvider {
    static var previews: some View {
        AllCitiesView()
    }
}
