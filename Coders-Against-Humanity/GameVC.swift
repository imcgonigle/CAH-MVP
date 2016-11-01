//
//  GameVC.swift
//  Coders-Against-Humanity
//
//  Created by Creighton Soukup on 11/1/16.
//  Copyright © 2016 Ji. All rights reserved.
//

import UIKit

//PROTOTYPE: card

struct Cards {
    var blackCardContent : String!
    var whiteCardsContent : [String]!
}

class GameVC: UIViewController {
    @IBOutlet weak var blackCard: UITextView!
    @IBOutlet var whiteCards: [UIButton]!

    //Variable used withing view
    var cards = [Cards]()
   // var cardIndex = Int()
    var selectedWhiteCard = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loading up black and white card decks
        //need to write function to capitalize white cards
        cards = [
            Cards(
                blackCardContent:"America is hungry. America needs ______",
                whiteCardsContent:[
                    "Vigorous Jazz Hands",
                    "Flightless Bird",
                    "Laying An Egg",
                    "Same Sex Ice Dancing",
                    "A Salty Surprise",
                    "Pictures of Boobs"
                ]
            )
        ]
        
        dealCards()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //FUNCTION: Generate Cards
    func dealCards () {
        NSLog("\(cards.count)")
        if cards.count > 0 {
            blackCard.text = cards[0].blackCardContent
            
            for i in 0..<whiteCards.count{
                whiteCards[i].setTitle(
                    cards[0].whiteCardsContent[i],
                    for: UIControlState.normal)
            }
        }
    }
    
    //ACTION: Return to login page
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
