//
//  UserList.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/19/22.
//

import Foundation


class UserList:ObservableObject{
    @Published private var users:[User]
    
    init (){
        users = []
    }
}
