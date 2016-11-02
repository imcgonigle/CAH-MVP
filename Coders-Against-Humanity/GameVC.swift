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
    
    @IBOutlet weak var originalTag: UILabel!
    @IBOutlet weak var tagInfo: UILabel!
    @IBOutlet weak var whiteCardContent: UILabel!
    @IBOutlet weak var card1: UIButton!
    
    
    
    //VARIABLES: used within view
    var cards = Cards()
    
    
    //PLAYGROUNG VARIABLES
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
    
    // FUNCTION: Send data thru segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let voteVC : VoteVC = segue.destination as! VoteVC
        voteVC.blackCardContent = cards.blackCardContent
        voteVC.player1CardContent = selectedWhiteCard
    }
    
    //ACTION: Return to login page
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //PLAYGROUND: to see what i can do with UIBUTTON arg and .tag property
    @IBAction func Hicard1(_ sender: UIButton) {
        originalTag.text = "I am original: \(sender.tag)"
        sender.tag = 3
        tagInfo.text = "I should change: \(sender.tag)"
        let selectedCard = card1.currentTitle
        whiteCardContent.text = selectedCard
        selectedWhiteCard = selectedCard!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
// END OF CLASS: GameVC
}
