

import UIKit
import PlaygroundSupport


class HoundstoothView: UIView {

    
    func drawTile() {
        
        
        self.layer.backgroundColor = UIColor.black.cgColor
        
        
        // Path Drawing
        let topLeft = CGPoint.zero
        let topRight = CGPoint(x: self.bounds.maxX, y: self.bounds.minY)
        let bottomRight = CGPoint(x: self.bounds.maxX, y: self.bounds.maxY)
        let bottomLeft = CGPoint(x: 0.0, y: self.bounds.maxY)
        
        let path = UIBezierPath()
        
        func drawArrowBottomLeft() {
            path.move(to: topLeft)
            path.addLine(to: bottomRight)
            path.addLine(to: bottomLeft)
            path.close()
        }
        
        func drawArrowTopRight() {
            path.move(to: topLeft)
            path.addLine(to: topRight)
            path.addLine(to: bottomRight)
            path.close()
        }
        
        func drawWhiteRect() {
            path.move(to: topLeft)
            path.addLine(to: topRight)
            path.addLine(to: bottomRight)
            path.addLine(to: bottomLeft)
            path.close
        }
        
        func drawBlackRect() {
            path.move(to: topLeft)
            path.close
        }
        
        
        // Randomizing
        let randomInt = Int.random(in: 1...4)
        
        if randomInt == 1 {
            drawArrowBottomLeft()
        }
        
        if randomInt == 2 {
            drawArrowTopRight()
        }
        
        if randomInt == 3 {
            drawWhiteRect()
        }
        
        if randomInt == 4 {
            drawBlackRect()
        }
        
        
        // Create a shape layer
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 4.0
        shapeLayer.fillColor = UIColor.white.cgColor
        
        self.layer.addSublayer(shapeLayer)

        
    }
    
}


// Create a pattern

let tileViewSize = CGSize(width: 24.0, height: 24.0)

let columns = 8
let rows = 12

let patternSize = CGSize(width: tileViewSize.width * CGFloat(columns),
                        height: tileViewSize.height * CGFloat(rows))

let patternView = UIView(frame: CGRect(origin: .zero, size: patternSize))

for column in 0..<columns {
    for row in 0..<rows {
    
        let tileViewOrigin = CGPoint(x: CGFloat(column) * tileViewSize.width,
                                    y: CGFloat(row) * tileViewSize.height)
        let tileViewRect = CGRect(origin: tileViewOrigin, size: tileViewSize)
        let tileView = HoundstoothView(frame: tileViewRect)
        tileView.drawTile()
        patternView.addSubview(tileView)
    
    }
}


// Finalize
PlaygroundPage.current.liveView = patternView
