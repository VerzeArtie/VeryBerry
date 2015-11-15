//
//  CustomScrollView.swift
//  VeryBerry
//
//  Created by Verze on 2015/09/13.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit

class CustomScrollView : UIScrollView {
    var parent: ViewController! = nil

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let tapPosition:UITouch = touches.first!
        let tapPoint = tapPosition.locationInView(self)
        
        for (var ii = 0; ii < self.subviews.count; ii++) {
            if (self.subviews[ii] is UILabel) {
                let target:CGRect = (self.subviews[ii] as! UILabel).frame;
                let targetLabel:UILabel = self.subviews[ii] as! UILabel;
                if ( target.origin.x <= tapPoint.x && tapPoint.x <= target.origin.x + target.size.width &&
                    target.origin.y <= tapPoint.y && tapPoint.y <= target.origin.y + target.size.height) {
                        if (targetLabel.tag == 10000) {
                            self.parent.tapCreditSelect(targetLabel);
                        } else if (targetLabel.tag == 10001) {
                            self.parent.tapTutorialSelect(targetLabel);
                        } else if (targetLabel.tag == 10002) {
                            self.parent.tapScoreSelect(targetLabel);
                        } else if (targetLabel.tag == 10003) {
                            self.parent.tapAboutSelect(targetLabel);
                        } else {
                            self.parent.tapStageSelect(targetLabel);
                        }
                        self.parent.currentScrollOffset = self.contentOffset;
                        return;
                }
            }
        }
    }
}