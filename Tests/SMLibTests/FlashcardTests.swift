//
//  FlashcardTests.swift
//  SMLib
//
//  Created by Mustafa on 3/24/17.
//
//

import Foundation
import XCTest
import SMLib

class FlashcardTests: XCTestCase {

    func testFlashcardInit() {
        let card = Flashcard(front: "Front", back: "Back")
        XCTAssertEqual(card.front, "Front")
        XCTAssertEqual(card.back, "Back")
    }

    func testGradeDescription() {
        XCTAssertEqual(Grade.null.description, "complete blackout")
        XCTAssertEqual(Grade.bad.description, "incorrect response; the correct one remembered")
        XCTAssertEqual(Grade.fail.description, "incorrect response; where the correct one seemed easy to recall")
        XCTAssertEqual(Grade.pass.description, "correct response recalled with serious difficulty")
        XCTAssertEqual(Grade.good.description, "correct response after a hesitation")
        XCTAssertEqual(Grade.bright.description, "perfect response")
    }

    func testFlashcardEquatable1() {
        let card1 = Flashcard(front: "Front", back: "Back")
        let card2 = Flashcard(front: "Front", back: "Back")
        XCTAssertNotEqual(card1, card2)
    }

    func testFlashcardEquatable2() {
        let card1 = Flashcard(front: "Front", back: "Back")
        let card2 = Flashcard(front: "Front", back: "Back")
        card2.uuid = card1.uuid
        XCTAssertEqual(card1, card2)
    }

    func testFlashcardHashable() {
        let card1 = Flashcard(front: "Front1", back: "Back1")
        let card2 = Flashcard(front: "Front2", back: "Back2")
        let cardDictionary = [card1: "Card1", card2: "Card2"]
        XCTAssertEqual(cardDictionary.count, 2)
    }

}
