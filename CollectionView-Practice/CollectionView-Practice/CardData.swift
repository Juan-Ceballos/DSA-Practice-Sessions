//
//  CardData.swift
//  Metro-Wallet
//
//  Created by Matthew Ramos on 11/30/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import Foundation

protocol CardData {
    var name: String { get set }
    var expiration: Date { get set } //check if get or get set is more applicable
    var cardType: CardType { get set }
}

enum CardType {
    case regular
    case reducedFare
    case student
    case sevenDay
    case thirtyDay
}

class BalanceCardData: CardData {
    var name: String
    var cardType: CardType
    var balance: Double
    var expiration: Date
    var decrementValue: Double
    
    init(name: String, cardType: CardType, balance: Double, expiration: Date, decrementValue: Double) {
        self.name = name
        self.cardType = cardType
        self.balance = balance
        self.expiration = expiration
        self.decrementValue = decrementValue
    }
    
    static let balanceCards = [
        BalanceCardData(name: "Regular", cardType: CardType.regular, balance: 0 , expiration: Date(), decrementValue: 2.75),
        BalanceCardData(name: "ReducedFare", cardType: CardType.reducedFare, balance: 0, expiration: Date(), decrementValue: 1.35)
    ]
    
    static let allBalanceCards: [BalanceCardData] = [BalanceCardData(name: "Regular", cardType: CardType.regular, balance: 0, expiration: Date(), decrementValue: 2.75), BalanceCardData(name: "ReducedFare", cardType: CardType.reducedFare, balance: 0, expiration: Date(), decrementValue: 0), BalanceCardData(name: "Student", cardType: CardType.student, balance: 0, expiration: Date(), decrementValue: 0)]
    
}

class UnlimitedCardData: CardData {
    var name: String
    var expiration: Date
    var unlimitedExpiration: Date
    var cardType: CardType
    var numberOfRides: Double
    
    static func addThirtyDays() -> Date? {
            var timeValue = DateComponents()
            timeValue.day = 30
            let thirtyDayExpirationDate = Calendar.current.date(byAdding: timeValue, to: Date())
            return thirtyDayExpirationDate
        }
    
        static func addSevenDays() -> Date? {
            var timeValue = DateComponents()
            timeValue.day = 7
            let sevenDayExpirationDate = Calendar.current.date(byAdding: timeValue, to: Date())
            return sevenDayExpirationDate
        }
    
    init(name: String, cardType: CardType, expiration: Date, unlimitedExpiration: Date, numberOfRides: Double) {
        self.name = name
        self.cardType = cardType
        self.unlimitedExpiration = unlimitedExpiration
        self.expiration = expiration
        self.numberOfRides = numberOfRides
    }
    
    static let unlimitedCards = [
        UnlimitedCardData(name: String(), cardType: CardType.student, expiration: Date(), unlimitedExpiration: Date(), numberOfRides: 3),
        UnlimitedCardData(name: String(), cardType: CardType.sevenDay, expiration: Date(), unlimitedExpiration: Date(), numberOfRides: Double.infinity),
        UnlimitedCardData(name: String(), cardType: CardType.thirtyDay, expiration: Date(), unlimitedExpiration: Date(), numberOfRides: Double.infinity)
    ]
    
    static let allUnlimitedCards: [UnlimitedCardData] = [UnlimitedCardData(name: "Student", cardType: CardType.student, expiration: Date(), unlimitedExpiration: Date(), numberOfRides: 3), UnlimitedCardData(name: "SevenDay", cardType: CardType.sevenDay, expiration: Date(), unlimitedExpiration: addSevenDays() ?? Date(), numberOfRides: Double.infinity), UnlimitedCardData(name: "ThirtyDay", cardType: CardType.thirtyDay, expiration: Date(), unlimitedExpiration: addThirtyDays() ?? Date(), numberOfRides: Double.infinity)]
}
