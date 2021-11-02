//
//  SwiftUICombineAndDataApp.swift
//  SwiftUICombineAndData
//
//  Created by MANAS VIJAYWARGIYA on 22/10/21.
//

import SwiftUI
import Firebase

@main
struct SwiftUICombineAndDataApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate // Add this line
    
    let persistenceController = PersistenceController.shared

//    init() {
//        FirebaseApp.configure()
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
