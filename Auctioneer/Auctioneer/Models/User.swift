//
//  User.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/14/22.
//

import Foundation
import SwiftUI


class User: ObservableObject, Identifiable, Hashable{
    @Published var UserName:String = ""
    @Published var Password:String = ""
    @Published var Avatar:Image
    @Published var ArtWorks:[ImageWrap]
    @Published var Money:CGFloat
    @Published var About:String = ""
    var id = UUID()
    init(UserName:String, Password:String, Avatar:Image){
        self.UserName = UserName
        self.Password = Password
        ArtWorks = []
        self.Avatar = Avatar
        self.Money = 100
        self.About = "Hello, welcome to my artist page."
    }
    
    func addImage(work:ImageWrap){
        ArtWorks.append(work);
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(UserName)
    }
    
    func copy(_user:User){
        UserName = _user.UserName
        Password = _user.Password
        Avatar = _user.Avatar
        ArtWorks = _user.ArtWorks
        Money = _user.Money
        About = _user.About
        id = _user.id
    }
    
    func clean(){
        UserName = ""
        Password = ""
        Avatar = Image("F1")
        ArtWorks = []
        Money = 0
        About = "Hello, welcome to my artist page."
        id = UUID()
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.UserName == rhs.UserName
    }
}
