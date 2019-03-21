//
//  ViewController.swift
//  PaintIOS
//
//  Created by Sano Gharzani on 2019-03-21.
//  Copyright © 2019 Sano Gharzani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeColor: UIBarButtonItem!
    @IBOutlet weak var canvas: UIImageView!
    var start: CGPoint?
    var paintColor =  UIColor.magenta.cgColor
    var lineWidth: CGFloat = 10
    let deltaLineWidth: CGFloat = 2
    let maxLineWidth: CGFloat = 16
    let minLineWidth: CGFloat = 2
    

    @IBOutlet weak var clear: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            start = touch.location(in: canvas)
            
            //print("began: \(point)")
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let end = touch.location(in: canvas)
            if let start  = self.start{
                drawFromPoint(start: start, toPoint: end)
            }
            start = end
            
            //let end = touch.location(in: view)
            //print("moved: \(point)")
        }
    }
    func drawFromPoint (start: CGPoint, toPoint end: CGPoint){
        UIGraphicsBeginImageContext(canvas.frame.size)
        if let context = UIGraphicsGetCurrentContext(){
            
            //Tar den skapade bilden för att lägga till den nya (ifall det är en gammal bild)
            canvas.image?.draw(in: CGRect(x: 0, y:0,
                                          width: canvas.frame.size.width,
                                          height: canvas.frame.size.height ))
            
         
            //Ritar en ny linje från senaste uppritning till nuvarande position (fingrets position)
        context.setStrokeColor(paintColor)
            context.setLineWidth(lineWidth)
            context.setLineCap(.round)
            
            context.beginPath()
            context.move(to: start)
            context.addLine(to: end)
            context.strokePath()
            
            
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            canvas.image = newImage
        }
    }
   

    @IBAction func Clear(_ sender: UIBarButtonItem) {
        canvas.image = nil
       
    }
    
    @IBAction func changeColor(_ sender: UIBarButtonItem) {
        
        paintColor = (sender.tintColor?.cgColor)!
        
    }
    
    @IBAction func plusLineWidth(_ sender: UIBarButtonItem) {
        if lineWidth <= maxLineWidth - deltaLineWidth{
        lineWidth += deltaLineWidth
        }
    }
    
    @IBAction func minusLineWidth(_ sender: Any) {
        if lineWidth >= minLineWidth + deltaLineWidth{
        lineWidth -= deltaLineWidth
        }
    }
}


