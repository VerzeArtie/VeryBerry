//
//  ScaleLogic.swift
//  VeryBerry
//
//  Created by Verze on 2015/03/26.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit;

class ScaleLogic {

    // speed
    class func GameSpeed(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 0.59;
        } else if (base == 667) { // maybe iPhone 6
            return 0.56;
        } else if (base == 568) { // maybe iPhone5(s)
            return 0.54;
        } else if (base == 480) { // maybe iPhone 4S
            return 0.50;
        }
        return 0.50;
    }
    class func FieldSpeed(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 0.90;
        } else if (base == 667) { // maybe iPhone 6
            return 0.85;
        } else if (base == 568) { // maybe iPhone5(s)
            return 0.82;
        } else if (base == 480) { // maybe iPhone 4S
            return 0.75;
        }
        return 0.75;
    }
    class func ObjectSpeed(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 2.15;
        } else if (base == 667) { // maybe iPhone 6
            return 2.10;
        } else if (base == 568) { // maybe iPhone5(s)
            return 2.05;
        } else if (base == 480) { // maybe iPhone 4S
            return 2.00;
        }
        return 2.00;
    }
    class func Gravity(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 11.76798; // * 1.20
        } else if (base == 667) { // maybe iPhone 6
            return 10.787315; // 1.10
        } else if (base == 568) { // maybe iPhone5(s)
            return 9.80665;
        } else if (base == 480) { // maybe iPhone 4S
            return 9.80665;
        }
        return 9.80665;
    }
    
    // main menu
    class func LblCopyright_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 300;
        } else if (base == 667) { // maybe iPhone 6
            return 270;
        } else if (base == 568) { // maybe iPhone5(s)
            return 240;
        } else if (base == 480) { // maybe iPhone 4S
            return 219;
        }
        return 219;
    }
    class func LblCopyright_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 404;
        } else if (base == 667) { // maybe iPhone 6
            return 365;
        } else if (base == 568) { // maybe iPhone5(s)
            return 310;
        } else if (base == 480) { // maybe iPhone 4S
            return 310;
        }
        return 310;
    }
    
    class func RandomContinueLabel_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return base - 75
        } else if (base == 667) { // maybe iPhone 6
            return base - 66
        } else if (base == 568) { // maybe iPhone5(s)
            return base - 66
        } else if (base == 480) { // maybe iPhone 4S
            return base - 66
        }
        return base - 66
    }
    class func RandomContinueLabel_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 110
        } else if (base == 667) { // maybe iPhone 6
            return 100
        } else if (base == 568) { // maybe iPhone5(s)
            return 80
        } else if (base == 480) { // maybe iPhone 4S
            return 80
        }
        return base - 80
    }
    class func RandomContinueYes_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return base - 62
        } else if (base == 667) { // maybe iPhone 6
            return base - 62
        } else if (base == 568) { // maybe iPhone5(s)
            return base - 62
        } else if (base == 480) { // maybe iPhone 4S
            return base - 62
        }
        return base - 62
    }
    class func RandomContinueYes_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return RandomContinueLabel_Y(base) + 40
        } else if (base == 667) { // maybe iPhone 6
            return RandomContinueLabel_Y(base) + 38
        } else if (base == 568) { // maybe iPhone5(s)
            return RandomContinueLabel_Y(base) + 36
        } else if (base == 480) { // maybe iPhone 4S
            return RandomContinueLabel_Y(base) + 36
        }
        return RandomContinueLabel_Y(base) + 36
    }
    class func ImgContinueCoin_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return RandomContinueLabel_X(base) - 100
        } else if (base == 667) { // maybe iPhone 6
            return RandomContinueLabel_X(base) - 100
        } else if (base == 568) { // maybe iPhone5(s)
            return RandomContinueLabel_X(base) - 110
        } else if (base == 480) { // maybe iPhone 4S
            return RandomContinueLabel_X(base) - 85
        }
        return RandomContinueLabel_X(base) - 85
    }
    class func ImgContinueCoin_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return RandomContinueLabel_Y(base) + 30;
        } else if (base == 667) { // maybe iPhone 6
            return RandomContinueLabel_Y(base) + 30;
        } else if (base == 568) { // maybe iPhone5(s)
            return RandomContinueLabel_Y(base) + 20;
        } else if (base == 480) { // maybe iPhone 4S
            return RandomContinueLabel_Y(base) + 20;
        }
        return RandomContinueLabel_Y(base) + 20;
    }
    class func LblContinueNum_X(base:CGFloat) -> CGFloat {
        return ImgContinueCoin_X(base)
    }
    class func LblContinueNum_Y(base:CGFloat) -> CGFloat {
        return ImgContinueCoin_Y(base) + 25;
    }
    class func LblMessageForAD_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return ImgContinueCoin_X(base) - 10
        } else if (base == 667) { // maybe iPhone 6
            return ImgContinueCoin_X(base) - 10
        } else if (base == 568) { // maybe iPhone5(s)
            return ImgContinueCoin_X(base) - 10
        } else if (base == 480) { // maybe iPhone 4S
            return ImgContinueCoin_X(base) - 10
        }
        return ImgContinueCoin_X(base) - 10
    }
    class func LblMessageForAD_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return ImgContinueCoin_Y(base) - 35
        } else if (base == 667) { // maybe iPhone 6
            return ImgContinueCoin_Y(base) - 35
        } else if (base == 568) { // maybe iPhone5(s)
            return ImgContinueCoin_Y(base) - 40
        } else if (base == 480) { // maybe iPhone 4S
            return ImgContinueCoin_Y(base) - 35
        }
        return ImgContinueCoin_Y(base) - 35
        
    }

    // finish
    class func ImgFinish_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 130.0
        } else if (base == 667) { // maybe iPhone 6
            return 110.0
        } else if (base == 568) { // maybe iPhone5(s)
            return 90.0
        } else if (base == 480) { // maybe iPhone 4S
            return 90.0
        }
        return 90.0
    }
    class func ImgScoreABonus_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 290.0
        } else if (base == 667) { // maybe iPhone 6
            return 284.0
        } else if (base == 568) { // maybe iPhone5(s)
            return 239.0
        } else if (base == 480) { // maybe iPhone 4S
            return 190.0
        }
        return 190.0
    }
    class func ImgScoreABonus_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return ImgFinish_Y(base) + 100.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgFinish_Y(base) + 90.0
        } else if (base == 568) { // maybe iPhone5(s)
            return ImgFinish_Y(base) + 80.0
        } else if (base == 480) { // maybe iPhone 4S
            return ImgFinish_Y(base) + 80.0
        }
        return ImgFinish_Y(base) + 80.0
    }
    class func ImgScoreBBonus_X(base:CGFloat) -> CGFloat {
        return ImgScoreABonus_X(base)
    }
    class func ImgScoreBBonus_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return ImgScoreABonus_Y(base) + 80.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgScoreABonus_Y(base) + 80.0
        } else if (base == 568) { // maybe iPhone5(s)
            return ImgScoreABonus_Y(base) + 70.0
        } else if (base == 480) { // maybe iPhone 4S
            return ImgScoreABonus_Y(base) + 70.0
        }
        return ImgScoreABonus_Y(base) + 70.0
    }
    class func LblBonusACount_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return ImgScoreABonus_X(base) + 150.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgScoreABonus_X(base) + 120.0
        } else if (base == 568) { // maybe iPhone5(s)
            return ImgScoreABonus_X(base) + 100.0
        } else if (base == 480) { // maybe iPhone 4S
            return ImgScoreABonus_X(base) + 100.0
        }
        return ImgScoreABonus_X(base) + 100.0
    }
    class func LblBonusBCount_X(base:CGFloat) -> CGFloat {
        return LblBonusACount_X(base)
    }
    class func LblBonusACount_Y(base:CGFloat) -> CGFloat {
        return ImgScoreABonus_Y(base)
    }
    class func LblBonusBCount_Y(base:CGFloat) -> CGFloat {
        return ImgScoreBBonus_Y(base)
    }
    
    // move-border
    class func MoveBorder_Front(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 510.0
        } else if (base == 667) { // maybe iPhone 6
            return 470.0
        } else if (base == 568) { // maybe iPhone5(s)
            return 390.0
        } else if (base == 480) { // maybe iPhone 4S
            return 320.0
        }
        return 320.0
    }
    class func MoveBorder_Back(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 56.0
        } else if (base == 667) { // maybe iPhone 6
            return 54.0
        } else if (base == 568) { // maybe iPhone5(s)
            return 52.0
        } else if (base == 480) { // maybe iPhone 4S
            return 50.0
        }
        return 50.0
    }

    // message
    class func LblMainMessage_X(base:CGFloat) -> CGFloat {
        return base/2.0;
    }
    class func LblMainMessage_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 280.0
        } else if (base == 667) { // maybe iPhone 6
            return 250.0
        } else if (base == 568) { // maybe iPhone5(s)
            return 220.0
        } else if (base == 480) { // maybe iPhone 4S
            return 220.0
        }
        return 220.0
    }
    class func LblMessage_X(base:CGFloat) -> CGFloat {
        return base/2.0;
    }
    class func LblMessage_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 207.0
        } else if (base == 667) { // maybe iPhone 6
            return 187.5
        } else if (base == 568) { // maybe iPhone5(s)
            return 160.0
        } else if (base == 480) { // maybe iPhone 4S
            return 160.0
        }
        return 160.0
    }
    
    class func ImgCongratulations_X(base:CGFloat) -> CGFloat {
        return base/2.0;
    }
    class func ImgCongratulations_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 138
        } else if (base == 667) { // maybe iPhone 6
            return 125
        } else if (base == 568) { // maybe iPhone5(s)
            return 112
        } else if (base == 480) { // maybe iPhone 4S
            return 112
        }
        return 112
    }

    // stage bar
    class func ImgTotalBonusA_X(base:CGFloat) -> CGFloat {
        return 30.0
    }
    class func LblTotalBonusA_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return ImgTotalBonusA_X(base) + 75.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgTotalBonusA_X(base) + 65.0
        } else if (base == 568) { // maybe iPhone5(s)
            return ImgTotalBonusA_X(base) + 55.0
        } else if (base == 480) { // maybe iPhone 4S
            return ImgTotalBonusA_X(base) + 45.0
        }
        return ImgTotalBonusA_X(base) + 45.0
    }
    class func ImgTotalBonusB_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return LblTotalBonusA_X(base) + 85.0
        } else if (base == 667) { // maybe iPhone 6
            return LblTotalBonusA_X(base) + 75.0
        } else if (base == 568) { // maybe iPhone5(s)
            return LblTotalBonusA_X(base) + 65.0
        } else if (base == 480) { // maybe iPhone 4S
            return LblTotalBonusA_X(base) + 55.0
        }
        return LblTotalBonusA_X(base) + 55.0
    }
    class func LblTotalBonusB_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return ImgTotalBonusB_X(base) + 75.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgTotalBonusB_X(base) + 65.0
        } else if (base == 568) { // maybe iPhone5(s)
            return ImgTotalBonusB_X(base) + 55.0
        } else if (base == 480) { // maybe iPhone 4S
            return ImgTotalBonusB_X(base) + 45.0
        }
        return ImgTotalBonusB_X(base) + 45.0
    }
    class func LblTotalScore_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return LblStage_X(base) - 130;
        } else if (base == 667) { // maybe iPhone 6
            return LblStage_X(base) - 120;
        } else if (base == 568) { // maybe iPhone5(s)
            return LblStage_X(base) - 110;
        } else if (base == 480) { // maybe iPhone 4S
            return LblStage_X(base) - 100;
        }
        return LblStage_X(base) - 100;
    }
    class func LblStage_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return LblPause_X(base) - 130
        } else if (base == 667) { // maybe iPhone 6
            return LblPause_X(base) - 115
        } else if (base == 568) { // maybe iPhone5(s)
            return LblPause_X(base) - 100
        } else if (base == 480) { // maybe iPhone 4S
            return LblPause_X(base) - 85
        }
        return LblPause_X(base) - 85
    }
    class func LblPause_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return base - 70
        } else if (base == 667) { // maybe iPhone 6
            return base - 60
        } else if (base == 568) { // maybe iPhone5(s)
            return base - 50
        } else if (base == 480) { // maybe iPhone 4S
            return base - 40
        }
        return 60.0
    }
    class func LblViewPause_X(base:CGFloat) -> CGFloat {
        return base/2
    }
    
    class func LblViewPause_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 207.0
        } else if (base == 667) { // maybe iPhone 6
            return 187.5
        } else if (base == 568) { // maybe iPhone5(s)
            return 160.0
        } else if (base == 480) { // maybe iPhone 4S
            return 160.0
        }
        return 160.0
    }
    
    // add start [ENHANCE-A]
    class func lblCredit_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 1570
        } else if (base == 667) { // maybe iPhone 6
            return 1415
        } else if (base == 568) { // maybe iPhone5(s)
            return 1213
        } else if (base == 480) { // maybe iPhone 4S
            return 1210
        }
        return 1210
    }
    class func lblCredit_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 330
        } else if (base == 667) { // maybe iPhone 6
            return 297
        } else if (base == 568) { // maybe iPhone5(s)
            return 253
        } else if (base == 480) { // maybe iPhone 4S
            return 250
        }
        return 250
    }
    class func lblStage_baseX(base:CGFloat) -> [CGFloat] {
        var current:[CGFloat] = [];
        if (base == 736) { // maybe iPhone 6(s) plus
            for (var ii = 0; ii < 6; ii++) { current.append(545 + 46*CGFloat(ii)) }
            for (var ii = 0; ii < 6; ii++) { current.append(585 + 46*CGFloat(ii)) }
            return current
        } else if (base == 667) { // maybe iPhone 6
            for (var ii = 0; ii < 6; ii++) { current.append(495 + 41*CGFloat(ii)) }
            for (var ii = 0; ii < 6; ii++) { current.append(530 + 41*CGFloat(ii)) }
            return current
        } else if (base == 568) { // maybe iPhone5(s)
            for (var ii = 0; ii < 6; ii++) { current.append(420 + 36*CGFloat(ii)) }
            for (var ii = 0; ii < 6; ii++) { current.append(450 + 36*CGFloat(ii)) }
            return current
        } else if (base == 480) { // maybe iPhone 4S
            for (var ii = 0; ii < 6; ii++) { current.append(420 + 35*CGFloat(ii)) }
            for (var ii = 0; ii < 6; ii++) { current.append(450 + 35*CGFloat(ii)) }
            return current
        }
        for (var ii = 0; ii < 6; ii++) { current.append(420 + 35*CGFloat(ii)) }
        for (var ii = 0; ii < 6; ii++) { current.append(450 + 35*CGFloat(ii)) }
        return current
    }
    class func lblStage_baseY(base:CGFloat) -> [CGFloat] {
        var current:[CGFloat] = [];
        if (base == 736) { // maybe iPhone 6(s) plus
            for (var ii = 0; ii < 6; ii++) { current.append(317) }
            for (var ii = 0; ii < 6; ii++) { current.append(73) }
            return current
        } else if (base == 667) { // maybe iPhone 6
            for (var ii = 0; ii < 6; ii++) { current.append(284) }
            for (var ii = 0; ii < 6; ii++) { current.append(60) }
            return current
        } else if (base == 568) { // maybe iPhone5(s)
            for (var ii = 0; ii < 6; ii++) { current.append(240) }
            for (var ii = 0; ii < 6; ii++) { current.append(55) }
            return current
        } else if (base == 480) { // maybe iPhone 4S
            for (var ii = 0; ii < 6; ii++) { current.append(240) }
            for (var ii = 0; ii < 6; ii++) { current.append(55) }
            return current
        }
        for (var ii = 0; ii < 6; ii++) { current.append(240) }
        for (var ii = 0; ii < 6; ii++) { current.append(55) }
        return current
    }
    class func lblStage_Width(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 40
        } else if (base == 667) { // maybe iPhone 6
            return 39
        } else if (base == 568) { // maybe iPhone5(s)
            return 35
        } else if (base == 480) { // maybe iPhone 4S
            return 34
        }
        return 34
    }
    class func lblTutorial_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 306
        } else if (base == 667) { // maybe iPhone 6
            return 277
        } else if (base == 568) { // maybe iPhone5(s)
            return 234
        } else if (base == 480) { // maybe iPhone 4S
            return 236
        }
        return 236
    }
    class func lblTutorial_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 225
        } else if (base == 667) { // maybe iPhone 6
            return 208
        } else if (base == 568) { // maybe iPhone5(s)
            return 177
        } else if (base == 480) { // maybe iPhone 4S
            return 177
        }
        return 177
    }
    class func lblTutorial_Width(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 115
        } else if (base == 667) { // maybe iPhone 6
            return 104
        } else if (base == 568) { // maybe iPhone5(s)
            return 90
        } else if (base == 480) { // maybe iPhone 4S
            return 90
        }
        return 90
    }
    class func lblTutorial_Height(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 70
        } else if (base == 667) { // maybe iPhone 6
            return 59
        } else if (base == 568) { // maybe iPhone5(s)
            return 50
        } else if (base == 480) { // maybe iPhone 4S
            return 50
        }
        return 50
    }
    class func lblScore_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 1408
        } else if (base == 667) { // maybe iPhone 6
            return 1276
        } else if (base == 568) { // maybe iPhone5(s)
            return 1091
        } else if (base == 480) { // maybe iPhone 4S
            return 1091
        }
        return 1091
    }
    class func lblScore_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 77
        } else if (base == 667) { // maybe iPhone 6
            return 71
        } else if (base == 568) { // maybe iPhone5(s)
            return 62
        } else if (base == 480) { // maybe iPhone 4S
            return 62
        }
        return 62
    }
    class func lblScore_Width(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 98
        } else if (base == 667) { // maybe iPhone 6
            return 88
        } else if (base == 568) { // maybe iPhone5(s)
            return 70
        } else if (base == 480) { // maybe iPhone 4S
            return 70
        }
        return 70
    }
    class func lblScore_Height(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 56
        } else if (base == 667) { // maybe iPhone 6
            return 45
        } else if (base == 568) { // maybe iPhone5(s)
            return 35
        } else if (base == 480) { // maybe iPhone 4S
            return 35
        }
        return 35
    }
    class func lblAbout_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 5
        } else if (base == 667) { // maybe iPhone 6
            return 5
        } else if (base == 568) { // maybe iPhone5(s)
            return 5
        } else if (base == 480) { // maybe iPhone 4S
            return 5
        }
        return 5
    }
    class func lblAbout_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 367
        } else if (base == 667) { // maybe iPhone 6
            return 335
        } else if (base == 568) { // maybe iPhone5(s)
            return 283
        } else if (base == 480) { // maybe iPhone 4S
            return 283
        }
        return 283
    }
    class func lblAbout_Width(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 109
        } else if (base == 667) { // maybe iPhone 6
            return 95
        } else if (base == 568) { // maybe iPhone5(s)
            return 80
        } else if (base == 480) { // maybe iPhone 4S
            return 81
        }
        return 81
    }
    class func lblAbout_Height(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6(s) plus
            return 42
        } else if (base == 667) { // maybe iPhone 6
            return 33
        } else if (base == 568) { // maybe iPhone5(s)
            return 31
        } else if (base == 480) { // maybe iPhone 4S
            return 31
        }
        return 31
    }
    // add end [ENHANCE-A]
    
    class func BossMove_X(progress:Int, border:[Int], number:Int, base:CGFloat) -> Double {
        if (number == 0) {
            if (base == 736) { // maybe iPhone 6(s) plus
                return 1.3
            } else if (base == 667) { // maybe iPhone 6
                return 0.7
            } else if (base == 568) { // maybe iPhone5(s)
                return -0.4
            } else if (base == 480) { // maybe iPhone 4S
                return -1
            }
            return -1
        } else if (number == 4) {
            if (base == 736) { // maybe iPhone 6(s) plus
                return -2.6 + 0.052 * (Double(progress) - Double(border[number]))
            } else if (base == 667) { // maybe iPhone 6
                return -2.4 + 0.05 * (Double(progress) - Double(border[number]))
            } else if (base == 568) { // maybe iPhone5(s)
                return -0.8 + 0.03 * (Double(progress) - Double(border[number]))
            } else if (base == 480) { // maybe iPhone 4S
                return -0.7 + 0.03 * (Double(progress) - Double(border[number]))
            }
            return -0.7 + 0.03 * (Double(progress) - Double(border[number]))
        } else if (number == 6) {
            if (base == 736) { return 1.3 }
            else if (base == 667) { return 1.3 }
            else if (base == 568) { return 1.6 }
            else if (base == 480) { return 1.6 }
            else { return 1.6 }
        } else  if (number == 7) {
            if (base == 736) { return 1.4 }
            else if (base == 667) { return 1.4 }
            else if (base == 568) { return 1.7 }
            else if (base == 480) { return 1.7 }
            else { return 1.7 }
        } else if (number == 8) {
            if (base == 736) { return 1.5 }
            else if (base == 667) { return 1.5 }
            else if (base == 568) { return 1.8 }
            else if (base == 480) { return 1.8 }
            else { return 1.8 }
        } else if (number == 9) {
            if (base == 736) { return 1.6 }
            else if (base == 667) { return 1.6 }
            else if (base == 568) { return 1.9 }
            else if (base == 480) { return 1.9 }
            else { return 1.9 }
        } else if (number == 10) {
            if (base == 736) { return -1.1 + 0.7 * Double(progress - border[number]) }
            else if (base == 667) { return -0.8 + 0.5 * Double(progress - border[number]) }
            else if (base == 568) { return -1.0 + 0.4 * Double(progress - border[number]) }
            else if (base == 480) { return -1.0 + 0.3 * Double(progress - border[number]) }
            else { return -1.0 + 0.3 * Double(progress - border[number]) }
        } else if (number == 11) {
            let r:Double = 100.0;
            let speed:Double = 2.0;
            if (base == 736) { return 710 + r * cos(M_PI * ((Double)(progress-border[number]) * speed) / 180.0) - (Double)(progress-border[number]) * 3.8 }
            else if (base == 667) { return 630 + r * cos(M_PI * ((Double)(progress-border[number]) * speed) / 180.0) - (Double)(progress-border[number]) * 3.2 }
            else if (base == 568) { return 480 + r * cos(M_PI * ((Double)(progress-border[number]) * speed) / 180.0) - (Double)(progress-border[number]) * 2.6 }
            else if (base == 480) { return 450 + r * cos(M_PI * ((Double)(progress-border[number]) * speed) / 180.0) - (Double)(progress-border[number]) * 2.5 }
            else { return 450 + r * cos(M_PI * ((Double)(progress-border[number]) * speed) / 180.0) - (Double)(progress-border[number]) * 2.5 }
        } else if (number == 12) {
            if (base == 736) { return 3.2 }
            else if (base == 667) { return 3.0 }
            else if (base == 568) { return 2.9 }
            else if (base == 480) { return 2.7 }
            else { return 2.7 }
        } else if (number == 13) {
            if (base == 736) { return -0.3 + 0.12 * Double(progress - border[number]); }
            else if (base == 667) { return -0.3 + 0.12 * Double(progress - border[number]); }
            else if (base == 568) { return -0.3 + 0.1 * Double(progress - border[number]); }
            else if (base == 480) { return -0.3 + 0.1 * Double(progress - border[number]); }
            else { return -0.3 + 0.1 * Double(progress - border[number]); }
        } else if (number == 14) {
            if (base == 736) { return 2.2 }
            else if (base == 667) { return 2.2 }
            else if (base == 568) { return 2.4 }
            else if (base == 480) { return 2.4 }
            else { return 2.4 }
        } else if (number == 15) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 16) {
            if (base == 736) { return -2.3 }
            else if (base == 667) { return -2.1 }
            else if (base == 568) { return -1.4 }
            else if (base == 480) { return -1.1 }
            else { return -1.1 }
        } else if (number == 17) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 18) {
            if (base == 736) { return 8.2 }
            else if (base == 667) { return 7.3 }
            else if (base == 568) { return 6.9 }
            else if (base == 480) { return 6.1 }
            else { return 6.1 }
        } else if (number == 19) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 20) {
            if (base == 736) { return -3.0 }
            else if (base == 667) { return -2.5 }
            else if (base == 568) { return -2.1 }
            else if (base == 480) { return -1.6 }
            else { return -1.6 }
        } else if (number == 21) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 22) {
            if (base == 736) { return 9.0 }
            else if (base == 667) { return 8.3 }
            else if (base == 568) { return 7.5 }
            else if (base == 480) { return 6.6 }
            else { return 6.6 }
        } else if (number == 23) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 24) {
            if (base == 736) { return -5.2 }
            else if (base == 667) { return -4.5 }
            else if (base == 568) { return -3.8 }
            else if (base == 480) { return -3.2 }
            else { return -3.2 }
        } else if (number == 25) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 26) {
            if (base == 736) { return 11.0 }
            else if (base == 667) { return 10.2 }
            else if (base == 568) { return 9.2 }
            else if (base == 480) { return 8.2 }
            else { return 8.2 }
        } else if (number == 27) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 28) {
            if (base == 736) { return -5.2 }
            else if (base == 667) { return -4.5 }
            else if (base == 568) { return -3.8 }
            else if (base == 480) { return -3.0 }
            else { return -3.0 }
        } else if (number == 29) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 30) {
            if (base == 736) { return 11.0 }
            else if (base == 667) { return 10.2 }
            else if (base == 568) { return 9.2 }
            else if (base == 480) { return 8.0 }
            else { return 8.0 }
        } else if (number == 31) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 32) {
            if (base == 736) { return -4.2 }
            else if (base == 667) { return -3.5 }
            else if (base == 568) { return -2.7 }
            else if (base == 480) { return -2.0 }
            else { return -2.0 }
        } else if (number == 33) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 34) {
            if (base == 736) { return 9.2 }
            else if (base == 667) { return 8.5 }
            else if (base == 568) { return 7.7
            }
            else if (base == 480) { return 7.0 }
            else { return 7.0 }
        } else if (number == 35) {
            if (base == 736) { return 2.5 }
            else if (base == 667) { return 2.5 }
            else if (base == 568) { return 2.5 }
            else if (base == 480) { return 2.5 }
            else { return 2.5 }
        } else if (number == 36) {
            if (base == 736) { return 20.0 }
            else if (base == 667) { return 20.0 }
            else if (base == 568) { return 20.0 }
            else if (base == 480) { return 20.0 }
            else { return 20.0 }
        }
        return 0
    }
    class func BossMove_Y(progress:Int, border:[Int], number:Int, base:CGFloat) -> Double {
        if (number == 6) {
            if (base == 736) { return 4.0 - 0.07 * (Double(progress) - Double(border[number])); }
            else if (base == 667) { return 4.0 - 0.07 * (Double(progress) - Double(border[number])); }
            else if (base == 568) { return 3.0 - 0.06 * (Double(progress) - Double(border[number])); }
            else if (base == 480) { return 3.0 - 0.06 * (Double(progress) - Double(border[number])); }
            else { 3.0 - 0.06 * (Double(progress) - Double(border[number])); }
        } else if (number == 7) {
            if (base == 736) { return -4.0 + 0.07 * (Double(progress) - Double(border[number])); }
            else if (base == 667) { return -4.0 + 0.07 * (Double(progress) - Double(border[number])); }
            else if (base == 568) { return -3.0 + 0.06 * (Double(progress) - Double(border[number])); }
            else if (base == 480) { return -3.0 + 0.06 * (Double(progress) - Double(border[number])); }
            else { return -3.0 + 0.06 * (Double(progress) - Double(border[number])); }
        } else if (number == 8) {
            if (base == 736) { return 4.0 - 0.07 * (Double(progress) - Double(border[number])); }
            else if (base == 667) { return 4.0 - 0.07 * (Double(progress) - Double(border[number])); }
            else if (base == 568) { return 3.0 - 0.06 * (Double(progress) - Double(border[number])); }
            else if (base == 480) { return 3.0 - 0.06 * (Double(progress) - Double(border[number])); }
            else { return 3.0 - 0.06 * (Double(progress) - Double(border[number])); }
        } else if (number == 9) {
            if (base == 736) { return -4.0 + 0.07 * (Double(progress) - Double(border[number])); }
            else if (base == 667) { return -4.0 + 0.07 * (Double(progress) - Double(border[number])); }
            else if (base == 568) { return -3.0 + 0.06 * (Double(progress) - Double(border[number])); }
            else if (base == 480) { return -3.0 + 0.06 * (Double(progress) - Double(border[number])); }
            else { return -3.0 + 0.06 * (Double(progress) - Double(border[number])); }
        } else if (number == 11) {
            if (base == 736) { return 220 + (-120.0 * sin(M_PI * ((Double)(progress-border[number]) * 2.2) / 180.0)); }
            else if (base == 667) { return 220 + (-120.0 * sin(M_PI * ((Double)(progress-border[number]) * 2.2) / 180.0)); }
            else if (base == 568) { return 200 + (-100.0 * sin(M_PI * ((Double)(progress-border[number]) * 2.0) / 180.0)); }
            else if (base == 480) { return 200 + (-100.0 * sin(M_PI * ((Double)(progress-border[number]) * 2.0) / 180.0)); }
            else { return 200 + (-100.0 * sin(M_PI * ((Double)(progress-border[number]) * 2.0) / 180.0)); }
        } else if (number == 12) {
            // 2.0 + obj.activeRandom!/10.0 ?
            if (base == 736) { return 160 - (145.0 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)); }
            else if (base == 667) { return 150 - (140.0 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)); }
            else if (base == 568) { return 160 - (120.0 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)); }
            else if (base == 480) { return 160 - (120.0 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)); }
            else { return 160 - (120.0 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)); }
        } else if (number == 15) {
            if (base == 736) { return 3.4 }
            else if (base == 667) { return 3.0 }
            else if (base == 568) { return 2.6 }
            else if (base == 480) { return 2.6 }
            else { return 2.6 }
        } else if (number == 17) {
            if (base == 736) { return -3.4 }
            else if (base == 667) { return -3.0 }
            else if (base == 568) { return -2.6 }
            else if (base == 480) { return -2.6 }
            else { return -2.6 }
        } else if (number == 19) {
            if (base == 736) { return 3.9 }
            else if (base == 667) { return 3.5 }
            else if (base == 568) { return 3.1 }
            else if (base == 480) { return 3.1 }
            else { return 3.1 }
        } else if (number == 21) {
            if (base == 736) { return -3.9 }
            else if (base == 667) { return -3.5 }
            else if (base == 568) { return -3.1 }
            else if (base == 480) { return -3.1 }
            else { return -3.1 }
        } else if (number == 23) {
            if (base == 736) { return 5.0 }
            else if (base == 667) { return 4.4 }
            else if (base == 568) { return 3.5 }
            else if (base == 480) { return 3.5 }
            else { return 3.5 }
        } else if (number == 25) {
            if (base == 736) { return -5.0 }
            else if (base == 667) { return -4.4 }
            else if (base == 568) { return -3.5 }
            else if (base == 480) { return -3.5 }
            else { return -3.5 }
        } else if (number == 27) {
            if (base == 736) { return 5.7 }
            else if (base == 667) { return 5.3 }
            else if (base == 568) { return 3.5 }
            else if (base == 480) { return 3.5 }
            else { return 3.5 }
        } else if (number == 29) {
            if (base == 736) { return -5.7 }
            else if (base == 667) { return -5.3 }
            else if (base == 568) { return -3.5 }
            else if (base == 480) { return -3.5 }
            else { return -3.5 }
        } else if (number == 31) {
            if (base == 736) { return 12.5 }
            else if (base == 667) { return 12.0 }
            else if (base == 568) { return 10.0 }
            else if (base == 480) { return 10.0 }
            else { return 10.0 }
        } else if (number == 32) {
            if (base == 736) { return -7.2 + 0.1 * Double(progress - border[number]); }
            else if (base == 667) { return -7.2 + 0.1 * Double(progress - border[number]); }
            else if (base == 568) { return -7.0 + 0.1 * Double(progress - border[number]); }
            else if (base == 480) { return -7.0 + 0.1 * Double(progress - border[number]); }
            else { return -7.0 + 0.1 * Double(progress - border[number]); }
        } else if (number == 33) {
            if (base == 736) { return 12.5 }
            else if (base == 667) { return 12.0 }
            else if (base == 568) { return 10.0 }
            else if (base == 480) { return 10.0 }
            else { return 10.0 }
        } else if (number == 34) {
            if (base == 736) { return -7.2 + 0.1 * Double(progress - border[number]); }
            else if (base == 667) { return -7.2 + 0.1 * Double(progress - border[number]); }
            else if (base == 568) { return -7.0 + 0.1 * Double(progress - border[number]); }
            else if (base == 480) { return -7.0 + 0.1 * Double(progress - border[number]); }
            else { return -7.0 + 0.1 * Double(progress - border[number]); }
        } else if (number == 35) {
            if (base == 736) { return 1.3 }
            else if (base == 667) { return 1.2 }
            else if (base == 568) { return 1.0 }
            else if (base == 480) { return 1.0 }
            else { return 1.0 }
        }
        return 0;
    }
    
    class func FireMove_Y(progress:Int, border:[Int], number:Int, base:CGFloat) -> Double {
        if (number == 12) {
            // 2.0 + obj.activeRandom!/10.0 ?
            if (base == 736) { return 110 - (140 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)) }
            else if (base == 667) { return 110 - (140 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)) }
            else if (base == 568) { return 120 - (120 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)) }
            else if (base == 480) { return 120 - (120 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)) }
            else { return 120 - (120 * sin(M_PI * (Double(progress-border[number])*(2.0)) / 180.0)) }
        }
        return 0
    }
    
    class func MovePattern61(base:CGFloat) -> CGFloat {
        if (base == 736) { return -13.0 }
        else if (base == 667) { return -12.0 }
        else if (base == 568) { return -11.0 }
        else if (base == 480) { return -10.0 }
        else { return -10.0 }
    }
    class func MovePattern64(progress:Int, base:CGFloat) -> CGFloat {
        if (base == 736) { return 20.0 - (CGFloat)(progress) * 0.3 }
        else if (base == 667) { return 19.0 - (CGFloat)(progress) * 0.3 }
        else if (base == 568) { return 18.0 - (CGFloat)(progress) * 0.3 }
        else if (base == 480) { return 16.0 - (CGFloat)(progress) * 0.3 }
        else { return 16.0 - (CGFloat)(progress) * 0.3 }
    }
    class func MovePattern(ii:Int?, base:CGFloat) -> CGFloat {
        if (ii == 0) {
            return 0 // no need
        } else if (ii ==  1) {
            return 300
        } else if (ii ==  2) {
            return 250
        } else if (ii ==  3) {
            return 300
        } else if (ii ==  4) {
            return base + 120
        } else if (ii ==  5) {
            return 80
        } else if (ii ==  6) {
            return base + 120
        } else if (ii ==  7) {
            return base + 120
        } else if (ii ==  8) {
            return base - 80
        } else if (ii ==  9) {
            return base - 80
        } else if (ii == 10) {
            return base + 20
        } else if (ii == 11) {
            return base + 120
        } else if (ii == 12) {
            return base - 80
        } else if (ii == 13) {
            return base - 180
        } else if (ii == 14) {
            return base - 80
        } else if (ii == 15) {
            return base - 80
        } else if (ii == 16) {
            return base - 50
        } else if (ii == 17) {
            return base - 50
        } else if (ii == 18) {
            return base - 50
        } else if (ii == 19) {
            return base - 50
        } else if (ii == 20) {
            return base - 50
        } else if (ii == 21) {
            return base - 50
        } else if (ii == 22) {
            return 150
        } else if (ii == 23) {
            return 450
        } else if (ii == 24) {
            return 0 // no need
        } else if (ii == 25) {
            return 0 // no need
        } else if (ii == 26) {
            return 0 // no need
        } else if (ii == 27) {
            return 0 // no need
        } else if (ii == 28) {
            return 0 // no need
        } else if (ii == 29) {
            return 0 // no need
        } else if (ii == 30) {
            return 0 // no need
        } else if (ii == 31) {
            return 0 // no need
        } else if (ii == 32) {
            return 0 // no need
        } else if (ii == 33) {
            return base + 20
        } else if (ii == 34) {
            return 300
        } else if (ii == 35) {
            return base + 20
        } else if (ii == 36) {
            return base + 120
        } else if (ii == 37) {
            return base + 120
        } else if (ii == 38) {
            return 0 // no need
        } else if (ii == 39) {
            return 0 // no need
        } else if (ii == 40) {
            return 0 // no need
        } else if (ii == 41) {
            return 40
        } else if (ii == 42) {
            return 110
        } else if (ii == 43) {
            return 180
        } else if (ii == 44) {
            return base + 120
        } else if (ii == 45) {
            return 0 // no need
        } else if (ii == 46) {
            return base - 80
        } else if (ii == 47) {
            return base - 30
        } else if (ii == 48) {
            return 0 // no need
        } else if (ii == 49) {
            return 0 // no need
        } else if (ii == 50) {
            return base - 30
        } else if (ii == 51) {
            return base + 20
        } else if (ii == 52) {
            return base + 20
        } else if (ii == 53) {
            return 0 // no need
        } else if (ii == 54) {
            return 300;
        } else if (ii == 55) {
            return 400;
        } else if (ii == 56) {
            return 0 // no need
        } else if (ii == 57) {
            return base + 120 // same 44
        } else if (ii == 61) {
            return base + 20 // same 33
        } else if (ii == 64) {
            return base + 20 // same 33
        } else if (ii == 14) {
            return base - 80 // same 14
        }
        return 0;
    }
}
