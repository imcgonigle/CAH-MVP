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
    
    var blackCardContent = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        blackCard.text = blackCardContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// END OF CLASS: LoginVC
}
