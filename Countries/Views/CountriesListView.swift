//
//  ContentView.swift
//  Countries
//
//  Created by Sergej on 12.6.22..
//

import SwiftUI
import RealmSwift

struct CountriesListView: View {
    @ObservedResults(Country.self) var countries
    @FocusState private var isFocused : Bool?
    @State private var presentAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                if countries.count == 0 {
                    Text("Tap on the \(Image(systemName: "plus.circle.fill")) to add new country!")
                } else {
                    List{
                        ForEach(countries.sorted(byKeyPath: "name")){ country in
                            NavigationLink {
                                CitiesListView(country: country)
                            } label: {
                                CountryRowView(country: country, isFocused: _isFocused)
                            }
                        }
                        .onDelete(perform: deleteCountry)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    Spacer()
                }
                
            }
            .animation(.linear, value: countries)
            .navigationTitle("Countries")
            .font(.title2)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        $countries.append(Country())
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button {
                            isFocused = nil
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            }
        }
        .alert("You have to delete all cities in this country", isPresented: $presentAlert, actions: {})
        
    }
    
    func deleteCountry(indexSet: IndexSet) {
        if let index = indexSet.first {
            let selectedCountry = Array(countries.sorted(byKeyPath: "name"))[index]
            if !selectedCountry.cities.isEmpty {
                presentAlert.toggle()
                return
            } else {
                $countries.remove(selectedCountry)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
