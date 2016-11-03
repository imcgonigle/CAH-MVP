//
//  DataStruct.swift
//  Coders-Against-Humanity
//
//  Created by Ian McGonigle on 11/3/16.
//  Copyright © 2016 Ji. All rights reserved.
//

struct Information {
    
    struct Player {
        static var name = String()
    }
    
    struct Cards {
        
        static var whiteCards = [String]()
        static var blackCards = [String]()
        
        static var whiteCounter = Int()
        static var blackCounter = Int()
        
        static var playersCards = [String]()
        
        static var currentBlackCard = String()
        
        static var selectedWhiteCard = String()
    }
    
}
