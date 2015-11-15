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

    class func GoDown(obj:ImageObject) {
        let dx = (Double)(obj.center.x)+2.5
        let dy = (Double)(obj.center.y)+1.2
        obj.center = CGPoint(x:dx, y:dy)
    }
    class func GoLeft(obj:ImageObject) {
        let dx = (Double)(obj.center.x)+0.5;
        let dy = (Double)(obj.center.y);
        obj.center = CGPoint(x:dx, y:dy)
    }
    class func GoRight(obj:ImageObject) {
        let dx = (Double)(obj.center.x)+4.5;
        let dy = (Double)(obj.center.y);
        obj.center = CGPoint(x:dx, y:dy)
    }
    class func Stay(obj:ImageObject) {
        let dx = (Double)(obj.center.x)+2.5;
        let dy = (Double)(obj.center.y);
        obj.center = CGPoint(x:dx, y:dy)
    }
    
    class func BlackBirdMove(obj:ImageObject, progress:Int, base:CGFloat) {
        var dy:Double = 0
        var dx:Double = 0
        var border:[Int] = []
        border.append(0 + 100) // 100
        border.append(border[0] + 80) // 180
        border.append(border[1] + 150) // 330
        border.append(border[2] + 50) // 380
        border.append(border[3] + 50) // 430
        border.append(border[4] + 200) // 630
        border.append(border[5] + 80) // 710
        border.append(border[6] + 100) // 810
        border.append(border[7] + 100) // 910
        border.append(border[8] + 100) // 1010
        border.append(border[9] + 120) // 1130
        border.append(border[10] + 70) // 1200
        border.append(border[11] + 200) // 1400
        border.append(border[12] + 600) // 2000
        border.append(border[13] + 110) // 2120
        border.append(border[14] + 100) // 2210
        border.append(border[15] + 100) // 2310
        border.append(border[16] + 100) // 2410
        border.append(border[17] + 100) // 2510
        border.append(border[18] + 100) // 2610
        border.append(border[19] + 80) // 2700
        border.append(border[20] + 80) // 2770
        border.append(border[21] + 80) // 2860
        border.append(border[22] + 80) // 2930
        border.append(border[23] + 60) // 2990
        border.append(border[24] + 60) // 3050
        border.append(border[25] + 60) // 3110
        border.append(border[26] + 60) // 3170
        border.append(border[27] + 60) // 3230
        border.append(border[28] + 60) // 3290
        border.append(border[29] + 60) // 3350
        border.append(border[30] + 60) // 3410
        border.append(border[31] + 25) // 3435
        border.append(border[32] + 70) // 3505
        border.append(border[33] + 25) // 3530
        border.append(border[34] + 70) // 3600
        border.append(border[35] + 100) // 3700
        border.append(border[36] + 20) // 3720
        border.append(border[37] + 1) // 3721
        
        if (obj.progress <= border[0])
        {
            dx = (Double)(obj.center.x)+ScaleLogic.BossMove_X(progress, border: border, number: 0, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[1])
        {
            dx = (Double)(obj.center.x)+2.5
            dy = (Double)(obj.center.y)+1.2
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[2])
        {
            dx = (Double)(obj.center.x)+2.5;
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[3])
        {
            dx = (Double)(obj.center.x)+2.5
            dy = (Double)(obj.center.y)-1.2
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[4])
        {
            if (obj.attr == Database.NAME_BOSS_FIRE) { obj.hidden = !obj.hidden; }
            dx = (Double)(obj.center.x)+2.5
            dy = (Double)(obj.center.y)-1.2
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[5])
        {
            if (obj.attr == Database.NAME_BOSS_FIRE && obj.hidden) { obj.hidden = false; }
            dx = ScaleLogic.BossMove_X(progress, border:border, number: 4, base: base)
            dx += (Double)(obj.center.x)
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[6])
        {
            if (obj.attr == Database.NAME_BOSS_FIRE && obj.hidden == false) { obj.hidden = true; }
            dx = (Double)(obj.center.x)+2.5
            dy = (Double)(obj.center.y)+1.2
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[7]) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 6, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 6, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[8]) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 7, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 7, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[9]) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 8, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 8, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[10]) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 9, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 9, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[11]) {
            dx = ScaleLogic.BossMove_X(progress, border: border, number: 10, base: base)
            dx += (Double)(obj.center.x)
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        }
        else if (obj.progress <= border[12]) {
            dx = ScaleLogic.BossMove_X(progress, border: border, number: 11, base: base)
            dy = ScaleLogic.BossMove_Y(progress, border: border, number: 11, base: base)
            obj.center = CGPoint(x:dx, y:dy);
        }
        else if (obj.progress <= border[13]) {
            if (obj.progress == border[12]+1) {
                var imageData:[UIImage] = []
                if (obj.attr == Database.NAME_BOSS_FIRE) {
                    imageData.append(UIImage(named: "LASBOSS-04-rev.png")!)
                    obj.center = CGPointMake(obj.center.x+80, obj.center.y);
                    obj.hidden = false;
                } else {
                    imageData.append(UIImage(named: "LASBOSS-03-rev.png")!)
                    imageData.append(UIImage(named: "LASBOSS-05-rev.png")!)
                    obj.center = CGPointMake(obj.center.x-90, obj.center.y)
                }
                obj.ChangeAnimation(imageData);
            }
            dx = ScaleLogic.BossMove_X(progress, border: border, number: 12, base: base)
            dx += (Double)(obj.center.x)
            dy = ScaleLogic.BossMove_Y(progress, border: border, number: 12, base: base);
            if (obj.attr == Database.NAME_BOSS_FIRE) {
                dy = ScaleLogic.FireMove_Y(progress, border: border, number: 12, base: base)
                if (obj.progress <= 1500) {
                    obj.hidden = !obj.hidden;
                }
            }
            obj.center = CGPoint(x:dx, y:dy);
        } else if (obj.progress <= border[14]) {
            dx = ScaleLogic.BossMove_X(progress, border: border, number: 13, base: base)
            dx += (Double)(obj.center.x)
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[15]) {
            if (obj.attr == Database.NAME_BOSS_FIRE && obj.hidden == false) { obj.hidden = true; }
            if (obj.progress == border[14]+1) {
                var imageData:[UIImage] = []
                if (obj.attr == Database.NAME_BOSS_FIRE) {
                    imageData.append(UIImage(named: "LASBOSS-04.png")!)
                    obj.center = CGPointMake(obj.center.x-240, obj.center.y)
                } else {
                    imageData.append(UIImage(named: "LASBOSS-03.png")!)
                    imageData.append(UIImage(named: "LASBOSS-05.png")!)
                    obj.center = CGPointMake(obj.center.x+90, obj.center.y)
                }
                obj.ChangeAnimation(imageData);
            }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 14, base: base)
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[16] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 15, base: base)
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 15, base: base)
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[17] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 16, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[18] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 17, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 17, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[19] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 18, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[20] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 19, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 19, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[21] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 20, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[22] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 21, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 21, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[23] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 22, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[24] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 23, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 23, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[25] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 24, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[26] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 25, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 25, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[27] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 26, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[28] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE) { obj.hidden = !obj.hidden; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 27, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 27, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[29] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE && obj.hidden) { obj.hidden = false; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 28, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[30] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE) { obj.hidden = !obj.hidden; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 29, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 29, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[31] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE && obj.hidden) { obj.hidden = false; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 30, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[32] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE) { obj.hidden = !obj.hidden; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 31, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 31, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[33] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE && obj.hidden) { obj.hidden = false; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 32, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 32, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[34] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE) { obj.hidden = !obj.hidden; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 33, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 33, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[35] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE && obj.hidden) { obj.hidden = false; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 34, base: base);
            dy = (Double)(obj.center.y) + ScaleLogic.BossMove_Y(progress, border: border, number: 34, base: base);
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[36] ) {
            if (obj.attr == Database.NAME_BOSS_FIRE && obj.hidden == false) { obj.hidden = true; }
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 35, base: base);
            dy = (Double)(obj.center.y) + 1.0;
            obj.center = CGPoint(x:dx, y:dy)
        } else if (obj.progress <= border[37] ) {
            dx = (Double)(obj.center.x) + ScaleLogic.BossMove_X(progress, border: border, number: 36, base: base);
            dy = (Double)(obj.center.y);
            obj.center = CGPoint(x:dx, y:dy)
        } else {
            obj.MoveToDefault()
        }
        
        obj.center = CGPoint(x:dx, y:dy)
    }
}