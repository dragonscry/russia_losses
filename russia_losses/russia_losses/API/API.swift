//
//  API.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import Foundation

//links with data
//https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json
//https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json


class API {
    
    static let shared = API() // singleton
    
    private init() {}
    
    // parse from Data to Decodable Model
    func getParsedData<T>(fromURL url: String, completion: @escaping ([T])-> ()) where T: Decodable {
        
        guard let url = URL(string: url) else {
            print("No URL")
            return
            
        }
        
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                
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
            
            else {
                print("No data returned.")
            }
        }
    }
    
    //need to recieve data from URL
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

//need to handle any NaN values and convert in to -1
func handleNaNvalues(_ s: String?) -> String {
    guard let s = s else {return ""}
    return s.replacingOccurrences(of: "NaN", with: "-1")
}
