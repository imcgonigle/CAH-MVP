//
//  WaitingRoomVC.swift
//  Coders-Against-Humanity
//
//  Created by Ji Kim on 11/2/16.
//  Copyright © 2016 Ji. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class WaitingRoomVC: UIViewController {
    
    let apiUrl = "https://jsonagainsthumanity.herokuapp.com/"
    
    var blackCards = [String]()
    var whiteCards = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        loadCards(apiUrl: apiUrl, callback: addToDeckCallback)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        print(self.blackCards)
    }

    
    func addToDeckCallback(JSONData : Data){
        
        let json = SwiftyJSON.JSON(data: JSONData)
        
        for i in 0..<json["blackCards"].count {
            
            var card = json["blackCards"][i]
            let text = card["text"].string
            
            if card["pick"] == 1 {
                self.blackCards.append(text!)
            }
            
        }
        
        for i in 0..<json["whiteCards"].count {
            
            let text = json["whiteCards"][i].string
            self.whiteCards.append(text!)
            
        }
        
    } //end of addToDeck
    
    //MARK: ACTIONS
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameVC : GameVC = segue.destination as! GameVC
        gameVC.blackCardsArray = blackCards
        gameVC.whiteCardsArray = whiteCards
    }
    
}


