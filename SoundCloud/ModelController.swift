//
//  ModelController.swift
//  SoundCloud
//
//  Created by Даша Волошина on 14.11.22.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    var story:Sections = { .storys([Item(image: "1", title: "1"),
                                    Item(image: "2", title: "2"),
                                    Item(image: "3", title: "3"),
                                    Item(image: "4", title: "4"),
                                    Item(image: "5", title: "5"),
                                    Item(image: "6", title: "6"),
                                    Item(image: "7", title: "7"),
                                    Item(image: "8", title: "8"),
                                    Item(image: "9", title: "9"),])
        
    }()
    
    var upload:Sections = {.upload([Item(image: "11", title: "")])
        
    }()
    
    
    var allSection:[Sections] {
        [story, upload]
    }
        
    }


