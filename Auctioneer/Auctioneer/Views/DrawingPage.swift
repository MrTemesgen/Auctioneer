//
//  DrawingPage.swift
//  Auctioneer
//
//  Created by Abreham Temesgen on 4/1/22.
//

import Foundation
import SwiftUI

class Cords: ObservableObject {
  @Published var cord:[CGPoint] = [CGPoint](repeating: CGPoint.zero, count: 128)
  @Published var size:[CGSize] = [CGSize](repeating: CGSize.zero, count: 128)
  @Published var selected:[Bool] = [Bool](repeating: false, count: 128)
  static var shared = Cords()
}


struct LeCanvas: View {
  @ObservedObject var cords = Cords.shared
  @Binding var indx:Int
  var body: some View {
    Canvas(opaque: false, colorMode: .nonLinear, rendersAsynchronously: true, renderer: { context, size in
      for i in 0..<cords.cord.count {
        context.drawLayer { layerContext in
          layerContext.withCGContext { cgContext in
            if cords.cord[i] != CGPoint.zero {
              cgContext.move(to: cords.cord[i])
              let rect = CGRect(origin: cords.cord[i], size: cords.size[i])
              let path = CGPath(rect: rect, transform: nil)
//              let path = CGPath(ellipseIn: rect, transform: nil)
              cgContext.addPath(path)
              cgContext.setStrokeColor(cords.selected[i] ? UIColor.red.cgColor: UIColor.blue.cgColor)
              cgContext.setFillColor(UIColor.clear.cgColor)
              cgContext.setLineWidth(2)
              cgContext.drawPath(using: .eoFillStroke)
            }
          }
        }
      }
    })
  }
}



struct DrawingView: View {
  @GestureState var foo = CGPoint.zero
  @ObservedObject var cords = Cords.shared
  @State var indx = 0
  @State var selected = false
  @State var newShape = true
  @State var selectedIndx = 0
  var body: some View {
    LeCanvas(indx: $indx)
      .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .updating($foo) { value, state, transaction in
        if newShape {
          let nudge = CGSize(width: CGFloat(cords.size[indx].width), height: CGFloat(cords.size[indx].height))
          let newPoint = CGPoint(x: value.location.x - (nudge.width/2), y: value.location.y - (nudge.height/2))
          cords.cord[indx] = newPoint
          if value.translation.width > 4 || value.translation.height > 4 {
            cords.size[indx] = CGSize(width: value.translation.width, height: value.translation.height)
          }
        }
        if selected {
          let shape = CGRect(origin: cords.cord[selectedIndx], size: cords.size[selectedIndx])
          if shape.contains(value.location) {
            let nudge = CGSize(width: CGFloat(cords.size[selectedIndx].width), height: CGFloat(cords.size[selectedIndx].height))
            let newPoint = CGPoint(x: value.location.x - (nudge.width/2), y: value.location.y - (nudge.height/2))
            cords.cord[selectedIndx] = newPoint
          }
        }
      }.onEnded({ value in
        newShape = false
        selected = true
        if value.translation.width < 4 && value.translation.height < 4 {
          if searchin(value: value, cords: cords) {
            DispatchQueue.main.async {
              selected = true
              newShape = false
            }
          } else {
            DispatchQueue.main.async {
              deselect(cords: cords)
              selected = false
              newShape = true
              indx += 1
            }
          }
        }
      }))
    
    HStack {
      Text("Selected \(selected.description) \(indx)")
      Text("New Shape \(newShape.description)")
        .onTapGesture {
          DispatchQueue.main.async {
            indx += 1
          }
        }
    }
  }}



func deselect(cords:Cords) {
    for i in 0..<cords.cord.count {
      if cords.cord[i] != CGPoint.zero {
        DispatchQueue.main.async {
          cords.selected[i] = false
        }
      }
    }
  }
  
func searchin(value: GestureStateGesture<DragGesture, CGPoint>.Value, cords:Cords) -> Bool {
  for searchin in 0..<cords.cord.count {
    let shape = CGRect(origin: cords.cord[searchin], size: cords.size[searchin])
    if shape.contains(value.location) {
      cords.selected[searchin] = true
      return true
    }
  }
  return false
}
