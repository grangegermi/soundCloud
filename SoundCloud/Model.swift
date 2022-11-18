//
//  Model.swift
//  SoundCloud
//
//  Created by Даша Волошина on 14.11.22.
//

import Foundation


enum Sections {
    
    case storys([Item])
    case upload([Item])
    
    var items:[Item] {
        switch self {
        case  .storys(let items):
            return items
        case  .upload(let items):
            return items
            
        }
    }
    
    var count:Int {
        
        return items.count
    }
    
    var title:String {
        switch self {
        case .storys(_):
            return "Story"
        case .upload(_):
            return "The Upload"
        }
    }
}


struct Item {
    
    var image:String
    var title:String
}


