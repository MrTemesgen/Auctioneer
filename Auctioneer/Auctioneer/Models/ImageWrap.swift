//
//  ImageWrap.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/26/22.
//

import Foundation
import SwiftUI

class ImageWrap: Hashable{
    
    
    var image:Image
    var name:String
    var date:String
    var org_author:String
    var onAuction:Bool
    let id = UUID()
    
    init(_image:Image, _name:String, _auth:String){
        image = _image
        name = _name
        date = Date().formatted()
        org_author = _auth
        onAuction = false
    }
    
    
    static func == (lhs: ImageWrap, rhs: ImageWrap) -> Bool {
        lhs.name == rhs.name
    }
    
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
    }
}
