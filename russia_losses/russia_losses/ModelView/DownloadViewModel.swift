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
        
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
                            //                   "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
        ) else {
            print("No URL")
            return
            
        }
        
        downloadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                
                let jsonString = String(data: data, encoding: .utf8)
                let parsedJsonString = self.convertNanToString(jsonString)
                let parsedData = parsedJsonString.data(using: .utf8)
                
                let decoder = JSONDecoder()
                
                guard let newEquipments = try? decoder.decode([EquipmentModel].self, from: parsedData ?? data) else {
                    print("Not Decodable")
                    return
                    
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.equipments = newEquipments
                }
                
            }
            
            else {
                print("No data returned.")
            }
        }
        
    }
    
    func convertNanToString(_ s: String?) -> String {
        guard let s = s else {return ""}
        return s.replacingOccurrences(of: "NaN", with: "-1")
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
