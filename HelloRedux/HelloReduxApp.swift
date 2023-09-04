//
//  HelloReduxApp.swift
//  HelloRedux
//
//  Created by Tejas on 2023-09-03.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    var body: some Scene {
        let store = Store(reducer: reducer(_:_:))
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
