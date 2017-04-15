//
//  SM2EngineTests.swift
//  SMLib
//
//  Created by Mustafa on 3/24/17.
//
//

import Foundation
import XCTest
import SMLib

class SM2EngineTests: XCTestCase {

    func testgrade_0_response() {
        let flashcardgrade = Grade.null
        let october_23_2016 = 1477207892.0
        let expectedEasinessFactor = 2.5
        let card = Flashcard(front: "Front", back: "Back")
        card.previousDate = october_23_2016
        card.nextDate = october_23_2016
        let engine = SM2Engine()
        let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: october_23_2016)
        XCTAssertEqual(gradedCard.repetition, 0)
        XCTAssertEqual(gradedCard.interval, 0)
        XCTAssertEqual(gradedCard.easinessFactor, expectedEasinessFactor)
        XCTAssertEqual(gradedCard.previousDate, october_23_2016)
        XCTAssertEqual(gradedCard.nextDate, october_23_2016)
    }

    func testgrade_1_response() {
        let flashcardgrade = Grade.bad
        let october_23_2016 = 1477207892.0
        let expectedEasinessFactor = 2.5
        let card = Flashcard(front: "Front", back: "Back")
        card.previousDate = october_23_2016
        card.nextDate = october_23_2016
        let engine = SM2Engine()
        let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: october_23_2016)
        XCTAssertEqual(gradedCard.repetition, 0)
        XCTAssertEqual(gradedCard.interval, 0)
        XCTAssertEqual(gradedCard.easinessFactor, expectedEasinessFactor)
        XCTAssertEqual(gradedCard.previousDate, october_23_2016)
        XCTAssertEqual(gradedCard.nextDate, october_23_2016)
    }

    func testgrade_2_response() {
        let flashcardgrade = Grade.fail
        let october_23_2016 = 1477207892.0
        let expectedEasinessFactor = 2.5
        let card = Flashcard(front: "Front", back: "Back")
        card.previousDate = october_23_2016
        card.nextDate = october_23_2016
        let engine = SM2Engine()
        let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: october_23_2016)
        XCTAssertEqual(gradedCard.repetition, 0)
        XCTAssertEqual(gradedCard.interval, 0)
        XCTAssertEqual(gradedCard.easinessFactor, expectedEasinessFactor)
        XCTAssertEqual(gradedCard.previousDate, october_23_2016)
        XCTAssertEqual(gradedCard.nextDate, october_23_2016)
    }

    func testgrade_3_response() {
        let flashcardgrade = Grade.pass
        let october_23_2016 = 1477207892.0
        let expectedEasinessFactor = 2.36
        let card = Flashcard(front: "Front", back: "Back")
        card.previousDate = october_23_2016
        card.nextDate = october_23_2016
        let engine = SM2Engine()
        let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: october_23_2016)
        XCTAssertEqual(gradedCard.repetition, 1)
        XCTAssertEqual(gradedCard.interval, 0)
        XCTAssertEqual(gradedCard.easinessFactor, expectedEasinessFactor)
        XCTAssertEqual(gradedCard.previousDate, october_23_2016)
        XCTAssertEqual(gradedCard.nextDate, october_23_2016)
    }

    func testgrade_4_response() {
        let flashcardgrade = Grade.good
        let october_23_2016 = 1477207892.0
        let oneDay = 86400.0
        let october_24_2016 = october_23_2016 + oneDay
        let expectedEasinessFactor = 2.5
        let card = Flashcard(front: "Front", back: "Back")
        card.previousDate = october_23_2016
        card.nextDate = october_23_2016
        let engine = SM2Engine()
        let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: october_23_2016)
        XCTAssertEqual(gradedCard.repetition, 1)
        XCTAssertEqual(gradedCard.interval, 1)
        XCTAssertEqual(gradedCard.easinessFactor, expectedEasinessFactor)
        XCTAssertEqual(gradedCard.previousDate, october_23_2016)
        XCTAssertEqual(gradedCard.nextDate, october_24_2016)
    }

    func testgrade_5_response() {
        let flashcardgrade = Grade.bright
        let october_23_2016 = 1477207892.0
        let oneDay = 86400.0
        let october_24_2016 = october_23_2016 + oneDay
        let expectedEasinessFactor = 2.6
        let card = Flashcard(front: "Front", back: "Back")
        card.previousDate = october_23_2016
        card.nextDate = october_23_2016
        let engine = SM2Engine()
        let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: october_23_2016)
        XCTAssertEqual(gradedCard.repetition, 1)
        XCTAssertEqual(gradedCard.interval, 1)
        XCTAssertEqual(gradedCard.easinessFactor, expectedEasinessFactor)
        XCTAssertEqual(gradedCard.previousDate, october_23_2016)
        XCTAssertEqual(gradedCard.nextDate, october_24_2016)
    }

    func testgrade_5_long_response() {
        let flashcardgrade = Grade.bright
        let october_23_2016 = 1477207892.0
        let oneDay = 86400.0
        let november_8_2016 = october_23_2016 + (oneDay * 16)
        let expectedEasinessFactor = 2.6
        let card = Flashcard(front: "Front", back: "Back")
        card.interval = 6
        card.repetition = 6
        card.previousDate = october_23_2016
        card.nextDate = october_23_2016
        let engine = SM2Engine()
        let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: october_23_2016)
        XCTAssertEqual(gradedCard.repetition, 7)
        XCTAssertEqual(gradedCard.interval, 16)
        XCTAssertEqual(gradedCard.easinessFactor, expectedEasinessFactor)
        XCTAssertEqual(gradedCard.previousDate, october_23_2016)
        XCTAssertEqual(gradedCard.nextDate, november_8_2016)
    }

    func testgrade_6_response() {
        let flashcardgrade = Grade.pass
        let october_23_2016 = 1477207892.0
        let expectedEasinessFactor = 1.3
        let card = Flashcard(front: "Front", back: "Back")
        card.easinessFactor = 1.2
        card.interval = 1
        card.repetition = 1
        card.previousDate = october_23_2016
        card.nextDate = october_23_2016
        let engine = SM2Engine()
        let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: october_23_2016)
        XCTAssertEqual(gradedCard.repetition, 2)
        XCTAssertEqual(gradedCard.interval, 0)
        XCTAssertEqual(gradedCard.easinessFactor, expectedEasinessFactor)
        XCTAssertEqual(gradedCard.previousDate, october_23_2016)
        XCTAssertEqual(gradedCard.nextDate, october_23_2016)
    }

}
