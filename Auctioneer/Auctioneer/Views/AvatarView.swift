//
//  AvatarView.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/15/22.
//

import Foundation
import SwiftUI



extension UIImage {
    func mergeWith(topImage: UIImage, x:CGFloat , y:CGFloat) -> UIImage {
        let bottomImage = self
        
        UIGraphicsBeginImageContext(size)
        
        
        let areaSizeBot = CGRect(x: 0, y: 0, width: bottomImage.size.width, height: bottomImage.size.height)
        bottomImage.draw(in: areaSizeBot)
        
        let areaSizeTop = CGRect(x:0, y:0, width:bottomImage.size.width, height:bottomImage.size.height )
        topImage.draw(in: areaSizeTop, blendMode: .normal, alpha: 1.0)
        
        let mergedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return mergedImage
    }
}

struct AvatarView: View{
    @EnvironmentObject var auctionList:AuctionList
    @EnvironmentObject var userList:UserList
    
    
    @State var user:User
    @State var username:String
    @State var password:String
    @State var about:String
    @State var face = "F1"
    @State var wallpaper = "1"
    @State var isTapped = false
    
    var FemaleFaces:[String] = getFemaleFaces()
    var MaleFaces: [String] = getMaleFaces()
    var Wallpapers: [String] = getWallpapers()
    
    
    var body: some View{
        HStack{
            Spacer()
            Image(uiImage: addWallpaper(face, UIImage(imageLiteralResourceName: wallpaper)))
                .resizable().frame(width: 65, height: 75, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 5)
                .overlay(Circle().stroke(Color.red, lineWidth: 1))
            Spacer()
        }
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack{
                
                ForEach(FemaleFaces, id:\.self){
                    img in
                    Button(action: {
                        face = img
                        user.Avatar = Image(uiImage: addWallpaper(face, UIImage(imageLiteralResourceName: wallpaper)))
                    }, label: {
                        Image(img).resizable().frame(width: 40, height: 50)
                    })
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack{
                
                ForEach(MaleFaces, id:\.self){
                    img in
                    Button(action: {
                        face = img
                        user.Avatar = Image(uiImage: addWallpaper(face, UIImage(imageLiteralResourceName: wallpaper)))
                    }, label: {
                        Image(img).resizable().frame(width: 50, height: 50)
                    })
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
        
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack{
                
                ForEach(Wallpapers, id:\.self){
                    img in
                    Button(action: {
                        wallpaper = img
                        user.Avatar = Image(uiImage: addWallpaper(face, UIImage(imageLiteralResourceName: wallpaper)))
                    }, label: {
                        Image(img).resizable().frame(width: 50, height: 50)
                    })
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
        
        HStack{
            Spacer()
            if(userList.users.count > 0){
                NavigationLink(destination: ProfileView(user:userList.users[userList.users.count-1])
                                .environmentObject(auctionList)
                                .environmentObject(userList),
                               isActive: Binding<Bool>(get: { isTapped },
                                                       set: { isTapped = $0;
                    user.Avatar = Image(uiImage: addWallpaper(face, UIImage(imageLiteralResourceName: wallpaper)))
                }),label: {
                    Text("Go to Profile")
                }).disabled(user.UserName.isEmpty || user.Password.isEmpty || user.About.isEmpty)}
            Spacer()
        }
    }
}


func getFemaleFaces() -> [String]{
    var FemaleFaces = [String]()
    for i in 0...8 {
        FemaleFaces.append("F\(i+1)")
    }
    return FemaleFaces
}


func getMaleFaces() -> [String]{
    var MaleFaces = [String]()
    for i in 0...6 {
        MaleFaces.append("M\(i+1)")
    }
    return MaleFaces
}

func getWallpapers() -> [String]{
    var WallPapers = [String]()
    for i in 0...5 {
        WallPapers.append("\(i+1)")
    }
    return WallPapers
    
}

func addWallpaper(_ face:String, _ wallpaper:UIImage) -> UIImage{
    return wallpaper.mergeWith(topImage: UIImage(imageLiteralResourceName: face), x: wallpaper.size.width/4, y: wallpaper.size.height/4)
}


