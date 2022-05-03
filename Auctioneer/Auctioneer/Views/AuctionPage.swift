//
//  AuctionPage.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/6/22.
//

import Foundation
import SwiftUI

struct AuctionView: View{
    @Binding var auction:Auction
    @State var idx:Int
    @Binding var bid:CGFloat
    @State var user:User
    @State var message = ""
    @State var time:Int
    @State var newDate = Date()
    @State var status = "ACTIVE"
    @State var statusColor = Color.green
    let timeLimit = 30
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    var body : some View {
        Form{
            HStack{
            Spacer()
                auction.image.image.resizable().frame(width: 150, height: 225, alignment: .center).overlay(RoundedRectangle(cornerRadius:2).stroke(.black, lineWidth: 1))
                
            Spacer()
                VStack{
                   
                    Text(status).foregroundColor(statusColor).padding()
                        Text(auction.image.name).font(Font.subheadline)
                        Text("By:\(auction.image.org_author)").font(Font.caption).foregroundColor(.gray)
                        Text(auction.image.date).font(Font.caption).foregroundColor(.gray)
                   
                    VStack{
                    Text("\(Int((timeLimit - time)/60))m:\((timeLimit - time)%60)s").onReceive(timer) { timer in
                        
                        if(time >= timeLimit){
                            
                            if(auction.user.id != auction.winner.id){
                               
                                auction.winner.ArtWorks.append(auction.image)
                                
                                if let index = auction.user.ArtWorks.firstIndex(where: {$0.id == auction.image.id}) {
                                    auction.user.ArtWorks.remove(at: index)
                                } else {
                                   // Something has gone wrong
                                    print("The image somehow no longer exists")
                                }
                                print("Exchanging cash")
                                auction.winner.Money -= auction.bid
                                auction.user.Money += auction.bid
                            }
                            print("NOT exchanging cash")
                            auction.image.onAuction = false
                            
                            status = "Owner: \(auction.winner.UserName)"
                            statusColor = Color.blue
                            auction.over = true
                            self.timer.upstream.connect().cancel()
                        } else{
                            time = time + 1
                        }
                    }
                    Text("Time left").font(Font.caption).foregroundColor(.gray)
                    }.padding()
                        Text(String(format: "Bid @ $%.2f", bid )).font(Font.subheadline).foregroundColor(.green).padding()
                    HStack{Spacer()
                        auction.winner.Avatar.resizable().frame(width: 50, height: 60, alignment: .center)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle().stroke(Color.green, lineWidth: 3))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        VStack{
                            
                            Text("\(auction.winner.UserName)").font(Font.headline)
                            Text("Lead").font(Font.caption).frame(maxWidth: .infinity, alignment: .center).foregroundColor(Color.gray)
                        }
                        Spacer()
                        
                    }
                
                }
            }
            
          
                HStack{
                    Spacer()
                    Text("Make A Bid").font(Font.subheadline).bold().padding()
                    Spacer()
                }
                
                    Button{
                        let newBid = auction.bid + auction.bid*(0.05)
                        auction.updateBid(newBid:  newBid)
                        bid = newBid
                        auction.winner = user
                        print("New Highest bid")
                        
                    }label: {
                        Text("Bid 5%").foregroundColor(.accentColor)
                    }.disabled(user.Money <= auction.bid + auction.bid*(0.05) || time >= timeLimit)
                    
                    Button{
                        let newBid = auction.bid + auction.bid*(0.10)
                        auction.updateBid(newBid:  newBid)
                        bid = newBid
                        auction.winner = user
                        print("New Highest bid")
                        
                    }label: {
                        Text("Bid 10%").foregroundColor(.accentColor)
                    }.disabled(user.Money <= auction.bid + auction.bid*(0.10) || time >= timeLimit)
                   
                    Button{
                        let newBid = auction.bid + auction.bid*(0.15)
                        auction.updateBid(newBid:  newBid)
                        bid = newBid
                        auction.winner = user
                        print("New Highest bid")
                        
                    }label: {
                        Text("Bid 15%").foregroundColor(.accentColor)
                    }.disabled(user.Money <= auction.bid + auction.bid*(0.15) || time >= timeLimit)
                    
                
            
            NavigationLink(destination: ProfileView(user: user)) {
                Text("Done")
            }   
           
        }
        
        
    }
    
}
