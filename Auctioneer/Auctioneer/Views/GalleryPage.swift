//
//  GalleryPage.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/27/22.
//

import Foundation
import SwiftUI

struct GalleryView: View{
    @State var user:User
    @EnvironmentObject var auctionList:AuctionList
    var body: some View{
      
            List(user.ArtWorks.enumerated().map({ $0 }), id:\.element.id) { idx, image in
                NavigationLink(destination:  AuctionItemView(user:user, idx:idx, image: image.image, startbid: 5).environmentObject(user).environmentObject(auctionList)) {
                    HStack{
                        image.image.resizable().frame(width: 100, height: 175, alignment: .center).overlay(RoundedRectangle(cornerRadius:2).stroke(.black, lineWidth: 1))
                    Spacer()
                        VStack{
                        
                        Text(image.name).font(Font.subheadline)
                            Text("By:\(image.org_author)").font(Font.caption).foregroundColor(.gray)
                        Text(image.date).font(Font.caption).foregroundColor(.gray)
                     
                    }
                        Spacer()
                    }
                }
            }.navigationBarTitle(Text("Gallery"), displayMode: .inline)
            
        }
    
}
