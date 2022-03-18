//
//  Signup.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/14/22.
//

import Foundation
import SwiftUI

struct SignupView: View {
    @State var username:String = ""
    @FocusState var nameFieldIsFocused:Bool
    @State var password:String = ""
    @FocusState var passwordFieldIsFocused:Bool
    
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
            ).textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($nameFieldIsFocused)
            
            
            TextField(
                "Password",
                text: $password
            )
                .focused($passwordFieldIsFocused)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                    Spacer()
                    Text("Create Your Avatar")
                    Spacer()
            }
            
            AvatarView()
        }
        
    }
}

