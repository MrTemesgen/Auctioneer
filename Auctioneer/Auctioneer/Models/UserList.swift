//
//  UserList.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/19/22.
//

import Foundation


class UserList:ObservableObject, Identifiable{
    @Published  var users:[User]
    let id = UUID()
    init (){
        users = []
    }
}
