//
//  SwiftUICombineAndDataApp.swift
//  SwiftUICombineAndData
//
//  Created by MANAS VIJAYWARGIYA on 22/10/21.
//

import SwiftUI

@main
struct SwiftUICombineAndDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
