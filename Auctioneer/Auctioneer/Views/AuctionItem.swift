//
//  AuctionItem.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/27/22.
//

import Foundation
import SwiftUI

struct AuctionItemView: View{
    @State var user:User
    @EnvironmentObject var auctionList:AuctionList
    @EnvironmentObject var userList:UserList
    @State var idx:Int
    @State var image:Image
    @State var startbid:CGFloat

    
    var body: some View{
                
        Form{
            HStack{
            Spacer()
                image.resizable().frame(width: 150, height: 225, alignment: .center).overlay(RoundedRectangle(cornerRadius:2).stroke(.black, lineWidth: 1))
                
            Spacer()
                VStack{
                   
                    
                    Text(user.ArtWorks[idx].name).font(Font.subheadline)
                    Text("By:\(user.ArtWorks[idx].org_author)").font(Font.caption).foregroundColor(.gray)
                    Text(user.ArtWorks[idx].date).font(Font.caption).foregroundColor(.gray)
                        
                 
                
                }
            }
            
            VStack{
                HStack{
                Spacer()
                    Text("Choose the starting bid: \(String(format: "$%.2f", startbid))").font(Font.subheadline)
                    Spacer()
                }
                    Slider(value: $startbid, in: 0...100)
            }
            
            HStack{
                Spacer()
                Button{
                    if(!user.ArtWorks[idx].onAuction){
                                                auctionList.add(auction:Auction(user: user, image: idx, bid: startbid))
                                                user.ArtWorks[idx].onAuction = true
                                           }
                } label: {
                    Text("Create Auction")
                }
               
                Spacer()
            }
            }
    }
}


