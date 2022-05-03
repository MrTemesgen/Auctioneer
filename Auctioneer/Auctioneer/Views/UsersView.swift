//
//  UsersView.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 5/2/22.
//

import Foundation
import SwiftUI

struct UsersView: View{
    @EnvironmentObject var usersList:UserList
    @State var isNavBarHidden = false
    var body: some View{
        ScrollView{
            HStack{Spacer()
                Text("Users")
                Spacer()}
            VStack(alignment: .leading, spacing: 10){
                ForEach(usersList.users.indices, id:\.self) { index in
                    
                    NavigationLink(destination:  Vouyer(user: usersList.users[index])) {
                        HStack{
                            Spacer()
                            usersList.users[index].Avatar.resizable().frame(width: 60, height: 70, alignment: .center)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle().stroke(Color.green, lineWidth: 3))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            VStack{
                                
                                HStack{
                                    VStack{
                                        Text( String(String(format: "$%.2f", usersList.users[index].Money))).frame(maxWidth: .infinity, alignment: .center).font(Font.caption).foregroundColor(.black)
                                        Text("Funds").font(Font.custom("georgia", size:12)).frame(maxWidth: .infinity, alignment: .center).foregroundColor(Color.gray)
                                        
                                    }
                                    
                                    VStack{
                                        Text("\(usersList.users[index].ArtWorks.count)").font(Font.caption).frame(maxWidth: .infinity, alignment: .center).foregroundColor(Color.black)
                                        Text("Art Score").font(Font.custom("georgia", size:12)).frame(maxWidth: .infinity, alignment: .center).foregroundColor(Color.gray)
                                        
                                    }
                                }
                                Text(usersList.users[index].UserName).foregroundColor(Color.accentColor).font(Font.custom("georgia", size: 20))
                            }
                            Spacer()
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
