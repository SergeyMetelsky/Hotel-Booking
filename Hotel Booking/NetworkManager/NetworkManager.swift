//
//  NetworkManager.swift
//  Hotel Booking
//
//  Created by Sergey on 6/3/21.
//

import Foundation

class NetworkManager {
    
    // *@escaping оператор нужен для того чтобы когда ф-ия fetch закончится блок (String?) -> () задержался в памяти до момента пока не придет ответ от сервера
    static func fetch(completion: @escaping (String?) -> ()) {
        let urlString = "https://..."
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            let jsonString = String(data: data, encoding: .utf8)
            completion(jsonString)
//            print(jsonString as Any)
            
            //...
        }
        
        task.resume()
    }
}
