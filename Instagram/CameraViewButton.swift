//
//  CameraViewButton.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/20/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit


class CameraViewButton: UIButton {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        self.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        //self.setTitleColor(UIColor.blackColor(), forState: .Selected)
        self.showsTouchWhenHighlighted = false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        selected = !selected
    }
    

}
