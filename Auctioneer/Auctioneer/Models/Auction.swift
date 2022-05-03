//
//  Auction.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/27/22.
//

import Foundation
import SwiftUI

class Auction:ObservableObject, Identifiable, Hashable, BeatModifier{
    static func == (lhs: Auction, rhs: Auction) -> Bool {
        lhs.id  == rhs.id
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
    @Published private var model = Model()
    @Published var user:User
    @Published var image:ImageWrap
    @Published var bid:CGFloat
    @Published var id:UUID
    @Published var winner:User
    @Published var emitter = BeatEmitter()
    @Published var over:Bool = false
    @Published var timerLimit:Int = 30
    var number: String {
            "\(model.number)"
        }
    init(user:User, image:Int, bid:CGFloat){
        self.bid = bid
        self.user = user
        self.image = user.ArtWorks[image]
        self.id = UUID()
        self.winner = user
        self.over = false
        emitter.delegate = self
    }
    func beat() {
        if(Int(exactly: model.number)! < timerLimit){
            model.number += 1
        } else {
            over = true
        }
    }
    func updateBid(newBid:CGFloat){
        bid = newBid
    }
    
}
protocol BeatModifier {
    func beat()
}

protocol Beat {
    var number : Int { get set }
}

struct Model: Beat {
    var number: Int = 0
}

class BeatEmitter {
    
    private var timer: Timer!
    var delegate: BeatModifier?
    
    init() {
        setupTimer()
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(notifyDelegate), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc
    func notifyDelegate() {
        delegate?.beat()
    }
}
