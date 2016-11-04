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
    // VARIABLES: To hold data returned from API
    let apiUrl = "https://jsonagainsthumanity.herokuapp.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCards(apiUrl: apiUrl, callback: addToDeckCallback)
    }
    
    func addToDeckCallback(JSONData : Data){
        let json = SwiftyJSON.JSON(data: JSONData)
        for i in 0..<json["blackCards"].count {
            
            var card = json["blackCards"][i]
            let text = card["text"].string
            
            if card["pick"] == 1 {
                Information.Cards.blackCards.append(text!)
            }
        }
        for i in 0..<json["whiteCards"].count {
            
            let text = json["whiteCards"][i].string
            Information.Cards.whiteCards.append(text!)
        }
    }
    
    @IBAction func UsernameTextField(_ sender: AnyObject) {
        print("text: " + sender.text )
        Information.Players.name = sender.text
        self.view.endEditing(true)
        performSegue(withIdentifier: "GameViewSegue", sender: sender)
    }
    
    
}


