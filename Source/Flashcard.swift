//
//  Flashcard.swift
//  SMLib
//
//  Created by Mustafa on 3/24/17.
//
//

import Foundation

/// Flashcard
public class Flashcard: Equatable, Hashable {
    public var front: String
    public var back: String
    public var uuid: UUID
    public var repetition = 0
    public var interval = 0
    public var easinessFactor = 2.5
    public var previousDate = Date().timeIntervalSince1970
    public var nextDate = Date().timeIntervalSince1970
    public var hashValue: Int {
        return uuid.hashValue
    }

    public init(front: String, back: String) {
        self.uuid = UUID()
        self.front = front
        self.back = back
    }

    public static func == (lhs: Flashcard, rhs: Flashcard) -> Bool {
        return lhs.uuid == rhs.uuid &&
            lhs.front == rhs.front &&
            lhs.back == rhs.back
    }
}

/**  Grades from SuperMemo Algorithm
 * 0 - complete blackout.
 * 1 - incorrect response; the correct one remembered
 * 2 - incorrect response; where the correct one seemed easy to recall
 * 3 - correct response recalled with serious difficulty
 * 4 - correct response after a hesitation
 * 5 - perfect response
 */
public enum Grade: Int, CustomStringConvertible {
    /// complete blackout.
    case null
    /// incorrect response; the correct one remembered
    case bad
    /// incorrect response; where the correct one seemed easy to recall
    case fail
    /// correct response recalled with serious difficulty
    case pass
    /// correct response after a hesitation
    case good
    /// perfect response
    case bright

    public var description: String {
        switch self {
        case .null:
            return "complete blackout"
        case .bad:
            return "incorrect response; the correct one remembered"
        case .fail:
            return "incorrect response; where the correct one seemed easy to recall"
        case .pass:
            return "correct response recalled with serious difficulty"
        case .good:
            return "correct response after a hesitation"
        case .bright:
            return "perfect response"
        }
    }
}
