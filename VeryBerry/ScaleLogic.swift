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
        if (base == 736) { // maybe iPhone 6 plus
            return 0.59;
        } else if (base == 667) { // maybe iPhone 6
            return 0.56;
        } else if (base == 568) { // maybe iPhone 5S
            return 0.54;
        } else if (base == 480) { // maybe iPhone 4S
            return 0.50;
        }
        return 0.50;
    }
    class func FieldSpeed(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 0.90;
        } else if (base == 667) { // maybe iPhone 6
            return 0.85;
        } else if (base == 568) { // maybe iPhone 5S
            return 0.82;
        } else if (base == 480) { // maybe iPhone 4S
            return 0.75;
        }
        return 0.75;
    }
    class func ObjectSpeed(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 2.15;
        } else if (base == 667) { // maybe iPhone 6
            return 2.10;
        } else if (base == 568) { // maybe iPhone 5S
            return 2.05;
        } else if (base == 480) { // maybe iPhone 4S
            return 2.00;
        }
        return 2.00;
    }
    class func Gravity(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 11.76798; // * 1.20
        } else if (base == 667) { // maybe iPhone 6
            return 10.787315; // 1.10
        } else if (base == 568) { // maybe iPhone 5S
            return 9.80665;
        } else if (base == 480) { // maybe iPhone 4S
            return 9.80665;
        }
        return 9.80665;
    }
    
    // main menu
    class func LblCopyright_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 300;
        } else if (base == 667) { // maybe iPhone 6
            return 270;
        } else if (base == 568) { // maybe iPhone 5S
            return 240;
        } else if (base == 480) { // maybe iPhone 4S
            return 219;
        }
        return 219;
    }
    class func LblCopyright_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 404;
        } else if (base == 667) { // maybe iPhone 6
            return 365;
        } else if (base == 568) { // maybe iPhone 5S
            return 310;
        } else if (base == 480) { // maybe iPhone 4S
            return 310;
        }
        return 310;
    }
    
    class func RandomContinueLabel_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return base - 75
        } else if (base == 667) { // maybe iPhone 6
            return base - 66
        } else if (base == 568) { // maybe iPhone 5S
            return base - 66
        } else if (base == 480) { // maybe iPhone 4S
            return base - 66
        }
        return base - 66
    }
    class func RandomContinueLabel_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 110
        } else if (base == 667) { // maybe iPhone 6
            return 100
        } else if (base == 568) { // maybe iPhone 5S
            return 80
        } else if (base == 480) { // maybe iPhone 4S
            return 80
        }
        return base - 80
    }
    class func RandomContinueYes_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return base - 62
        } else if (base == 667) { // maybe iPhone 6
            return base - 62
        } else if (base == 568) { // maybe iPhone 5S
            return base - 62
        } else if (base == 480) { // maybe iPhone 4S
            return base - 62
        }
        return base - 62
    }
    class func RandomContinueYes_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return RandomContinueLabel_Y(base) + 40
        } else if (base == 667) { // maybe iPhone 6
            return RandomContinueLabel_Y(base) + 38
        } else if (base == 568) { // maybe iPhone 5S
            return RandomContinueLabel_Y(base) + 36
        } else if (base == 480) { // maybe iPhone 4S
            return RandomContinueLabel_Y(base) + 36
        }
        return RandomContinueLabel_Y(base) + 36
    }
    class func ImgContinueCoin_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return RandomContinueLabel_X(base) - 100
        } else if (base == 667) { // maybe iPhone 6
            return RandomContinueLabel_X(base) - 100
        } else if (base == 568) { // maybe iPhone 5S
            return RandomContinueLabel_X(base) - 110
        } else if (base == 480) { // maybe iPhone 4S
            return RandomContinueLabel_X(base) - 85
        }
        return RandomContinueLabel_X(base) - 85
    }
    class func ImgContinueCoin_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return RandomContinueLabel_Y(base) + 30;
        } else if (base == 667) { // maybe iPhone 6
            return RandomContinueLabel_Y(base) + 30;
        } else if (base == 568) { // maybe iPhone 5S
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
        if (base == 736) { // maybe iPhone 6 plus
            return ImgContinueCoin_X(base) - 10
        } else if (base == 667) { // maybe iPhone 6
            return ImgContinueCoin_X(base) - 10
        } else if (base == 568) { // maybe iPhone 5S
            return ImgContinueCoin_X(base) - 10
        } else if (base == 480) { // maybe iPhone 4S
            return ImgContinueCoin_X(base) - 10
        }
        return ImgContinueCoin_X(base) - 10
    }
    class func LblMessageForAD_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return ImgContinueCoin_Y(base) - 35
        } else if (base == 667) { // maybe iPhone 6
            return ImgContinueCoin_Y(base) - 35
        } else if (base == 568) { // maybe iPhone 5S
            return ImgContinueCoin_Y(base) - 40
        } else if (base == 480) { // maybe iPhone 4S
            return ImgContinueCoin_Y(base) - 35
        }
        return ImgContinueCoin_Y(base) - 35
        
    }

    // finish
    class func ImgFinish_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 130.0
        } else if (base == 667) { // maybe iPhone 6
            return 110.0
        } else if (base == 568) { // maybe iPhone 5S
            return 90.0
        } else if (base == 480) { // maybe iPhone 4S
            return 90.0
        }
        return 90.0
    }
    class func ImgScoreABonus_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 290.0
        } else if (base == 667) { // maybe iPhone 6
            return 284.0
        } else if (base == 568) { // maybe iPhone 5S
            return 239.0
        } else if (base == 480) { // maybe iPhone 4S
            return 190.0
        }
        return 190.0
    }
    class func ImgScoreABonus_Y(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return ImgFinish_Y(base) + 100.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgFinish_Y(base) + 90.0
        } else if (base == 568) { // maybe iPhone 5S
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
        if (base == 736) { // maybe iPhone 6 plus
            return ImgScoreABonus_Y(base) + 80.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgScoreABonus_Y(base) + 80.0
        } else if (base == 568) { // maybe iPhone 5S
            return ImgScoreABonus_Y(base) + 70.0
        } else if (base == 480) { // maybe iPhone 4S
            return ImgScoreABonus_Y(base) + 70.0
        }
        return ImgScoreABonus_Y(base) + 70.0
    }
    class func LblBonusACount_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return ImgScoreABonus_X(base) + 150.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgScoreABonus_X(base) + 120.0
        } else if (base == 568) { // maybe iPhone 5S
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
        if (base == 736) { // maybe iPhone 6 plus
            return 510.0
        } else if (base == 667) { // maybe iPhone 6
            return 470.0
        } else if (base == 568) { // maybe iPhone 5S
            return 390.0
        } else if (base == 480) { // maybe iPhone 4S
            return 320.0
        }
        return 320.0
    }
    class func MoveBorder_Back(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return 56.0
        } else if (base == 667) { // maybe iPhone 6
            return 54.0
        } else if (base == 568) { // maybe iPhone 5S
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
        if (base == 736) { // maybe iPhone 6 plus
            return 280.0
        } else if (base == 667) { // maybe iPhone 6
            return 250.0
        } else if (base == 568) { // maybe iPhone 5S
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
        if (base == 736) { // maybe iPhone 6 plus
            return 207.0
        } else if (base == 667) { // maybe iPhone 6
            return 187.5
        } else if (base == 568) { // maybe iPhone 5S
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
        if (base == 736) { // maybe iPhone 6 plus
            return 138
        } else if (base == 667) { // maybe iPhone 6
            return 125
        } else if (base == 568) { // maybe iPhone 5S
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
        if (base == 736) { // maybe iPhone 6 plus
            return ImgTotalBonusA_X(base) + 75.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgTotalBonusA_X(base) + 65.0
        } else if (base == 568) { // maybe iPhone 5S
            return ImgTotalBonusA_X(base) + 55.0
        } else if (base == 480) { // maybe iPhone 4S
            return ImgTotalBonusA_X(base) + 45.0
        }
        return ImgTotalBonusA_X(base) + 45.0
    }
    class func ImgTotalBonusB_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return LblTotalBonusA_X(base) + 85.0
        } else if (base == 667) { // maybe iPhone 6
            return LblTotalBonusA_X(base) + 75.0
        } else if (base == 568) { // maybe iPhone 5S
            return LblTotalBonusA_X(base) + 65.0
        } else if (base == 480) { // maybe iPhone 4S
            return LblTotalBonusA_X(base) + 55.0
        }
        return LblTotalBonusA_X(base) + 55.0
    }
    class func LblTotalBonusB_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return ImgTotalBonusB_X(base) + 75.0
        } else if (base == 667) { // maybe iPhone 6
            return ImgTotalBonusB_X(base) + 65.0
        } else if (base == 568) { // maybe iPhone 5S
            return ImgTotalBonusB_X(base) + 55.0
        } else if (base == 480) { // maybe iPhone 4S
            return ImgTotalBonusB_X(base) + 45.0
        }
        return ImgTotalBonusB_X(base) + 45.0
    }
    class func LblTotalScore_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return LblStage_X(base) - 130;
        } else if (base == 667) { // maybe iPhone 6
            return LblStage_X(base) - 120;
        } else if (base == 568) { // maybe iPhone 5S
            return LblStage_X(base) - 110;
        } else if (base == 480) { // maybe iPhone 4S
            return LblStage_X(base) - 100;
        }
        return LblStage_X(base) - 100;
    }
    class func LblStage_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return LblPause_X(base) - 130
        } else if (base == 667) { // maybe iPhone 6
            return LblPause_X(base) - 115
        } else if (base == 568) { // maybe iPhone 5S
            return LblPause_X(base) - 100
        } else if (base == 480) { // maybe iPhone 4S
            return LblPause_X(base) - 85
        }
        return LblPause_X(base) - 85
    }
    class func LblPause_X(base:CGFloat) -> CGFloat {
        if (base == 736) { // maybe iPhone 6 plus
            return base - 70
        } else if (base == 667) { // maybe iPhone 6
            return base - 60
        } else if (base == 568) { // maybe iPhone 5S
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
        if (base == 736) { // maybe iPhone 6 plus
            return 207.0
        } else if (base == 667) { // maybe iPhone 6
            return 187.5
        } else if (base == 568) { // maybe iPhone 5S
            return 160.0
        } else if (base == 480) { // maybe iPhone 4S
            return 160.0
        }
        return 160.0
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
        }
        return 0;
    }
}
