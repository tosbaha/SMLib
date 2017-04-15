/*:
 # SMLib
 SMLib grades Flashcard with SuperMemo SM2 algoritm.
 
 You must have to build `SMLib iOS` package for import.
 */
import SMLib
import Foundation

var deck = [Flashcard]()
var card1 = Flashcard(front: "Hello", back: "Merhaba")
let card2 = Flashcard(front: "Come", back: "Gel")
let card3 = Flashcard(front: "Go", back: "Git")

deck.append(card1)
deck.append(card2)
deck.append(card3)

print(card1.previousDate)
print(card1.nextDate)
print(card1.repetition)

let engine = SM2Engine()
let gradedCard1 = engine.gradeFlashcard(flashcard: card1, grade: .pass, currentDatetime: Date().timeIntervalSince1970)

print(gradedCard1.previousDate)
print(gradedCard1.nextDate)
print(gradedCard1.repetition)

let gradedCard2 = engine.gradeFlashcard(flashcard: card1, grade: .bad, currentDatetime: Date().timeIntervalSince1970)

print(gradedCard2.previousDate)
print(gradedCard2.nextDate)
print(gradedCard2.repetition)
