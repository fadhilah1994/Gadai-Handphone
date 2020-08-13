//
//  PostViewModel.swift
//  Training Pegadaian batch 1
//
//  Created by Kurniawan Gigih Lutfi Umam on 13/08/20.
//  Copyright © 2020 Pegadaian Digital. All rights reserved.
//

import Foundation
import UIKit

class PostViewModel: ObservableObject {
    init() {
        getPost()
    }
    
    @Published var data = [PostModel]()
    
    private func getPost(){
        guard let url = URL(string:"https://run.mocky.io/v3/13772342-6b5b-44f9-a442-b8c16259cd67") else {
            return
        }
    
        NetworkManager.loadData(url: url){
            data in
            if let data =  data {
                self.data = data.map(PostModel.init)
            }
        }
    }
    
}
