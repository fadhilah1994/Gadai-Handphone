//
//  PostModel.swift
//  Training Pegadaian batch 1
//
//  Created by Kurniawan Gigih Lutfi Umam on 13/08/20.
//  Copyright © 2020 Pegadaian Digital. All rights reserved.
//

import Foundation
import UIKit

class PostModel: Identifiable {
    let id = UUID()
    let post: PostResponse
    
    init(data: PostResponse) {
        self.post = data
    }
    
    var name:String {
        return post.name ?? ""
    }
}
