//
//  MoveLogic.swift
//  VeryBerry
//
//  Created by Verze on 2015/06/07.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit

class MoveLogic {
    class func GoStraight(obj:ImageObject) {
        var dx = (Double)(obj.center.x)-1.0;
        var dy = (Double)(obj.center.y);
        obj.center = CGPoint(x:dx, y:dy)
    }
    class func GoUp(obj:ImageObject) {
        var dx = (Double)(obj.center.x)+2.5
        var dy = (Double)(obj.center.y)-1.0
        obj.center = CGPoint(x:dx, y:dy)
    }
    class func GoDown(obj:ImageObject) {
        var dx = (Double)(obj.center.x)+2.5
        var dy = (Double)(obj.center.y)+1.0
        obj.center = CGPoint(x:dx, y:dy)
    }
    class func GoLeft(obj:ImageObject) {
        var dx = (Double)(obj.center.x)+0.5;
        var dy = (Double)(obj.center.y);
        obj.center = CGPoint(x:dx, y:dy)
    }
    class func GoRight(obj:ImageObject) {
        var dx = (Double)(obj.center.x)+4.5;
        var dy = (Double)(obj.center.y);
        obj.center = CGPoint(x:dx, y:dy)
    }
}