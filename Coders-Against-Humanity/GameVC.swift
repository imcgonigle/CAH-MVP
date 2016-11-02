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
    @IBOutlet weak var tagInfo: UILabel!

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
    
    // FUNCTION: Send blackCard.text thru to VoteVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let voteVC : VoteVC = segue.destination as! VoteVC
        voteVC.blackCardContent = cards.blackCardContent
    }
    
    //ACTION: Return to login page
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Hicard1(_ sender: UIButton) {
        tagInfo.text = "I am sender: \(sender.tag)"
    }
    
// END OF CLASS: GameVC
}
