//
//  ViewController.swift
//  ConcentrationLSG
//  Copyright © 2019 CFGS La Salle Gracia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var concentration = Concentration(numberOfPairsOfCards: 8)
    var flips: Int = 0
    @IBOutlet var outletCollection: [UIButton]!
    
    @IBOutlet weak var labelFlips: UILabel!
    
    @IBAction func actionButton(_ sender: UIButton) {
        switch sender.tag {
            case 1...16:
                
                concentration.chooseCard(at: sender.tag - 1)
                
                if (concentration.indexOfOneAndOnlyFaceUpCard == nil){
                    outletCollection[sender.tag - 1].setTitle(concentration.cards[sender.tag - 1].emoji, for: UIControl.State.normal)
                    outletCollection[sender.tag - 1	].backgroundColor = UIColor.clear
                    
                } else {
                    for iterator in concentration.cards.indices{
                            if (!concentration.cards[iterator].isFadeUp && !concentration.cards[iterator].isMatched){
                                outletCollection[iterator].setTitle("", for: UIControl.State.normal)
                                outletCollection[iterator].backgroundColor = UIColor.gray
                            }
                        }
                    outletCollection[sender.tag - 1].setTitle(concentration.cards[sender.tag - 1].emoji, for: UIControl.State.normal)
                    outletCollection[sender.tag - 1    ].backgroundColor = UIColor.clear
                }
            flips+=1
                labelFlips.text = "Flips: \(flips)"
        case 17:
           concentration.reset()
           for iterator in concentration.cards.indices{
                outletCollection[iterator].setTitle("", for: UIControl.State.normal)
                outletCollection[iterator].backgroundColor = UIColor.gray
            }
           flips = 0
           labelFlips.text = "Flips: \(flips)"
            concentration = Concentration(numberOfPairsOfCards: 8)
        default:
            break
        }
    }
}

