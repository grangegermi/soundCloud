//
//  Model.swift
//  SoundCloud
//
//  Created by Даша Волошина on 14.11.22.
//

import Foundation


//enum Section {
//    case sectionStorys([Storys])
//    case TheUpload
//}

struct Storys {
    
    let title:String
    let image:String
    
    init(title:String,image:String) {
        self.title = title
        self.image = image
    }

}
