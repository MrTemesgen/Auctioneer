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
    @State var face = "F1"
    @State var wallpaper = "1"
    
    var FemaleFaces:[String] = getFemaleFaces()
    var MaleFaces: [String] = getMaleFaces()
    var Wallpapers: [String] = getWallpapers()
    
    var body: some View{
        HStack{
            Spacer()
            Image(uiImage: addWallpaper(face, UIImage(imageLiteralResourceName: wallpaper)))
                .resizable().frame(width: 90, height: 100, alignment: .center)
            Spacer()
        }
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack{
                
                ForEach(FemaleFaces, id:\.self){
                    img in
                    Button(action: {
                        face = img
                        print("\(img) selected")
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
                        print("\(img) selected")
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
                        print("\(img) selected")
                    }, label: {
                        Image(img).resizable().frame(width: 50, height: 50)
                    })
                }
            }.buttonStyle(BorderlessButtonStyle())
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
    for i in 0...3 {
        WallPapers.append("\(i+1)")
    }
    return WallPapers

}

func addWallpaper(_ face:String, _ wallpaper:UIImage) -> UIImage{
    return wallpaper.mergeWith(topImage: UIImage(imageLiteralResourceName: face), x: wallpaper.size.width/2, y: wallpaper.size.height/2)
}


