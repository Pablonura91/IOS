//
//  ViewController.swift
//  ConcentrationLSG
//  Copyright © 2019 CFGS La Salle Gracia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let concentration = Concentration(numberOfPairsOfCards: 8)

    @IBOutlet var outletCollection: [UIButton]!


    @IBAction func actionButton(_ sender: UIButton) {
        switch sender.tag {
            case 1...16:
                if (!concentration.cards[sender.tag - 1].isFadeUp){
                
                    concentration.chooseCard(at: sender.tag - 1)
                    
                    outletCollection[sender.tag - 1].setTitle(concentration.cards[sender.tag - 1].emoji, for: UIControl.State.normal)
                    outletCollection[sender.tag - 1	].backgroundColor = UIColor.clear
                    
                    if (concentration.indexOfOneAndOnlyFaceUpCard == nil){
                    for iterator in concentration.cards.indices{
                        if (!concentration.cards[iterator].isMatched && (iterator != sender.tag - 1)){
                            outletCollection[iterator].setTitle("", for: UIControl.State.normal)
                            outletCollection[iterator].backgroundColor = UIColor.gray
                        }
                    }
                }
            }
            default:
                break
        }
    }
}

