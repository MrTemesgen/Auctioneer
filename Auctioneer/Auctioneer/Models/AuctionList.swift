//
//  Auction.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/27/22.
//

import Foundation

class AuctionList: ObservableObject{
    @Published var Auctions:[Auction]
    
    init(){
        Auctions = []
    }
    
    func add(auction:Auction){
        Auctions.append(auction)
    }
    
    
}
