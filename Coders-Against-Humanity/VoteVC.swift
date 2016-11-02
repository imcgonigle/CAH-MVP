//
//  VoteVC.swift
//  Coders-Against-Humanity
//
//  Created by ThunderWhatever on 11/1/16.
//  Copyright © 2016 ThunderWhatever. All rights
//

import UIKit

class VoteVC: UIViewController {
    //VARIABLE: blackCard Text via segue
    @IBOutlet weak var blackCard: UITextView!
    
    var blackCardContent = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        blackCard.text = blackCardContent
        
//        // ACTION: dyn label
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        label.center = CGPoint(x: 160, y: 285)
//        label.textAlignment = .center
//        label.text = blackCardContent
//        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let winnerVC : WinnerVC = segue.destination as! WinnerVC
        winnerVC.blackCardContent = blackCardContent
    }
    
// END OF CLASS: VoteVC
}
