//
//  ViewController.swift
//  Example
//
//  Created by Mustafa on 4/13/17.
//  Copyright © 2017 SMLib. All rights reserved.
//

import UIKit
import SMLib

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    var deck = [Flashcard]()
    let engine = SM2Engine()
    var currentIndex = 0 {
        didSet {
            frontLabel.text = deck[currentIndex].front
            backLabel.text = deck[currentIndex].back
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addCards()
        getNextCard()
    }

    func getNextCard() {
        currentIndex = Int(arc4random_uniform(UInt32(deck.count)))
    }

    @IBAction func rateClicked(_ sender: UIButton) {
        let flashcard = deck[currentIndex]
        print("Original Card: \(flashcard)")
        let grade = sender.tag
        let gradedCard = engine.gradeFlashcard(flashcard: flashcard, grade: Grade(rawValue: grade)!, currentDatetime: NSDate().timeIntervalSince1970)
        print("Graded Card: \(gradedCard)")
        getNextCard()
    }

    func addCards() {
        let card1 = Flashcard(front: "🐒", back: "Monkey")
        let card2 = Flashcard(front: "🐘", back:"Elephant")
        let card3 = Flashcard(front: "🐎", back:"Horse")
        let card4 = Flashcard(front: "🐕", back:"Dog")
        let card5 = Flashcard(front: "🐈", back:"Cat")
        let card6 = Flashcard(front:  "🐳", back:"Whale")
        deck.append(card1)
        deck.append(card2)
        deck.append(card3)
        deck.append(card4)
        deck.append(card5)
        deck.append(card6)
    }
}
