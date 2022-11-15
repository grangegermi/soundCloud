//
//  ModelController.swift
//  SoundCloud
//
//  Created by Даша Волошина on 14.11.22.
//

import Foundation


protocol Model {
    
    var storys:[Storys] {get set}
    
}

class ModelViewController: Model {
    
    var storys: [Storys] = [Storys(title: "1", image: "1"),
                            Storys(title: "1", image: "2"),
                            Storys(title: "1", image: "3"),
                            Storys(title: "1", image: "4"),
                            Storys(title: "1", image: "5"),
                            Storys(title: "1", image: "6"),
                            Storys(title: "1", image: "7"),
                            Storys(title: "1", image: "8"),
                            Storys(title: "1", image: "9")]
    
    
}
