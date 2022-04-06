//
//  AuctionPage.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/6/22.
//

import Foundation
import SwiftUI

struct AuctionView: View{
    @State var message = ""
    var body : some View {
        Form{
            HStack{
            Spacer()
                Image("M1")
            Spacer()
            }
            HStack{
                Spacer()
                VStack{
                    Text("Current Highest Bid: $5")
                    
                    HStack{
                        Text("Time Left: ")
                        Text("inf").foregroundColor(Color.red)
                        
                    }
                }
                Spacer()
            }
            HStack{
                Text("Image: M1")
                Text("Worth: $13")
            }
            VStack{
                Text("Bidders: list of bidders")
                
            }
            
        }
        
        Form{
            HStack{
                Spacer()
                Text("Comments Section").foregroundColor(Color.blue).bold().padding()
                Spacer()
            }
            TextField("Add a comment", text: $message)
            ForEach((0...10), id:\.self){
                _ in
                Text(message)
            }
        }
    }
    
}
