//
//  GameVC.swift
//  Coders-Against-Humanity
//
//  Created by ThunderWhatever on 11/1/16.
//  Copyright © 2016 ThunderWhatever. All rights
//

import UIKit

// PROTOTYPE: card
struct Cards {
    var blackCardContent : String!
    var whiteCardsContent : [String]!
}

// CLASS: GAME VC
class GameVC: UIViewController {
    @IBOutlet weak var blackCard: UITextView!
    @IBOutlet var whiteCards: [UIButton]!

    //VARIABLES: used within view
    var cards = Cards()
    var selectedWhiteCard = String()
    
    
    //TO DO: a function to capitalize white cards
    override func viewDidLoad() {
        super.viewDidLoad()
        //Injecting in black & white card text
        cards =
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
        dealCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //FUNCTION: Generate Cards
    func dealCards () {
        blackCard.text = cards.blackCardContent
        for i in 0..<whiteCards.count{
            whiteCards[i].setTitle(
                cards.whiteCardsContent[i],
                for: UIControlState.normal
            )
        }
    }
    
    //ACTION: Return to login page
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

// END OF CLASS: GameVC
}
