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
    
    //PLAYGROUNG VARIABLES
    // TEMP VARIABLES: to log results from button click
    @IBOutlet weak var pickedCardText: UILabel!
    @IBOutlet weak var pickedCardTag: UILabel!
    
    //TO DO: a function to capitalize white cards
    override func viewDidLoad() {
        super.viewDidLoad()
        dealBlackCard()
        dealWhiteCards()
        //Injecting in black & white card text
        cards = 
            Cards(
                blackCardContent: Information.Cards.currentBlackCard,
                whiteCardsContent: Information.Cards.playersCards
            )
        displayCards()
    }

    func displayCards () {
        blackCard.text = cards.blackCardContent
        
        for i in 0..<whiteCards.count{
            whiteCards[i].setTitle(
                cards.whiteCardsContent[i],
                for: UIControlState.normal
            )
            whiteCards[i].tag = i + 1
            whiteCards[i].addTarget(self, action: #selector(self.addIBAction), for: UIControlEvents.touchUpInside)
            
        }
    }
    
    //PLAYGROUND: to see what i can do with UIBUTTON arg and .tag property
    func addIBAction(_ sender: UIButton!) {
        Information.Cards.selectedWhiteCard = sender.currentTitle!
        if let index = Information.Cards.playersCards.index(of: sender.currentTitle!) {
            Information.Cards.playersCards.remove(at: index)
        }
        performSegue(withIdentifier: "VoteSegue", sender: sender)
    }
    
    func dealBlackCard() {
        Information.Cards.currentBlackCard = Information.Cards.blackCards[Information.Cards.blackCounter]
        Information.Cards.blackCounter += 1
    }

    func dealWhiteCards() {
        var nextCard = String()
        
        if Information.Cards.playersCards.count == 0 {
            var whiteCards = [String]()
            for _ in 0...6{
                nextCard = Information.Cards.whiteCards[Information.Cards.whiteCounter]
                whiteCards.append(nextCard)
                Information.Cards.whiteCounter += 1
            }
            Information.Cards.playersCards = whiteCards
        } else {
            nextCard = Information.Cards.whiteCards[Information.Cards.whiteCounter]
            Information.Cards.playersCards.append(nextCard)
            Information.Cards.whiteCounter += 1
        }
        
        
    }
    
    //ACTION: Return to login page
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// END OF CLASS: GameVC
}
