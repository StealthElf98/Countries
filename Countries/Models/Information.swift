//
//  Information.swift
//  Countries
//
//  Created by Sergej on 30.7.22..
//

import Foundation

class Helper {
    let url = "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/index.json"
    var array : [CountryInfo] = []
    
    private func fetch(from url : String) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let informations = try JSONDecoder().decode([CountryInfo].self, from: data)
                DispatchQueue.main.async {
                    self.array = informations
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
