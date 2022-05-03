//
//  ContentView.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/12/22.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var auctionList:AuctionList
    @EnvironmentObject var userList:UserList
    
    var body: some View {
        NavigationView {
            HomePageView().environmentObject(auctionList).environmentObject(userList)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //create a null user
        ContentView().environmentObject(AuctionList())
            .environmentObject(User(UserName: "", Password: "", Avatar: Image("1"))).environmentObject(UserList())
            .previewInterfaceOrientation(.portrait)
    }
}
