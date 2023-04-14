//
//  TestSeven.swift
//  SwiftUIIntro
//
//  Created by Ильдар Аглиуллов on 14.04.2023.
//

import SwiftUI
import AGLUI

class OnboardingCardsData: ObservableObject {
    
    let cards: [OnboardingCard]
    
    var primary: OnboardingCard {
        cards.first!
    }
    
    init() {
        cards = Bundle.main.decode([OnboardingCard].self, from: "cards.json")
    }
}
