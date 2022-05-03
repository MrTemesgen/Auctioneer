//
//  AuctioneerApp.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/12/22.
//

import SwiftUI

@main
struct AuctioneerApp: App {
    
    @StateObject var auctions:AuctionList = AuctionList()
    @StateObject var userList:UserList = UserList()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(auctions).environmentObject(userList)
        }
    }
}
