//
//  AuctioneerApp.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/12/22.
//

import SwiftUI

@main
struct AuctioneerApp: App {
   @StateObject var users: UserList  = UserList()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(users)
        }
    }
}
