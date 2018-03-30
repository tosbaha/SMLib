//
//  SrsEngine.swift
//  SMLib
//
//  Created by Mustafa on 3/24/17.
//
//

import Foundation

public class SM2Engine: SMEngine {
    /// Max Grade `Grade.bright`
    /// The default value is 5
    var maxQuality: Int
    /// Easiness Factor
    /// The default value is 1.3
    var easinessFactor: Double

    public init(maxQuality: Int=5, easinessFactor: Double=1.3) {
        self.maxQuality = maxQuality
        self.easinessFactor = easinessFactor
    }

    /// Grade Flash card
    ///
    /// - Parameters:
    ///   - flashcard: Flashcard
    ///   - grade: Grade(0-5)
    ///   - currentDatetime: TimeInterval
    /// - Returns: Flashcard with new interval and repetition
    public func gradeFlashcard(flashcard: Flashcard, grade: Grade, currentDatetime: TimeInterval) -> Flashcard {
        let cardGrade = grade.rawValue
        if cardGrade < 3 {
            flashcard.repetition = 0
            flashcard.interval = 0
        } else {
            let qualityFactor = Double(maxQuality - cardGrade) // CardGrade.bright.rawValue - grade
            let newEasinessFactor = flashcard.easinessFactor + (0.1 - qualityFactor * (0.08 + qualityFactor * 0.02))
            if newEasinessFactor < easinessFactor {
                flashcard.easinessFactor = easinessFactor
            } else {
                flashcard.easinessFactor = newEasinessFactor
            }
            flashcard.repetition += 1
            switch flashcard.repetition {
            case 1:
                flashcard.interval = 1
            case 2:
                flashcard.interval = 6
            default:
                let newInterval = ceil(Double(flashcard.repetition - 1) * flashcard.easinessFactor)
                flashcard.interval = Int(newInterval)
            }
        }
        if cardGrade == 3 {
            flashcard.interval = 0
        }
        let seconds = 60
        let minutes = 60
        let hours = 24
        let dayMultiplier = seconds * minutes * hours
        let extraDays = dayMultiplier * flashcard.interval
        let newNextDatetime = currentDatetime + Double(extraDays)
        flashcard.previousDate = flashcard.nextDate
        flashcard.nextDate = newNextDatetime
        return flashcard
    }
}
