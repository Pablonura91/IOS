//
//  Concentration.swift
//  ConcentrationLSG
//  Copyright © 2019 CFGS La Salle Gracia. All rights reserved.
//

import Foundation

class Concentration{
    var emojiChoices = ["😈","😱","👻","👽","🎃","🙀","👾","👹","🤡","🤖","☠️"]
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard:Int?
    
    init(numberOfPairsOfCards:Int){
        for _ in 0..<numberOfPairsOfCards{
            //select random emoji from emojiChoices
            let randomIndex = Int.random(in: 0..<emojiChoices.count)
            //asign emoji to Card
            let card = Card(emoji: emojiChoices[randomIndex])
            //delete from emojiChoices to avoid future occurrences
            emojiChoices.remove(at: randomIndex)
            //add pair of cards
            cards.append(card)
            cards.append(card)
        }
        
        //TODO: Shuffle the cards
        cards.shuffle()
        
    }
    
    
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].emoji == cards[index].emoji{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFadeUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up -> flip down
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFadeUp = false
                }
                cards[index].isFadeUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
}
