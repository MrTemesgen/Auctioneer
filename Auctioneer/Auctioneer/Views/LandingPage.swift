//
//  LandingPage.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/12/22.
//

import Foundation
import SwiftUI

struct HomePageView: View{
    
    
    var body: some View{
        NavigationView{
            VStack(alignment: .center){
                Image("Auctioneer").resizable().aspectRatio(contentMode: .fit)
                
                NavigationLink(destination: SignupView(), label: {
                    Text("Sign Up")
                })
                Button("Login"){
                    //Go to the sign up view.
                }.padding()
                NavigationLink(destination: ProfileView(), label: {
                    Text("Test Profile Page")
                })
                NavigationLink(destination: AuctionView(), label: {
                    Text("Test Auction Page")
                })
            }
            
        }
    }
}



