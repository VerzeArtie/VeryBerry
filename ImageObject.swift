//
//  ImageObject.swift
//  VeryBerry
//
//  Created by Summer on 2015/01/29.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit

class ImageObject: UIImageView
{
    // 以下のプロパティはstoryboardで設定します。（両方trueにはしないこと）
    var isEnemy:Bool = false // 敵(鳥やオオクチなど）
    var isBonus:Bool = false // ボーナス（花や水玉など）
    var isFootHold:Bool = false // 足場（雲や地面など）
    var attr: String = "" // 属性（地面や花や鳥など）
    var movePattern:Int? = 0 // 動作パターン（何もしない、下に降りる、直進するなど）
    var baseX:Double = 0 // 出現位置X
    var baseY:Double = 0 // 出現位置Y
    var progress:Int = 0 // 出現からの進行タイム
    var start:Bool = false // 動作スタート
    var specialMove:Bool = false // eyebirdが上に乗っかられた場合専用フラグ
    var specialMove2:Bool = false // UFOが苺を捉えた場合専用フラグ
    var activeRandom:Double? = 0 // 出現後、動き始め開始ポイントXをランダム（落ちるイチゴ）
    var fixPattern:Double? = 0.0 // 動作パターン（固定パラメタ１）
    var fixPattern2:Double? = 0.0 // 動作パターン（固定パラメタ２）
    var immuneDamage:Int = 0 // ダメージ無効（無敵）
    var nowFreeze:Int = 0 // 凍結状態（動作不可) // add [ENHANCE-A]
    
    func MoveUpdate(num:Int, base:CGFloat) -> Bool {
        if (1 <= self.movePattern)
        {
            if (self.movePattern == 0) // none
            {
                // no action
            }
            else if (self.movePattern == 1) // bigbird1
            {
                if (self.center.y < 290 && self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 1, self.center.y + 1);
                }
            }
            if (self.movePattern == 2) // bigbird2
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    if (self.center.y < 280)
                    {
                        self.center = CGPointMake(self.center.x - 1, self.center.y + 1);
                    }
                    else
                    {
                        self.center = CGPointMake(self.center.x - 1, self.center.y);
                    }
                }
            }
            else if (self.movePattern == 3) // bigbird3
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 1, self.center.y - 1);
                }
            }
            else if (self.movePattern == 4) // bigmouse
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 1, self.center.y);
                }
            }
            else if (self.movePattern == 5) // cloud1
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x + 1.5, self.center.y - 1);
                }
            }
            else if (self.movePattern == 6) // cloud1(speed2)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 1.5, self.center.y);
                }
            }
            else if (self.movePattern == 7) // cloud1(speed3)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 2, self.center.y);
                }
            }
            else if (self.movePattern == 8) // bigbird (ryuusenkei)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dy:Double = self.baseY + 12.0 * log2(Double(self.progress) + 2.0)
                    self.center = CGPoint(x:self.center.x - 1.0, y:CGFloat(dy))
                    self.progress++
                }
            }
            else if (self.movePattern == 9) // small bird (circle)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var r:Double = 30.0
                    var dx:Double = 400.0 + r * cos(M_PI * (90.0 + Double(self.progress)) / 180.0) - Double(self.progress)
                    var dy:Double = self.baseY - r + (r * sin(M_PI * (90.0 + Double(self.progress)) / 180.0))
                    self.center = CGPoint(x:dx, y:dy)
                    self.progress++
                }
            }
            else if (self.movePattern == 10) // small bird (ryuusenkei)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var r:Double = 20.0;
                    var dx:Double = (Double)(self.center.x) - 1.2;
                    var dy:Double = self.baseY - r + (r * sin(M_PI * ((Double)(self.progress)*3.0) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 11) // big mouse (tate yure)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var r:Double = 80.0;
                    var dx:Double = (Double)(self.center.x);
                    var dy:Double = self.baseY - (r * sin(M_PI * ((Double)(self.progress)*3.0) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 12) // big bird (ue ni ryuusenkei)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dy = self.baseY - (Double)(log((Double)(self.progress))) * 5.0;
                    self.center = CGPoint(x:(Double)(self.center.x) - 1.1, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 13) // big bird (ue migi sita hidari)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base) && self.start == false)
                {
                    self.start = true;
                }
                if (self.start)
                {
                    var dx:Double = 0;
                    var dy:Double = 0;
                    if (self.progress <= 150)
                    {
                        dx = (Double)(self.center.x) + 1.30;
                        dy = (Double)(self.center.y) - 1.5;
                    }
                    else if (self.progress <= 250)
                    {
                        dx = (Double)(self.center.x) + 1.20*3;
                        dy = (Double)(self.center.y);
                    }
                    else if (self.progress <= 400)
                    {
                        dx = (Double)(self.center.x);
                        dy = (Double)(self.center.y) + 1.5;
                    }
                    else
                    {
                        dx = (Double)(self.center.x) - 2.0;
                        dy = (Double)(self.center.y);
                    }
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 14) // small bird (hidari he smooth speed up)
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dx:Double = (Double)(self.center.x) - (Double)(self.progress) * 0.1;
                    var dy:Double = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 15) // small bird (ryuusenkei)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dy:Double = self.baseY + (Double)(log2((Double)(self.progress) + 2.0) * 5.0);
                    self.center = CGPoint(x:(Double)(self.center.x - 1.0), y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 16) // small bird (speed 1)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 1, self.center.y);
                }
            }
            else if (self.movePattern == 17) // small bird (speed 2)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 1.4, self.center.y);
                }
            }
            else if (self.movePattern == 18) // small bird (speed 3)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 1.8, self.center.y);
                }
            }
            else if (self.movePattern == 19) // small bird (speed 4)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 2.2, self.center.y);
                }
            }
            else if (self.movePattern == 20) // small bird (speed 5)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 2.6, self.center.y);
                }
            }
            else if (self.movePattern == 21) // small bird (speed 6)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 3.0, self.center.y);
                }
            }
            else if (self.movePattern == 22) // cloud1
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x + 1.2, self.center.y - 3);
                }
            }
            else if (self.movePattern == 23) // eyebird
            {
                if (self.specialMove)
                {
                    if (self.progress <= 300)
                    {
                        var dx:Double = (Double)(self.center.x) + 2.50;
                        self.center = CGPoint(x:dx, y:(Double)(self.center.y));
                    }
                    else
                    {
                        var dx:Double = (Double)(self.center.x) + 3.0 - ((Double)(self.progress)-310.0) * 0.1;
                        self.center = CGPoint(x:dx, y:(Double)(self.center.y));
                    }
                    self.progress++;
                }
                else
                {
                    if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                    {
                        var dy:Double = self.baseY + (Double)(log2((Double)(self.progress))) * 27.0;
                        self.center = CGPoint(x:(Double)(self.center.x) - 1.5, y:dy);
                        self.progress++;
                    }
                }
            }
            else if (self.movePattern == 24) // bigbird (circle 1)
            {
                var r:Double = 100.0;
                var speed:Double = 1.0;
                var dx:Double = self.baseX - 0.0 + r * cos(M_PI * (90.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                var dy:Double = self.baseY - r + (r * sin(M_PI * (90.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 25) // bigbird (circle 2)
            {
                var r:Double = 100.0;
                var speed:Double = 1.0;
                var dx:Double = self.baseX - 200.0 + r * cos(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                var dy:Double = self.baseY - r + (r * sin(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 26) // bigbird (circle 3)
            {
                var r:Double = 100.0;
                var speed:Double = 1.0;
                var dx:Double = self.baseX - 100.0 + r * cos(M_PI * (330.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                var dy:Double = self.baseY + r + (r * sin(M_PI * (Double)(330.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 27) // bigbird (circle 4)
            {
                var r:Double = 100.0;
                var speed:Double = 2.0;
                var dx:Double = self.baseX - 0.0 + r * cos(M_PI * (90.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                var dy:Double = self.baseY - r + (r * sin(M_PI * (90.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 28) // bigbird (circle 5)
            {
                var r:Double = 100.0;
                var speed:Double = 2.0;
                var dx:Double = self.baseX - 200.0 + r * cos(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                var dy:Double = self.baseY - r + (r * sin(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 29) // bigbird (circle 6)
            {
                var r:Double = 100.0;
                var speed:Double = 2.0;
                var dx:Double = self.baseX - 100.0 + r * cos(M_PI * (330.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                var dy:Double = self.baseY + r + (r * sin(M_PI * (Double)(330.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 30) // bigbird (circle 7)
            {
                var r:Double = 100.0;
                var speed:Double = 3.0;
                var dx:Double = self.baseX - 0.0 + r * cos(M_PI * (Double)((90.0 + (Double)(self.progress) * speed)) / 180.0) - (Double)(self.progress)*2.5;
                var dy:Double = self.baseY - r + (r * sin(M_PI * (Double)((90.0 + (Double)(self.progress) * speed)) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 31) // bigbird (circle 8)
            {
                var r:Double = 100.0;
                var speed:Double = 3.0;
                var dx:Double = self.baseX - 200.0 + r * cos(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress) * 2.5;
                var dy:Double = self.baseY - r + (r * sin(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
               self.progress++;
            }
            else if (self.movePattern == 32) // bigbird (circle 9)
            {
                var r:Double = 100.0;
                var speed:Double = 3.0;
                var dx:Double = self.baseX - 100.0 + r * cos(M_PI * (330.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                var dy:Double = self.baseY + r + (r * sin(M_PI * (330.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 33) // bigbird (sudden front)
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var ddx:Double = 13.0 - (Double)(self.progress) * 0.3;
                    if (ddx <= 0.5) { ddx = 0.5; }
                    var dx:Double = (Double)(self.center.x) - ddx;
                    var dy:Double = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 34) // fall berry (slow fall)
            {
                if ((Double)(self.center.x) <= (Double)(ScaleLogic.MovePattern(self.movePattern, base:base)) + self.activeRandom!)
                {
                    var dx:Double = (Double)(self.center.x);
                    if (self.progress <= 10)
                    {
                        var dy:Double = (Double)(self.center.y) + 4.0;
                        self.center = CGPoint(x:dx, y:dy);
                    }
                    else
                    {
                        var dy:Double = (Double)(self.center.y) + ((Double)(self.progress) - 10.0) * 0.1;
                        self.center = CGPoint(x:dx, y:dy);
                    }
                    self.progress++;
                }
                else
                {
                    self.center = CGPoint(x:self.center.x, y:self.center.y + 0.05);
                }
            }
            else if (self.movePattern == 35) // small mouse (speed 4)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 2.2, self.center.y);
                }
            }
            else if (self.movePattern == 36) // big bird tate yure
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var r:Double = 80.0;
                    var dx:Double = (Double)(self.center.x);
                    var dy:Double = self.baseY - (r * sin(M_PI * ((Double)(self.progress)*2.0) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 37)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dx:Double = (Double)(self.center.x) - (Double)(self.progress) * 0.1;
                    var dy:Double = self.baseY + (Double)(log2((Double)(self.progress))) * 14.0;
                    self.center = CGPoint(x: dx, y: dy);
                    self.progress++;
                }
                if (self.center.x < 350)
                {
                    self.MoveToDefault()
                    return true;
                }
            }
            else if (self.movePattern == 38)
            {
                var dx = self.center.x
                if (self.progress > 20)
                {
                    dx = self.center.x - 1.5
                }
                var dy = self.baseY - log2(Double(self.progress)) * self.activeRandom!
                self.center = CGPointMake(dx, CGFloat(dy))
                self.progress++
            }
            else if (self.movePattern == 39)
            {
                var dx = self.center.x
                if (self.progress > 20)
                {
                    dx = self.center.x - 1.5
                }
                self.center = CGPointMake(dx, self.center.y)
                self.progress++
            }
            else if (self.movePattern == 40)
            {
                var dx = self.center.x
                if (self.progress > 20)
                {
                    dx = self.center.x - 1.5
                }
                var dy = self.baseY + log2(Double(self.progress)) * self.activeRandom!
                self.center = CGPointMake(dx, CGFloat(dy))
                self.progress++
            }
            else if (self.movePattern == 41) // fall hand (left position)
            {
                if (self.center.x > ScaleLogic.MovePattern(self.movePattern , base:base))
                {
                    self.center = CGPointMake(self.center.x, self.center.y);
                }
                else
                {
                    if (self.progress <= 20)
                    {
                        var dy = self.center.y + 4.0
                        self.center = CGPointMake(self.center.x + 2.5, dy)
                    }
                    else if (self.progress <= 40)
                    {
                        self.center = CGPointMake(self.center.x + 2.5, self.center.y)
                    }
                    else
                    {
                        self.center = CGPointMake(self.center.x + 2.5, self.center.y+CGFloat((Double(self.progress) - 40.0)*0.1))
                    }
                    self.progress++
                }
            }
            else if (self.movePattern == 42) // fall hand (center position)
            {
                if (self.center.x > ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x, self.center.y);
                }
                else
                {
                    if (self.progress <= 20)
                    {
                        var dy = self.center.y + 4.0
                        self.center = CGPointMake(self.center.x + 2.5, dy)
                    }
                    else if (self.progress <= 40)
                    {
                        self.center = CGPointMake(self.center.x + 2.5, self.center.y)
                    }
                    else
                    {
                        self.center = CGPointMake(self.center.x + 2.5, self.center.y+CGFloat((Double(self.progress) - 40.0)*0.1))
                    }
                    self.progress++
                }
            }
            else if (self.movePattern == 43) // fall hand (right position)
            {
                if (self.center.x > ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x, self.center.y)
                }
                else
                {
                    if (self.progress <= 20)
                    {
                        var dy = self.center.y + 4.0
                        self.center = CGPointMake(self.center.x + 2.5, dy)
                    }
                    else if (self.progress <= 40)
                    {
                        self.center = CGPointMake(self.center.x + 2.5, self.center.y)
                    }
                    else
                    {
                        self.center = CGPointMake(self.center.x + 2.5, self.center.y+CGFloat((Double(self.progress) - 40.0)*0.1))
                    }
                    self.progress++
                }
            }
            else if (self.movePattern == 44) // cloudB (tate yure)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    if (self.activeRandom < 0) { self.activeRandom = self.activeRandom! * -1.0 }
                    var r:Double = 80.0
                    var dy:Double = self.baseY - (r * sin(M_PI * (Double(self.progress)*(1.0 + self.activeRandom!/10.0)) / 180.0))
                    self.center = CGPointMake(self.center.x, CGFloat(dy))
                    self.progress++
                }
            }
            else if (self.movePattern == 45) // big bird (move up)
            {
                if (self.progress < 50)
                {
                    self.center = CGPointMake(self.center.x + 1.50, self.center.y - 2.0)
                }
                else if (self.progress <= 200)
                {
                    self.center = CGPointMake(self.center.x + 1.50, self.center.y)
                }
                else
                {
                    self.center = CGPointMake(self.center.x, self.center.y)
                }
                self.progress++
            }
            else if (self.movePattern == 46) // small-bird circle(fix pattern 1)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dy:Double = Double(self.center.y) + self.fixPattern!
                    self.center = CGPointMake(self.center.x - 1, CGFloat(dy))
                    self.progress++
                }
            }
            else if (self.movePattern == 47) // small-bird circle(fix pattern 2)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dy = Double(self.center.y) + self.fixPattern!
                    self.center = CGPoint(x:Double(self.center.x) - 2.0, y:dy)
                    self.progress++
                }
            }
            else if (self.movePattern == 48) // cloud1 (/dont use)
            {
                if (self.progress < 1200)
                {
                    self.center = CGPointMake(self.center.x, self.center.y)
                }
                else if (self.progress < 2100)
                {
                    self.center = CGPointMake(self.center.x + 1.50, self.center.y)
                }
                else
                {
                    self.center = CGPointMake(self.center.x, self.center.y)
                }
                self.progress++
            }
            else if (self.movePattern == 49) // big-bird (large circle)
            {
                var r = self.fixPattern!
                var speed = self.fixPattern2!
                var dx = self.baseX + r * cos(M_PI * (Double(self.progress) * speed) / 180.0) - Double(self.progress)*1.5
                var dy = self.baseY + r + (r * sin(M_PI * (Double(self.progress) * speed) / 180.0))
                self.center = CGPoint(x:dx, y:dy)
                self.progress++
            }
            else if (self.movePattern == 50) // small bird (hidari he speedup <fixpattern kahen>)
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dx:Double = Double(self.center.x) - 2.0 - Double(self.progress) * self.fixPattern!
                    var dy:Double = Double(self.center.y)
                    self.center = CGPoint(x:dx, y:dy)
                    self.progress++
                }
            }
            else if (self.movePattern == 51) // small cloud (speed 2)
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dx = self.center.x - 1;
                    var dy = self.center.y;
                    self.center = CGPointMake(dx, dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 52) // simple move
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var dx = Double(self.center.x) - self.fixPattern!
                    var dy = Double(self.center.y) + self.fixPattern2!
                    self.center = CGPoint(x:dx, y:dy)
                    self.progress++
                }
            }
            else if (self.movePattern == 53) // cloud1 (hidari timer kotei)
            {
                if (Double(self.center.x) > self.fixPattern)
                {
                    self.center = CGPointMake(self.center.x, self.center.y)
                }
                else if (self.progress < 1200)
                {
                    self.center = CGPointMake(self.center.x + 2.50, self.center.y)
                    self.progress++
                }
                else
                {
                    self.center = CGPointMake(self.center.x, self.center.y)
                }
            }
            else if (self.movePattern == 54) // bigbird ( after up )
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    self.center = CGPointMake(self.center.x - 1, self.center.y - 1);
                }
            }
            else if (self.movePattern == 55)
            {
                if (self.activeRandom < 0) { self.activeRandom = self.activeRandom! * -1.0 }
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base: base)) {
                    self.progress++;
                    var dy:Double = Double(self.baseY) + log(Double(self.progress)) * self.activeRandom!;
                    self.center = CGPoint(x:self.center.x - 1.0, y:CGFloat(dy))
                }
            }
            else if (self.movePattern == 56) { // Heaven 5 ( boss )
                var dy:Double = 0
                var dx:Double = 0

                if (self.progress <= 120)
                {
                    MoveLogic.GoStraight(self);
                }
                else if (self.progress <= 200) // +80
                {
                    MoveLogic.GoDown(self);
                }
                else if (self.progress <= 350) // +150
                {
                    MoveLogic.GoLeft(self);
                }
                else if (self.progress <= 510) // +160
                {
                    MoveLogic.GoUp(self);
                }
                else if (self.progress <= 660) // +150
                {
                    MoveLogic.GoRight(self);
                }
                else if (self.progress <= 740) // +80
                {
                    MoveLogic.GoDown(self);
                }
                else if (self.progress <= 890) {
                    dx = (Double)(self.center.x) - 3.0 + 0.05 * (Double(progress) - 740.0);
                    dy = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy)
                }
                else if (self.progress <= 1040) {
                    dx = (Double)(self.center.x) + 8.0 - 0.05 * (Double(progress) - 890.0);
                    dy = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy)
                }
                else if (self.progress <= 1140) {
                    dx = (Double)(self.center.x) + 1.6;
                    dy = (Double)(self.center.y) + 3.0 - 0.06 * (Double(progress) - 1040.0);
                    self.center = CGPoint(x:dx, y:dy)
                }
                else if (self.progress <= 1240) {
                    dx = (Double)(self.center.x) + 1.6;
                    dy = (Double)(self.center.y) - 3.0 + 0.06 * (Double(progress) - 1140.0);
                    self.center = CGPoint(x:dx, y:dy)
                }
                else if (self.progress <= 1340) {
                    dx = (Double)(self.center.x) + 1.6;
                    dy = (Double)(self.center.y) + 3.0 - 0.06 * (Double(progress) - 1240.0);
                    self.center = CGPoint(x:dx, y:dy)
                }
                else if (self.progress <= 1440) {
                    dx = (Double)(self.center.x) + 1.6;
                    dy = (Double)(self.center.y) - 3.0 + 0.06 * (Double(progress) - 1340.0);
                    self.center = CGPoint(x:dx, y:dy)
                }
                else if (self.progress <= 1500) {
                    dx = (Double)(self.center.x) + 9.0;
                    dy = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy)
                }
                else if (self.progress <= 1600) {
                    dx = (Double)(self.center.x) + 3.0;
                    dy = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy)
                }
                else if (self.progress <= 1800) {
                    dx = (Double)(self.center.x) + 2.5;
                    dy = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy)
                } else if (self.progress <= 2000) {
                    var r:Double = 100.0;
                    var speed:Double = 1.0;
                    var dx:Double = self.baseX - 0.0 + r * cos(M_PI * (Double)((90.0 + (Double)(self.progress) * speed)) / 180.0) - (Double)(self.progress)*1.0;
                    var dy:Double = self.baseY - r + (r * sin(M_PI * (Double)((90.0 + (Double)(self.progress) * speed)) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                }
                else {
                    dx = (Double)(self.center.x) - 1.0;
                    dy = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy)
                }
                self.progress++;
            }
            else if (self.movePattern == 57) // cloudC (tate yure + speed)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    if (self.activeRandom < 0) { self.activeRandom = self.activeRandom! * -1.0 }
                    var r:Double = 120.0
                    var dx:Double = Double(self.center.x) - self.fixPattern!
                    var dy:Double = self.baseY - (r * sin(M_PI * (Double(self.progress)*(2.0 + self.activeRandom!/10.0)) / 180.0))
                    self.center = CGPoint(x:dx, y:dy)
                    self.progress++
                }
            }
        }
        self.SceneOut(num)
        return false
    }

    func SceneOut(num:Int)
    {
        if (self.hidden == false)
        {
            if (self.center.x <= -100-self.frame.size.width/2)
            {
                //println("scene out");
                self.MoveToDefault()
                return;
            }
            if (self.center.y >= 1000)
            {
                self.MoveToDefault();
            }
        }
    }
    
    static let INIT_POS_X: CGFloat = -5000
    static let INIT_POS_Y: CGFloat = -5000
    func MoveToDefault()
    {
        self.center = CGPointMake(-5000, -5000)
        //self.movePattern = 0;
        self.baseX = 0
        self.baseY = 0
        self.progress = 0
        self.start = false
        self.specialMove = false
        self.fixPattern = 0
        self.fixPattern2 = 0
        self.activeRandom = 0
        self.immuneDamage = 0
        self.hidden = true
    }
    
    func ActivateObject(x:Double, y:Double, move:Int?, activeRandomX:Double?, width:Int?, fixPattern:Double?, fixPattern2:Double?)
    {
        self.movePattern = move
        self.baseX = x
        self.baseY = y
        self.start = false
        self.progress = 0
        self.hidden = false
        self.specialMove = false
        self.activeRandom = activeRandomX
        self.fixPattern = fixPattern
        self.fixPattern2 = fixPattern2
        // cloudC専用
        self.center = CGPoint(x:x, y:y)
        if (width > 0)
        {
            self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:(CGFloat)(width!), height:self.frame.size.height)
        }
    }

}