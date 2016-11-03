//
//  VoteVC.swift
//  Coders-Against-Humanity
//
//  Created by ThunderWhatever on 11/1/16.
//  Copyright © 2016 ThunderWhatever. All rights
//

import UIKit

class VoteVC: UIViewController {
    
    
    // VARIABLES: blackCard Text via segue
    @IBOutlet weak var blackCard: UITextView!
    var blackCardContent = Information.Cards.currentBlackCard
    var didVote = false

    
    // PLAYGROUND: manipulating whitecard data
    @IBOutlet weak var Player1Card: UIButton!
    @IBOutlet weak var displayP1vCount: UILabel!
    var player1CardContent = Information.Cards.selectedWhiteCard
    var votesForPlayer1 = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blackCard.text = blackCardContent
        Player1Card.setTitle(player1CardContent, for: UIControlState.normal)
    }
    
    
    
    //PLAYGROUND ACTION: capturing votes
    @IBAction func VotedPlayer1(_ sender: UIButton) {
        if didVote == false {
            votesForPlayer1 += 1
            displayP1vCount.text = "\(votesForPlayer1)"
            didVote = true
        }
        performSegue(withIdentifier: "WinnerSegue", sender: sender)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// END OF CLASS: VoteVC
}
