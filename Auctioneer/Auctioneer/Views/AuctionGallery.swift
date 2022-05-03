//
//  AuctionGallery.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/27/22.
//

import Foundation
import SwiftUI
import PencilKit

struct AuctionGallery: View{
    @State var user:User
    @EnvironmentObject var auctionList:AuctionList
    @EnvironmentObject var userList:UserList
    @State var isNavBarHidden = false
    var body: some View{
        
        
        ScrollView{
            HStack{Spacer()
                Text("Auctions Gallery")
                Spacer()}
            VStack(alignment: .leading, spacing: 10){
                ForEach(auctionList.Auctions.indices, id:\.self) { index in
                    if(!auctionList.Auctions[index].over){
                        NavigationLink(destination:  AuctionView(auction: $auctionList.Auctions[index], idx:index, bid: $auctionList.Auctions[index].bid, user:user, time: Int(auctionList.Auctions[index].number)!).environmentObject(user).environmentObject(auctionList).environmentObject(userList)) {
                            HStack{
                                auctionList.Auctions[index].image.image.resizable().frame(width: 100, height: 175, alignment: .center).overlay(RoundedRectangle(cornerRadius:2).stroke(.black, lineWidth: 1))
                                Spacer()
                                VStack{
                                    
                                    Text(auctionList.Auctions[index].image.name).font(Font.subheadline)
                                    Text("By:\(auctionList.Auctions[index].image.org_author)").font(Font.caption).foregroundColor(.gray)
                                    Text(auctionList.Auctions[index].image.date).font(Font.caption).foregroundColor(.gray)
                                    Text(String(format: "$%.2f", auctionList.Auctions[index].bid )).font(Font.caption).foregroundColor(.green)
                                    
                                }
                                Spacer()
                            }.padding()
                            
                        }
                    }
                }
            }
            Spacer()
        }.navigationBarTitle("")
            .navigationBarHidden(self.isNavBarHidden)
        .onAppear {
            self.isNavBarHidden = true
        }.onDisappear {
            self.isNavBarHidden = false
        }
        
    }
}
