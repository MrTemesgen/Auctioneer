//
//  Profile.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/2/22.
//

import Foundation
import SwiftUI




struct ProfileView: View {
    @State var user:User
    @EnvironmentObject var auctionList:AuctionList
    @EnvironmentObject var userList:UserList
    var body: some View{
        TabView{
            
            ProfileViewMain(user: user).environmentObject(auctionList).environmentObject(userList).tabItem{Label("Home", systemImage: "person.circle")}
            DrawingView(user:user).tabItem{Label("Draw", systemImage: "paintbrush")}
            AuctionGallery(user: user).environmentObject(auctionList).tabItem{Label("Auctions", systemImage: "dollarsign.square")}
            UsersView().environmentObject(userList).tabItem{Label("Users", systemImage: "person.2")}
        }
        
    }
}

struct ProfileViewMain: View{
    @State var user:User
    @EnvironmentObject var auctionList:AuctionList
    @EnvironmentObject var userList:UserList
    @State private var showingAuction = false
    var fontSize:CGFloat = 15.0
    var body: some View{
        
        Form{
            VStack{
                HStack{
                    VStack{
                        user.Avatar.resizable().frame(width: 90, height: 100, alignment: .center)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle().stroke(Color.green, lineWidth: 3))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text("\(user.About)")
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.gray)
                            .font(Font.custom("georgia", size:fontSize-2))
                        
                    }
                    VStack{
                                                HStack{
                            VStack{
                                Text( String(String(format: "$%.2f", user.Money))).frame(maxWidth: .infinity, alignment: .center).font(Font.caption).foregroundColor(.black)
                                Text("Funds").font(Font.custom("georgia", size:fontSize-1)).frame(maxWidth: .infinity, alignment: .center).foregroundColor(Color.gray)
                                
                            }
                            
                            VStack{
                                Text("\(user.ArtWorks.count)").font(Font.caption).frame(maxWidth: .infinity, alignment: .center).foregroundColor(Color.black)
                                Text("Art Score").font(Font.custom("georgia", size:fontSize-1)).frame(maxWidth: .infinity, alignment: .center).foregroundColor(Color.gray)
                                
                            }
                        }
                        HStack{
                            Spacer()
                            Text(user.UserName).foregroundColor(Color.accentColor).font(Font.title)
                            Spacer()
                        }.padding(5)

                    }
                }
                
                
                
            }.padding()
            NavigationLink(destination: GalleryView(user:user).environmentObject(auctionList).environmentObject(userList), label: {
                Text("Auction Your art").font(Font.subheadline).foregroundColor(Color.accentColor)
            })
            HStack{
                Spacer()
                Text("\(user.UserName)'s Montage").font(Font.headline)
                Spacer()
            }
            ForEach(0...Int(user.ArtWorks.count/3), id:\.self) {
                i in
                HStack{
                    
                    ForEach(0...2, id:\.self){
                        j in
                        VStack{
                            
                            if(i*3+j < user.ArtWorks.count){
                                
                                user.ArtWorks[i*3+j].image.resizable().frame(width: 100, height: 175, alignment: .center).overlay(RoundedRectangle(cornerRadius:2).stroke(.black, lineWidth: 1))
                            }
                        }
                    }
                }
            }
            
            HStack{Spacer()
                NavigationLink(destination: HomePageView().environmentObject(user).environmentObject(auctionList).environmentObject(userList)){
                    Text("Sign Out")
                }
                Spacer()}
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
    }
}


