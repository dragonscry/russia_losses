//
//  DownloadViewModel.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import Foundation
import SwiftUI

class DownloadViemModel: ObservableObject {
    
    @Published var equipments: [EquipmentModel] = []
    @Published var personal: [PersonalModel] = []
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                let jsonString = String(data: data, encoding: .utf8)
                print(jsonString)
                guard let newEquipments = try? JSONDecoder().decode([EquipmentModel].self, from: data) else {
                    print("Can not be decodable!")
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.equipments = newEquipments
                }
            } else {
                print("No data returned.")
            }
        }
        
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping(_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
                    
            else {
                print("Error Handling data")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
}
