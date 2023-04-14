//
//  SwiftUIIntroApp.swift
//  SwiftUIIntro
//
//  Created by Ильдар Аглиуллов on 13.04.2023.
//

import SwiftUI

@main
struct SwiftUIIntroApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
