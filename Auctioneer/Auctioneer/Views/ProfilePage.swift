//
//  Profile.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/2/22.
//

import Foundation
import SwiftUI


struct ProfileView: View {
    var user:User = User(UserName:"Bob marly", Password: "1234", Avatar: Image("Face1"))
    
    var body: some View{
        HStack{
            Spacer()
            user.Avatar.resizable().frame(width: 125, height: 125, alignment: .center)
            Spacer()
        }
        Form{
            HStack{
                Spacer()
                Text("Welcome \(user.UserName)")
                Spacer()
            }
            HStack{
                Text("Funds Available: ")
                Spacer()
                Text(Image(systemName: "dollarsign.circle")) + Text("\(user.Money)")
            }
            NavigationLink(destination: DrawingView(), label: {
                Text("Drawing Page")
            })
        }
        
    }
}
