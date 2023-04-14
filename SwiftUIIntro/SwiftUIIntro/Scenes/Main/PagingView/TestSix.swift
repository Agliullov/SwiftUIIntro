//
//  TestSix.swift
//  SwiftUIIntro
//
//  Created by Ильдар Аглиуллов on 14.04.2023.
//

import SwiftUI

struct OnboardingCard: Codable, Identifiable, Equatable {

    var id: UUID
    var title: String
    var subTitle: String
    var image: String
}
