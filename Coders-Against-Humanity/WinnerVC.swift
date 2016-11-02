//
//  WinnerVC.swift
//  Coders-Against-Humanity
//
//  Created by ThunderWhatever on 11/1/16.
//  Copyright © 2016 ThunderWhatever. All rights
//

import UIKit

class WinnerVC: UIViewController {
    @IBOutlet weak var blackCard: UITextView!
    @IBOutlet weak var whiteCard: UITextView!
    @IBOutlet weak var numOfVotes: UILabel!
    
    var blackCardContent : String!
    var whiteCardContent : String!
    var voteCount : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blackCard.text = blackCardContent
        whiteCard.text = whiteCardContent
        let voteCountString = "\(voteCount)"
        numOfVotes.text = voteCountString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// END OF CLASS: LoginVC
}
