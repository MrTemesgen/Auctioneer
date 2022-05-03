//
//  LoginPage.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 5/1/22.
//

import Foundation
import SwiftUI
import PencilKit

struct LoginView: View{
    @EnvironmentObject var userList:UserList
    @EnvironmentObject var auctionList:AuctionList
    @State var username:String = ""
    @State var idx:Int = -1
    @FocusState var nameFieldIsFocused:Bool
    @State var password:String = ""
    @FocusState var passwordFieldIsFocused:Bool
    
    
    var body: some View{
        Form{
            HStack {
                Spacer()
                Text("Login")
                Spacer()
            }
            
            TextField(
                "User name",
                text: $username
            ).onSubmit {
                print(username)
                
                for i in 0..<userList.users.count{
                    print("Name1: \(userList.users[i].UserName) Name2:\(username)")
                    if (userList.users[i].UserName == username) {
                        idx = i
    
                        break
                    }
                }
                
                
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .focused($nameFieldIsFocused)
            
            
            SecureField(
                "Password",
                text: $password
            ).onSubmit {
                if(idx != -1 && userList.users[idx].Password == password){
                   
                }
                
            }
            .focused($passwordFieldIsFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack{
                Spacer()
                if(idx >= 0){
                    NavigationLink(destination: ProfileView(user:userList.users[idx]).environmentObject(auctionList).environmentObject(userList))
                {
                    Text("Go to Profile \(idx)")
                }.disabled(idx == -1)}
                Spacer()
            }
        }
    }
    
}
