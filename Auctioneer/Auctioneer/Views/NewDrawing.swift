//
//  NewDrawing.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 5/1/22.
//

import Foundation
import SwiftUI

struct NewDrawingView: View{
    @State var user:User
    @FocusState var nameFieldIsFocused:Bool
    @State var name:String
    
    var body: some View{
        Form{
        
            
        VStack{
            HStack{Spacer()
                Image(systemName: "exclamationmark.bubble").font(.system(size: 30)).foregroundColor(.accentColor)
                Spacer()}
            Spacer()
            Text("Set Your Creation's Name").font(Font.headline)
        TextField(
            "Name",
            text: $name
        ) .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .focused($nameFieldIsFocused)
            .onSubmit {
                user.ArtWorks[user.ArtWorks.count-1].name = name
            }
            if(user.ArtWorks.count > 0){
                user.ArtWorks[user.ArtWorks.count-1].image.resizable().frame(width: 200, height: 275, alignment: .center).overlay(RoundedRectangle(cornerRadius:2).stroke(.black, lineWidth: 1))
            }
        }
            HStack{Spacer()
                NavigationLink(destination: ProfileView(user: user)) {
                    Text("Done")
                }
                Spacer()}
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}
