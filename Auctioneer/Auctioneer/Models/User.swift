//
//  User.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/14/22.
//

import Foundation
import SwiftUI


class User: ObservableObject{
    var UserName:String = ""
    var Password:String = ""
    var Avatar:Image
    var ArtWorks:[Image]
    
    init(UserName:String, Password:String, Avatar:Image){
        self.UserName = UserName
        self.Password = Password
        ArtWorks = []
        self.Avatar = Avatar
    }
    
    func addImage(work:Image){
        ArtWorks.append(work);
    }
}
