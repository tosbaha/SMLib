//
//  SMEngineProtocol.swift
//  SMLib
//
//  Created by Mustafa on 3/28/17.
//
//

import Foundation
protocol SMEngine {
    /// Grade a `Flashcard`,with grade and time
    ///
    /// - Parameters:
    ///   - flashcard: Flashcard
    ///   - grade: Grade
    ///   - currentDatetime: grade Time
    /// - Returns: graded card
    func gradeFlashcard(flashcard: Flashcard, grade: Grade, currentDatetime: TimeInterval) -> Flashcard
}
