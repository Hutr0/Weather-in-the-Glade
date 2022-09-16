//
//  Get Data Manager.swift
//  Weather in the Glade
//
//  Created by Леонид Лукашевич on 16.09.2022.
//

import UIKit

class GetDataManager {
    
    static func getRequest(url: String, completion: @escaping (_ json: JSONWeatherModel) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                
                let json = try decoder.decode(JSONWeatherModel.self, from: data)
                completion(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func getImage(url: String, completion: @escaping (_ image: UIImage) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
}
