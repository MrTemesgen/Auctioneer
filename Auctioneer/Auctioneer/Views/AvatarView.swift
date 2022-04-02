//
//  AvatarView.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 3/15/22.
//

import Foundation
import SwiftUI



extension UIImage {
  func mergeWith(topImage: UIImage, x:CGFloat , y:CGFloat , width:CGFloat , height:CGFloat ) -> UIImage {
    let bottomImage = self

    UIGraphicsBeginImageContext(size)


    let areaSizeBot = CGRect(x: 0, y: 0, width: bottomImage.size.width, height: bottomImage.size.height)
    bottomImage.draw(in: areaSizeBot)
    
    let areaSizeTop = CGRect(x:x, y:y, width:width, height:height )
    topImage.draw(in: areaSizeTop, blendMode: .normal, alpha: 1.0)

    let mergedImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return mergedImage
  }
}

struct AvatarView: View{
    var body: some View{
        HStack{
            Spacer()
            Image(uiImage: addNose(addMouth(addBrows(addEyes(UIImage(imageLiteralResourceName: "Face1"), "Eyes2"), "Brows1"), "Mouth1"), "Nose1"))
            .resizable().frame(width: 125, height: 125, alignment: .center)
            Spacer()
        }
    }
}

func addEyes(_ face:UIImage, _ eyes:String) -> UIImage{
    return face.mergeWith(topImage: UIImage(imageLiteralResourceName: eyes), x: 65, y: 75, width: 95, height: 35)
}


func addBrows(_ face:UIImage,  _ brows:String) -> UIImage{
    return face.mergeWith(topImage: UIImage(imageLiteralResourceName: brows), x: 60, y: 65, width: 100, height: 25)
}


func addMouth(_ face:UIImage, _ mouth:String) -> UIImage{
    return face.mergeWith(topImage: UIImage(imageLiteralResourceName: mouth), x: 75, y: 150, width: 70, height: 25)
}


func addNose(_ face:UIImage, _ nose:String) -> UIImage{
    return face.mergeWith(topImage: UIImage(imageLiteralResourceName: nose), x: 85, y: 120, width: 50, height: 25)
}
