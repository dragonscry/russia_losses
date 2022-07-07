//
//  DataFromLocalJSON.swift
//  russia_losses
//
//  Created by Denys on 07.07.2022.
//

import Foundation

class DataFromLocalJSON {
    static let shared = DataFromLocalJSON() //singleton
    
    private init() {}
    
    static let losses_equipment = "russia_losses_equipment"
    static let losses_personnel = "russia_losses_personnel"
    
    func loadData<T>(fromm file: String, completion: @escaping ([T])-> ()) where T: Decodable {
        
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            print("JSON file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        if let data = data {
            let jsonString = String(data: data, encoding: .utf8)
            let parsedJsonString = handleNaNvalues(jsonString)
            let parsedData = parsedJsonString.data(using: .utf8)
            
            let decoder = JSONDecoder()
            
            guard let parsedArray = try? decoder.decode([T].self, from: parsedData ?? data) else {
                print("Not Decodable")
                return
                
            }
            
            DispatchQueue.main.async {
                completion(parsedArray)
            }
        }
    }
}
