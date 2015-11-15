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
    var fixPattern3:Double? = 0.0 // 動作パターン（固定パラメタ３）// add [ENHANCE-A]
    var immuneDamage:Int = 0 // ダメージ無効（無敵）
    var nowFreeze:Int = 0 // 凍結状態（動作不可) // add [ENHANCE-A]
    var nowRiding:Int = 0 // 筋斗雲に乗っている状態 // add [ENHANCE-A]
    var parentObj:ImageObject! = nil  // 苺オブジェクト // add [ENHANCE-A]
    var maxDisappear:Int = 0 // 消滅するまでのトータルカウント値 // add [ENHANCE-A]
    var nowDisappear:Int = 0 // 消滅するまでの現在カウントダウン値 // add [ENHANCE-A]
    var nowActive:Bool = false // 現在アクティブかどうかを示すフラグ // add [ENHANCE-A]
    
    func MoveUpdate(num:Int, base:CGFloat, scaleY:CGFloat) -> Bool {
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
                    let dy:Double = self.baseY + 12.0 * log2(Double(self.progress) + 2.0)
                    self.center = CGPoint(x:self.center.x - 1.0, y:CGFloat(dy))
                    self.progress++
                }
            }
            else if (self.movePattern == 9) // small bird (circle)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let r:Double = 30.0
                    let dx:Double = 400.0 + r * cos(M_PI * (90.0 + Double(self.progress)) / 180.0) - Double(self.progress)
                    let dy:Double = self.baseY - r + (r * sin(M_PI * (90.0 + Double(self.progress)) / 180.0))
                    self.center = CGPoint(x:dx, y:dy)
                    self.progress++
                }
            }
            else if (self.movePattern == 10) // small bird (ryuusenkei)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let r:Double = 20.0;
                    let dx:Double = (Double)(self.center.x) - 1.2;
                    let dy:Double = self.baseY - r + (r * sin(M_PI * ((Double)(self.progress)*3.0) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 11) // big mouse (tate yure)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let r:Double = 80.0;
                    let dx:Double = (Double)(self.center.x);
                    let dy:Double = self.baseY - (r * sin(M_PI * ((Double)(self.progress)*3.0) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 12) // big bird (ue ni ryuusenkei)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let dy = self.baseY - (Double)(log((Double)(self.progress))) * 5.0;
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
                    let dx:Double = (Double)(self.center.x) - (Double)(self.progress) * 0.1;
                    let dy:Double = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 15) // small bird (ryuusenkei)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let dy:Double = self.baseY + (Double)(log2((Double)(self.progress) + 2.0) * 5.0);
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
                        let dx:Double = (Double)(self.center.x) + 2.50;
                        self.center = CGPoint(x:dx, y:(Double)(self.center.y));
                    }
                    else
                    {
                        let dx:Double = (Double)(self.center.x) + 3.0 - ((Double)(self.progress)-310.0) * 0.1;
                        self.center = CGPoint(x:dx, y:(Double)(self.center.y));
                    }
                    self.progress++;
                }
                else
                {
                    if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                    {
                        let dy:Double = self.baseY + (Double)(log2((Double)(self.progress))) * 27.0;
                        self.center = CGPoint(x:(Double)(self.center.x) - 1.5, y:dy);
                        self.progress++;
                    }
                }
            }
            else if (self.movePattern == 24) // bigbird (circle 1)
            {
                let r:Double = 100.0;
                let speed:Double = 1.0;
                let dx:Double = self.baseX - 0.0 + r * cos(M_PI * (90.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                let dy:Double = self.baseY - r + (r * sin(M_PI * (90.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 25) // bigbird (circle 2)
            {
                let r:Double = 100.0;
                let speed:Double = 1.0;
                let dx:Double = self.baseX - 200.0 + r * cos(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                let dy:Double = self.baseY - r + (r * sin(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 26) // bigbird (circle 3)
            {
                let r:Double = 100.0;
                let speed:Double = 1.0;
                let dx:Double = self.baseX - 100.0 + r * cos(M_PI * (330.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                let dy:Double = self.baseY + r + (r * sin(M_PI * (Double)(330.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 27) // bigbird (circle 4)
            {
                let r:Double = 100.0;
                let speed:Double = 2.0;
                let dx:Double = self.baseX - 0.0 + r * cos(M_PI * (90.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                let dy:Double = self.baseY - r + (r * sin(M_PI * (90.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 28) // bigbird (circle 5)
            {
                let r:Double = 100.0;
                let speed:Double = 2.0;
                let dx:Double = self.baseX - 200.0 + r * cos(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                let dy:Double = self.baseY - r + (r * sin(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 29) // bigbird (circle 6)
            {
                let r:Double = 100.0;
                let speed:Double = 2.0;
                let dx:Double = self.baseX - 100.0 + r * cos(M_PI * (330.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                let dy:Double = self.baseY + r + (r * sin(M_PI * (Double)(330.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 30) // bigbird (circle 7)
            {
                let r:Double = 100.0;
                let speed:Double = 3.0;
                let dx:Double = self.baseX - 0.0 + r * cos(M_PI * (Double)((90.0 + (Double)(self.progress) * speed)) / 180.0) - (Double)(self.progress)*2.5;
                let dy:Double = self.baseY - r + (r * sin(M_PI * (Double)((90.0 + (Double)(self.progress) * speed)) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 31) // bigbird (circle 8)
            {
                let r:Double = 100.0;
                let speed:Double = 3.0;
                let dx:Double = self.baseX - 200.0 + r * cos(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress) * 2.5;
                let dy:Double = self.baseY - r + (r * sin(M_PI * (210.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
               self.progress++;
            }
            else if (self.movePattern == 32) // bigbird (circle 9)
            {
                let r:Double = 100.0;
                let speed:Double = 3.0;
                let dx:Double = self.baseX - 100.0 + r * cos(M_PI * (330.0 + (Double)(self.progress) * speed) / 180.0) - (Double)(self.progress)*2.5;
                let dy:Double = self.baseY + r + (r * sin(M_PI * (330.0 + (Double)(self.progress) * speed) / 180.0));
                self.center = CGPoint(x:dx, y:dy);
                self.progress++;
            }
            else if (self.movePattern == 33) // bigbird (sudden front)
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var ddx:Double = 13.0 - (Double)(self.progress) * 0.3;
                    if (ddx <= 0.5) { ddx = 0.5; }
                    let dx:Double = (Double)(self.center.x) - ddx;
                    let dy:Double = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 34) // fall berry (slow fall)
            {
                if ((Double)(self.center.x) <= (Double)(ScaleLogic.MovePattern(self.movePattern, base:base)) + self.activeRandom!)
                {
                    let dx:Double = (Double)(self.center.x);
                    if (self.progress <= 10)
                    {
                        let dy:Double = (Double)(self.center.y) + 4.0;
                        self.center = CGPoint(x:dx, y:dy);
                    }
                    else
                    {
                        let dy:Double = (Double)(self.center.y) + ((Double)(self.progress) - 10.0) * 0.1;
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
                    let r:Double = 80.0;
                    let dx:Double = (Double)(self.center.x);
                    let dy:Double = self.baseY - (r * sin(M_PI * ((Double)(self.progress)*2.0) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 37)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let dx:Double = (Double)(self.center.x) - (Double)(self.progress) * 0.1;
                    let dy:Double = self.baseY + (Double)(log2((Double)(self.progress))) * 14.0;
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
                let dy = self.baseY - log2(Double(self.progress)) * self.activeRandom!
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
                let dy = self.baseY + log2(Double(self.progress)) * self.activeRandom!
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
                        let dy = self.center.y + 4.0
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
                        let dy = self.center.y + 4.0
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
                        let dy = self.center.y + 4.0
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
                    let r:Double = 80.0
                    let dy:Double = self.baseY - (r * sin(M_PI * (Double(self.progress)*(1.0 + self.activeRandom!/10.0)) / 180.0))
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
                    let dy:Double = Double(self.center.y) + self.fixPattern!
                    self.center = CGPointMake(self.center.x - 1, CGFloat(dy))
                    self.progress++
                }
            }
            else if (self.movePattern == 47) // small-bird circle(fix pattern 2)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let dy = Double(self.center.y) + self.fixPattern!
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
                let r = self.fixPattern!
                let speed = self.fixPattern2!
                let dx = self.baseX + r * cos(M_PI * (Double(self.progress) * speed) / 180.0) - Double(self.progress)*1.5
                let dy = self.baseY + r + (r * sin(M_PI * (Double(self.progress) * speed) / 180.0))
                self.center = CGPoint(x:dx, y:dy)
                self.progress++
            }
            else if (self.movePattern == 50) // small bird (hidari he speedup <fixpattern kahen>)
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let dx:Double = Double(self.center.x) - 2.0 - Double(self.progress) * self.fixPattern!
                    let dy:Double = Double(self.center.y)
                    self.center = CGPoint(x:dx, y:dy)
                    self.progress++
                }
            }
            else if (self.movePattern == 51) // small cloud (speed 2)
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let dx = self.center.x - 1;
                    let dy = self.center.y;
                    self.center = CGPointMake(dx, dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 52) // simple move
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    let dx = Double(self.center.x) - self.fixPattern!
                    let dy = Double(self.center.y) + self.fixPattern2!
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
                    let dy:Double = Double(self.baseY) + log(Double(self.progress)) * self.activeRandom!;
                    self.center = CGPoint(x:self.center.x - 1.0, y:CGFloat(dy))
                }
            }
            else if (self.movePattern == 56) { // Heaven 5 ( boss / fire )
                MoveLogic.BlackBirdMove(self, progress: self.progress, base:base)
                self.progress++;
            }
            else if (self.movePattern == 57) // cloudC (tate yure + speed)
            {
                if (self.center.x < ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    if (self.activeRandom < 0) { self.activeRandom = self.activeRandom! * -1.0 }
                    let r:Double = 120.0
                    let dx:Double = Double(self.center.x) - self.fixPattern!
                    let dy:Double = self.baseY - (r * sin(M_PI * (Double(self.progress)*(2.0 + self.activeRandom!/10.0)) / 180.0))
                    self.center = CGPoint(x:dx, y:dy)
                    self.progress++
                }
            }
            else if (self.movePattern == 58) // kintoun
            {
                if (self.nowRiding == 1) {
                    self.center = CGPoint(x:self.parentObj.center.x-10.0 , y:self.parentObj.center.y + 35.0 * CGFloat(base / 480) )
                }
            }
            else if (self.movePattern == 59) // bird sudden appear, stay x count, then sudden go
            {
                if (self.center.x > 400) {
                    self.center = CGPoint(x:self.center.x-10.0, y:self.center.y)
                } else if (self.progress <= 100)
                {
                    self.center = CGPoint(x:self.center.x+ScaleLogic.GameSpeed(base) + ScaleLogic.ObjectSpeed(base), y:self.center.y)
                    self.progress++;
                } else {
                    self.center = CGPoint(x:self.center.x-6.0, y:self.center.y)
                    self.progress++;
                }
            }
            else if (self.movePattern == 60) // fall hand (any position)
            {
                if (Double(self.center.x) > self.fixPattern! * Double(base / 480))
                {
                    self.center = CGPointMake(self.center.x-10.0, self.center.y);
                }
                else
                {
                    if (self.progress <= 20)
                    {
                        let dy = self.center.y + 4.0
                        self.center = CGPointMake(self.center.x + ScaleLogic.GameSpeed(base) + ScaleLogic.ObjectSpeed(base), dy)
                    }
                    else if (self.progress <= 40)
                    {
                        self.center = CGPointMake(self.center.x + ScaleLogic.GameSpeed(base) + ScaleLogic.ObjectSpeed(base), self.center.y)
                    }
                    else
                    {
                        self.center = CGPointMake(self.center.x + ScaleLogic.GameSpeed(base) + ScaleLogic.ObjectSpeed(base), self.center.y+CGFloat((Double(self.progress) - 40.0)*0.2))
                    }
                    self.progress++
                }
            }
            else if (self.movePattern == 61) // hand (leftside remain/fadeout)
            {
                //if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                if (Double(self.center.x) > self.fixPattern! * Double(base / 480))
                {
                    self.center = CGPointMake(self.center.x + ScaleLogic.MovePattern61(base), self.center.y)
                } else {
//                    var ddx:Double = 13.0 - (Double)(self.progress) * 0.3;
//                    if (ddx <= 0.5) { ddx = 0.5; }
//                    var dx:Double = (Double)(self.center.x) - ddx;
//                    var dy:Double = (Double)(self.center.y);
//                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                    if (Double(self.progress) <= self.fixPattern2)
                    {
                        self.center = CGPointMake(self.center.x + ScaleLogic.GameSpeed(base) + ScaleLogic.ObjectSpeed(base), self.center.y)
                    }
                    else
                    {
                        self.center = CGPointMake(self.center.x + ScaleLogic.GameSpeed(base) + ScaleLogic.ObjectSpeed(base), self.center.y+2.0)
                    }
                }
            }
            else if (self.movePattern == 62) { // anchor down
                if (Double(self.center.x) > Double(330.0 * base / 480.0) && self.progress <= 0) {
                    self.center = CGPointMake(self.center.x + ScaleLogic.MovePattern61(base), self.center.y)
                    self.baseX = Double(self.center.x)
                } else {
                    self.progress++;
                    let r:Double = self.fixPattern! * Double(scaleY / 320.0);
                    let speed:Double = self.fixPattern2!;
                    var dx:Double = self.baseX + r * cos(M_PI * ((Double)(self.progress) * speed) / 180.0)
                    dx = dx - (Double)(self.progress) * Double(2.5 * base / 480.0)
                    let dy:Double = (r * sin(M_PI * ((Double)(self.progress) * speed) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                }
            }
            else if (self.movePattern == 63) { // anchor up
                if (Double(self.center.x) > Double(330.0 * base / 480.0) && self.progress <= 0) {
                    self.center = CGPointMake(self.center.x + ScaleLogic.MovePattern61(base), self.center.y)
                    self.baseX = Double(self.center.x)
                } else {
                    self.progress++;
                    let r:Double = self.fixPattern! * Double(scaleY / 320.0);
                    let speed:Double = 1.5;
                    var dx:Double = self.baseX + r * cos(M_PI * ((Double)(self.progress) * speed) / 180.0)
                    dx = dx - (Double)(self.progress) * Double(2.5 * base / 480.0)
                    var dy:Double = self.fixPattern2! * Double(scaleY / 320.0)
                    dy = dy + (-r * sin(M_PI * ((Double)(self.progress) * speed) / 180.0));
                    self.center = CGPoint(x:dx, y:dy);
                }
            }
            else if (self.movePattern == 64) // sudden front(cloudD)
            {
                if (self.center.x <= ScaleLogic.MovePattern(self.movePattern, base:base))
                {
                    var ddx:Double = Double(ScaleLogic.MovePattern64(self.progress, base:base));
                    if (ddx <= 0.5) { ddx = 0.5; }
                    let dx:Double = (Double)(self.center.x) - ddx + 0.5 + Double(ScaleLogic.GameSpeed(base)) + Double(ScaleLogic.ObjectSpeed(base));
                    let dy:Double = (Double)(self.center.y);
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
            else if (self.movePattern == 65) // hidari he smooth speed up
            {
                if (self.center.x > 400 * (base / 480.0)) {
                    self.center = CGPoint(x:self.center.x + ScaleLogic.MovePattern61(base), y:self.center.y)
                } else if (self.progress <= 50) {
                    self.center = CGPoint(x:self.center.x+ScaleLogic.GameSpeed(base) + ScaleLogic.ObjectSpeed(base), y:self.center.y)
                    self.progress++;
                } else {
                    if (self.progress == 51) {
                        self.fixPattern2 = Double(arc4random_uniform(UInt32(self.fixPattern2!)));
                    }
                    let dx:Double = (Double)(self.center.x) - (Double)(self.progress - 50) * 0.15;
                    let dy:Double = (Double)(self.center.y) + self.fixPattern! + self.fixPattern2!;//self.fixPattern! / ((Double)((self.progress - 50)));
                    self.center = CGPoint(x:dx, y:dy);
                    self.progress++;
                }
            }
        }
        self.RefreshStatus(num)
        self.SceneOut(num)
        return false
    }

    // add start [ENHANCE-A]
    func RefreshStatus(num:Int) {
        if (self.nowFreeze > 0) {
            // no action
            self.nowFreeze--;
        }
        if (self.nowDisappear > 0) {
            self.nowDisappear--;
            self.alpha = (CGFloat)((CGFloat)(self.nowDisappear) / (CGFloat)(self.maxDisappear))
            if (self.nowDisappear <= 0) {
                self.MoveToDefault();
            }
        }
    }
    // add end [ENHANCE-A]
    
    func SceneOut(num:Int)
    {
        if (self.nowActive)
        {
            if (self.center.x <= -200-self.frame.size.width/2) // change [ENHANCE-A] 100->200
            {
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
        self.specialMove2 = false
        self.activeRandom = 0.0
        self.fixPattern = 0
        self.fixPattern2 = 0
        self.activeRandom = 0
        self.immuneDamage = 0
        self.nowFreeze = 0 // add [ENHANCE-A]
        self.nowRiding = 0 // add [ENHANCE-A]
        self.parentObj = nil;
        self.maxDisappear = 0 // add [ENHANCE-A]
        self.nowDisappear = 0 // add [ENHANCE-A]
        self.alpha = 1.0 // add [ENHANCE-A]
        self.hidden = true
        self.nowActive = false; // add [ENHANCE-A]
    }
    
    // add start [ENHANCE-A]
    func ChangeAnimation(name:Array<UIImage>)
    {
        self.stopAnimating()
        var imageList: [UIImage] = []
        for var jj:Int = 0; jj < name.count; jj++ {
            imageList.append(name[jj])
        }
        self.animationImages = imageList
        self.startAnimating()
    }
    func ActivateObject(x:Double, y:Double, move:Int?, activeRandomX:Double?, width:Int?, fixPattern:Double?, fixPattern2:Double?)
    {
        ActivateObject(x, y: y, move: move, activeRandomX: activeRandomX, width: width, fixPattern: fixPattern, fixPattern2: fixPattern2, hiddenFirst:false)
    }
    // add end [ENHANCE-A]
    
    func ActivateObject(x:Double, y:Double, move:Int?, activeRandomX:Double?, width:Int?, fixPattern:Double?, fixPattern2:Double?, hiddenFirst:Bool!)
    {
        self.movePattern = move
        self.baseX = x
        self.baseY = y
        self.start = false
        self.progress = 0
        self.hidden = hiddenFirst
        self.specialMove = false
        self.activeRandom = activeRandomX
        self.fixPattern = fixPattern
        self.fixPattern2 = fixPattern2
        self.nowActive = true;
        // cloudC専用
        self.center = CGPoint(x:x, y:y)
        if (width > 0)
        {
            self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:(CGFloat)(width!), height:self.frame.size.height)
        }
    }

}