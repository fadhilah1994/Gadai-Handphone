//
//  NetworkManager.swift
//  Training Pegadaian batch 1
//
//  Created by Kurniawan Gigih Lutfi Umam on 13/08/20.
//  Copyright © 2020 Pegadaian Digital. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    static func loadData(url: URL, completion: @escaping ([PostResponse]?) -> ()){
        
        URLSession.shared.dataTask(with: url){
            data, response,error in
            
            guard let data = data, error == nil
                else{
                    completion(nil)
                    return
            }
            
            if let response = try? JSONDecoder().decode([PostResponse].self, from: data){
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }
}
