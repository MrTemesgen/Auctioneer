//
//  Signup.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/14/22.
//

import Foundation
import SwiftUI

struct SignupView: View {
    @EnvironmentObject var auctionList:AuctionList
    @EnvironmentObject var userList:UserList
    @State var user:User = User(UserName: "", Password: "", Avatar: Image("F1"))
    @State var username:String = ""
    @FocusState var nameFieldIsFocused:Bool
    @State var password:String = ""
    @FocusState var passwordFieldIsFocused:Bool
    @State var about:String = ""
    @FocusState var aboutFieldIsFocused:Bool
    var body: some View{
        
        Form{
            HStack {
                Spacer()
                Text("Create Your Account")
                Spacer()
            }
            
            TextField(
                "User name",
                text: $username
            ).onSubmit {
                user.UserName = username
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .focused($nameFieldIsFocused)
            
            
            SecureField(
                "Password",
                text: $password
            ).onSubmit {
                user.Password = password
                
            }
            .focused($passwordFieldIsFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            TextField(
                "About You:",
                text: $about
            ).onSubmit {
                user.About = about
                userList.users.append(user)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .focused($aboutFieldIsFocused)
            
            HStack {
                Spacer()
                Text("Create Your Avatar")
                Spacer()
            }
            
            AvatarView(user:user, username: username, password: password, about: about).environmentObject(auctionList).environmentObject(userList)
        }
        
    }
}

