//
//  APIController.swift
//  APIPractice
//
//  Created by Don Dominic on 24/07/23.
//

import UIKit

class APIController: NSObject {
    
    func getData(url: String,completion: @escaping (Any?, Error?) -> Void){
        

        guard let serviceURL = URL(string: url) else{return}
        let request = URLRequest(url: serviceURL)
        let urlsession = URLSession.shared
        urlsession.dataTask(with: request) { (data,response,error) in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data,options: JSONSerialization.ReadingOptions.fragmentsAllowed) as? [[String:Any]] {
                        let dataResponse = json
                        completion(dataResponse, nil)
                    }
                }catch{
                    completion(nil,error)
                    print(error)
                }
            }
        }.resume()
    }
}
