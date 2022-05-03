//
//  LandingPage.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/12/22.
//

import Foundation
import SwiftUI

struct HomePageView: View{
    @EnvironmentObject var auctionList:AuctionList
    @EnvironmentObject var userList:UserList
    
    var body: some View{
        
        VStack(alignment: .center){
            Image("Auctioneer").resizable().aspectRatio(contentMode: .fit)
            
            NavigationLink(destination: SignupView().environmentObject(auctionList).environmentObject(userList), label: {
                Text("Sign Up")
            }).padding()
            NavigationLink(destination: LoginView().environmentObject(auctionList).environmentObject(userList), label: {
                Text("Login")
            }).padding()
            
            
        }.navigationBarBackButtonHidden(true).navigationBarHidden(true )
        
        
    }
}



