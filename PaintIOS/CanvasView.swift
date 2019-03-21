//
//  CanvasView.swift
//  PaintIOS
//
//  Created by Sano Gharzani on 2019-03-21.
//  Copyright © 2019 Sano Gharzani. All rights reserved.
//

import Foundation
import UIKit

class CanvasView : UIView {
    override func draw(_ rect: CGRect) {
        if let context =  UIGraphicsGetCurrentContext(){
            context.setStrokeColor(UIColor.magenta.cgColor)
            context.setLineWidth(10)
            context.beginPath()
            context.move(to:  CGPoint(x: 0, y: 0))
            context.addLine(to: CGPoint(x: 175, y: 200))
            context.addLine(to: CGPoint(x: 250, y: 400))
            context.strokePath()
            
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(10)
            context.beginPath()
            context.move(to:  CGPoint(x: 350, y: 0))
            context.addLine(to: CGPoint(x: 175, y: 200))
            context.addLine(to: CGPoint(x: 100, y: 400))
            context.strokePath()
            
            context.setStrokeColor(UIColor.red.cgColor)
            context.setLineWidth(10)
            context.beginPath()
            context.move(to:  CGPoint(x: 175, y: 0))
            context.addLine(to: CGPoint(x: 175, y: 200))
            context.addLine(to: CGPoint(x: 175, y: 400))
            context.strokePath()
            
        }
        
        
    }
}
