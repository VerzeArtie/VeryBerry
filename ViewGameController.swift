//
//  ViewGameController.swift
//  VeryBerry
//
//  Created by Summer on 2015/01/29.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion
import AudioToolbox
import GameKit

class ViewGameController: UIViewController
{
    enum gameMode {
        case modeStart, modeContinue, modeRandom, modeTutorial
    }

    @IBOutlet var lblTutorial: UILabel! = nil
    @IBOutlet var imgTotalBonusA: UIImageView! = nil
    @IBOutlet var lblBonusAScore: UILabel! = nil
    @IBOutlet var imgTotalBonusB: UIImageView! = nil
    @IBOutlet var lblBonusBScore: UILabel! = nil
    @IBOutlet var lblViewPause: UILabel! = nil
    @IBOutlet var lblPause: UILabel! = nil
    @IBOutlet var lblReady: UILabel! = nil
    @IBOutlet var lblMainMessage: UILabel! = nil
    @IBOutlet var imgCongratulations: UIImageView! = nil
    @IBOutlet var lblBonusBCount: UILabel! = nil
    @IBOutlet var lblBonusACount: UILabel! = nil
    @IBOutlet var imgScoreBonusB: UIImageView! = nil
    @IBOutlet var imgScoreBonusA: UIImageView! = nil
    @IBOutlet var imgFinish: UIImageView! = nil
    @IBOutlet var lblScore: UILabel! = nil
    @IBOutlet var lblMessage: UILabel! = nil
    @IBOutlet var lblProgress: UILabel! = nil
	@IBOutlet var lblStageNumber: UILabel! = nil
    @IBOutlet var lblStageChange: UILabel! = nil

    var firstField:Bool = false; // ゲーム開始時、一番初めのフィールドを配置するフラグ
    var currentScene:Int = 1; // 現在進行しているステージ番号 // add (ENHANCE-A)
    var currentStage:Int = 1; // 現在進行しているステージ名称番号 // add (ENHANCE-A)
    //var currentStageName:String = Database.STAGE_1; // 現在進行しているステージ名称 // delete (ENHANCE-A)
    var xepherPlayer:XepherPlayer! = nil // 音楽再生
    var mode:gameMode = gameMode.modeStart // 現在進行しているゲームモード
    var parent: ViewController! = nil // 親view
    var firstJump:Bool = false // １段ジャンプをしているかどうか
    var secondJump:Bool = false // ２段ジャンプをしているかどうか
    var gamePause:Bool = false // ゲームポーズ
    var cloudRiseLine:CGFloat = 0 // 雲にのっている時の高さ
    var gameover:Bool = false // gameoverになったことを示すフラグ
    var animeMainCharaFirstJump: [UIImage] = [] // 苺の初回ジャンプの画像
    var animeMainCharaStillJump: [UIImage] = [] // 苺のジャンプ中の画像
    var animeMainCharaEndJump: [UIImage] = [] // 苺のジャンプ終了の画像
    var animeMainCharaRunning: [UIImage] = [] // 苺の走行中の画像
    var animeMainCharaImmuneDamage: [UIImage] = [] // 苺の無敵中の画像
    var animeMainCharaFreeze: [UIImage] = [] // 苺の凍結状態の画像 // [ENHANCE-A]
    var imgBackground:UIImageView! = nil // ロール用背景１
    var imgBackground2:UIImageView! = nil // ロール用背景２
    var backgroundArray:[UIImageView]! = [] // ロール用背景リスト
    var stageNumber:Int = 1 // ステージ番号を示す値、初期値を１とする
    var _motionManager:CMMotionManager! = nil // 傾き検知
    var loopCounter:CGFloat = 0 // 背景を動かすためのループカウンタ
    var basePos_mainChara:CGRect! = nil // 地上のYライン
    var tapMainCharaMoveY:CGFloat = 0 // タップした時のジャンプ量
    var tapFallDownY:CGFloat = 0 // タップ後、下降していく時の下降量
	var repeatedTap:Int = 0; // 苺落下中に連続タップ判定 // add (ENHANCE-A)
	var detectRepeatedTapTime:Int = 0; // 苺落下中の連続タップ救済カウント値 // add (ENHANCE-A)
    var detectFieldTime:Int = 0 // 地面に着地してからどれだけ地面にいるかのカウント値（イチゴ着地アニメーションを見せるために追加）
    var progress:Int = 0 // 進行状況を示す値
    var DAMAGE:Int = 0 // 障害物
    var bonusACount:Int = 0 // ボーナスA取得数
    var stageBonusACount:Int = 0 // ステージごとのボーナスA取得数
    var bonusBCount:Int = 0 // ボーナスB取得数
    var stageBonusBCount:Int = 0 // ステージごとのボーナスB取得数
    var score:Int = 0 // スコア
    var imgMainObj:ImageObject! = nil
    var lblMainStatus:UILabel! = nil // add [ENHANCE-A]
    var imgArrowBlue:ImageObject! = nil // add [ENHANCE-A]
    var imgArrowRed:ImageObject! = nil // add [ENHANCE-A]
    var objArray:NSMutableArray! = []
    var numList:NSArray! = []

    //  random mode time
    var stageTime:Array<Int> = [];
    var speedX0Time:Array<Double> = [];
    var speedX1Time:Array<Double> = [];
    var cloudTime:Array<Int> = [];
    var birdTime:Array<Int> = [];
    var bird2Time:Array<Int> = [];
    var bigbirdTime:Array<Int> = [];
    var smallmouseTime:Array<Int> = [];
    var fallberryTime:Array<Int> = [];
    var fallberry2Time:Array<Int> = [];
    var bonusATime:Array<Int> = [];
    var bonusA2Time:Array<Int> = [];
    var bonusA3Time:Array<Int> = [];
    var bigmouseTime:Array<Int> = [];
    var fallhandTime:Array<Int> = [];
    var STAGE_DIV:Int = 100;
    
	// ランダムモードで各オブジェクトを上下交互に出すためのフラグ
	var changeBird:Bool = false
    var changeBird2:Bool = false
	var changeCloudB:Bool = false

    var ADJUST: CGFloat = 1.3;

    // チュートリアル専用フラグ
    var tutorialProgress: Int = 0
    var tutorialScore1: Int = 0
    var tutorialScore2: Int = 0
    var tutorialScore3: Int = 0

    func newAccelerometer() {

	    var imgMainObj:ImageObject! = nil
        var lblMainStatus:UILabel! = nil
        var imgArrowBlue:ImageObject! = nil
        var imgArrowRed:ImageObject! = nil
        let fieldAArray:NSMutableArray! = []
        let fieldCArray:NSMutableArray! = []
        let fieldDArray:NSMutableArray! = []
        let bonusAArray:NSMutableArray! = []
        let bonusBArray:NSMutableArray! = []
        let enemyAArray:NSMutableArray! = []
        let enemyBArray:NSMutableArray! = []
        let enemyCArray:NSMutableArray! = []
        let enemyDArray:NSMutableArray! = []
        let enemyEArray:NSMutableArray! = []
        let enemyFArray:NSMutableArray! = []
        let enemyGArray:NSMutableArray! = []
        let enemyHArray:NSMutableArray! = [] // add [ENHANCE-A]
        let enemyIArray:NSMutableArray! = [] // add [ENHANCE-A]
        let enemyJArray:NSMutableArray! = [] // add [ENHANCE-A]
        let enemyKArray:NSMutableArray! = [] // add [ENHANCE-A]
        let cloudAArray:NSMutableArray! = []
        let cloudBArray:NSMutableArray! = []
        let cloudCArray:NSMutableArray! = []
        let kintounArray:NSMutableArray! = [] // add [ENHANCE-A]
        let cloudDArray:NSMutableArray! = [] // add [ENHANCE-A]
        let objArray:NSMutableArray! = []

        if (self.imgBackground == nil)
        {
            self.imgBackground = ImageObject()
            self.view.addSubview(imgBackground)
            self.view.sendSubviewToBack(imgBackground)
        }
        if (self.imgBackground2 == nil)
        {
            self.imgBackground2 = ImageObject()
            self.view.addSubview(imgBackground2)
            self.view.sendSubviewToBack(imgBackground2)
        }
        if (self.backgroundArray.count <= 0)
        {
            self.backgroundArray.append(imgBackground)
            self.backgroundArray.append(imgBackground2)
        }
        SetupBackground()

        if (self.animeMainCharaFirstJump.count <= 0)
        {
            self.animeMainCharaFirstJump.append(self.parent.imgBerryJump02)
        }
        if (self.animeMainCharaStillJump.count <= 0)
        {
            self.animeMainCharaStillJump.append(self.parent.imgBerryJump03)
        }
        if (self.animeMainCharaEndJump.count <= 0)
        {
            self.animeMainCharaEndJump.append(self.parent.imgBerryJump04)
        }
        if (self.animeMainCharaRunning.count <= 0)
        {
            self.animeMainCharaRunning.append(self.parent.imgBerryRun01)
            self.animeMainCharaRunning.append(self.parent.imgBerryRun02)
            self.animeMainCharaRunning.append(self.parent.imgBerryRun03)
            self.animeMainCharaRunning.append(self.parent.imgBerryRun04)
            self.animeMainCharaRunning.append(self.parent.imgBerryRun05)
            self.animeMainCharaRunning.append(self.parent.imgBerryRun06)
        }
        if (self.animeMainCharaImmuneDamage.count <= 0)
        {
            self.animeMainCharaImmuneDamage.append(self.parent.imgBerryRun11)
            self.animeMainCharaImmuneDamage.append(self.parent.imgBerryRun12)
            self.animeMainCharaImmuneDamage.append(self.parent.imgBerryRun13)
            self.animeMainCharaImmuneDamage.append(self.parent.imgBerryRun14)
            self.animeMainCharaImmuneDamage.append(self.parent.imgBerryRun15)
            self.animeMainCharaImmuneDamage.append(self.parent.imgBerryRun16)
        }
        if (self.animeMainCharaFreeze.count <= 0) // add [ENHANCE-A]
        {
            self.animeMainCharaFreeze.append(self.parent.imgBerryFreeze01)
        }
        
        var FIELD_W: CGFloat = 1136; var FIELD_H:CGFloat = 50;
        var ROCK_W: CGFloat = 1136; var ROCK_H:CGFloat = 50;
        var BUSH_W: CGFloat = 200; var BUSH_H:CGFloat = 200;
        var FLOWER_W: CGFloat = 32; var FLOWER_H:CGFloat = 32;
        var SUN_W: CGFloat = 32; var SUN_H:CGFloat = 32;
        var BIRD_W: CGFloat = 32; var BIRD_H:CGFloat = 32;
        var BIGBIRD_W: CGFloat = 64; var BIGBIRD_H:CGFloat = 64;
        var BIGMOUSE_W: CGFloat = 100; var BIGMOUSE_H:CGFloat = 40;
        var EYEBIRD_W: CGFloat = 160; var EYEBIRD_H:CGFloat = 110;
        var FALLBERRY_W: CGFloat = 60; var FALLBERRY_H:CGFloat = 60;
        var FALLHAND_W: CGFloat = 80; var FALLHAND_H:CGFloat = 24;
        var SMALLMOUSE_W: CGFloat = 50; var SMALLMOUSE_H:CGFloat = 62;
        var CLOUDHAND_W: CGFloat = 100; var CLOUDHAND_H:CGFloat = 40;
        var CLOUDB_W: CGFloat = 100; var CLOUDB_H:CGFloat = 20;
        var CLOUDC_W: CGFloat = 101; var CLOUDC_H:CGFloat = 60;
        var CLOUDD_W: CGFloat = 101; var CLOUDD_H:CGFloat = 60;
        var UFO_W: CGFloat = 99; var UFO_H:CGFloat = 34; // add [ENHANCE-A]
        var UFOLIGHT_W: CGFloat = 201; var UFOLIGHT_H: CGFloat = 246; // add [ENHANCE-A]
        var BOSSBIRD_W: CGFloat = 300/*439*/; var BOSSBIRD_H: CGFloat = BOSSBIRD_W * 385 / 439/*385*/; // add [ENHANCE-A]
        var BOSSFIRE_W: CGFloat = 150/*231*/; var BOSSFIRE_H: CGFloat = BOSSFIRE_W * 195 / 231; // add [ENHANCE-A]
        var KINTOUN_W: CGFloat = 120; var KINTOUN_H: CGFloat = 50; // add [ENHANCE-A]
        var MAINOBJ_W: CGFloat = 57; var MAINOBJ_H:CGFloat = 64; var MAINOBJ_Y: CGFloat = 210;
        let MAINSTATUS_W: CGFloat = 70; let MAINSTATUS_H:CGFloat = 30
        var ARROW_BLUE_W: CGFloat = 30; var ARROW_BLUE_H:CGFloat = 30;
        var ARROW_RED_W: CGFloat = 30; var ARROW_RED_H:CGFloat = 30;
        
        if (self.parent.SCREEN_WIDTH == 736) { // maybe iPhone 6 plus
            ADJUST = 1.30; MAINOBJ_Y = 300; FIELD_W = 1500;
        } else if (self.parent.SCREEN_WIDTH == 667) { // maybe iPhone 6
            ADJUST = 1.15; MAINOBJ_Y = 265; FIELD_W = 1400;
        } else if (self.parent.SCREEN_WIDTH == 568) { // maybe iPhone 5S
            ADJUST = 1.00; MAINOBJ_Y = 210; FIELD_W = 1300;
        } else if (self.parent.SCREEN_WIDTH == 480) { // maybe iPhone 4S
            ADJUST = 1.00; MAINOBJ_Y = 210;
        }
        FIELD_W = FIELD_W*ADJUST; FIELD_H = FIELD_H*ADJUST;
        ROCK_W = ROCK_W*ADJUST; ROCK_H = ROCK_H*ADJUST;
        BUSH_W = BUSH_W*ADJUST; BUSH_H = BUSH_H*ADJUST;
        FLOWER_W = FLOWER_W*ADJUST; FLOWER_H = FLOWER_H*ADJUST;
        SUN_W = SUN_W*ADJUST; SUN_H = SUN_H*ADJUST;
        BIRD_W = BIRD_W*ADJUST; BIRD_H = BIRD_H*ADJUST;
        BIGBIRD_W = BIGBIRD_W*ADJUST; BIGBIRD_H = BIGBIRD_H*ADJUST;
        BIGMOUSE_W = BIGMOUSE_W*ADJUST; BIGMOUSE_H = BIGMOUSE_H*ADJUST;
        EYEBIRD_W = EYEBIRD_W*ADJUST; EYEBIRD_H = EYEBIRD_H*ADJUST;
        FALLBERRY_W = FALLBERRY_W*ADJUST; FALLBERRY_H = FALLBERRY_H*ADJUST;
        FALLHAND_W = FALLHAND_W*ADJUST; FALLHAND_H = FALLHAND_H*ADJUST;
        SMALLMOUSE_W = SMALLMOUSE_W*ADJUST; SMALLMOUSE_H = SMALLMOUSE_H*ADJUST;
        CLOUDHAND_W = CLOUDHAND_W*ADJUST; CLOUDHAND_H = CLOUDHAND_H*ADJUST;
        CLOUDB_W = CLOUDB_W*ADJUST; CLOUDB_H = CLOUDB_H*ADJUST;
        CLOUDC_W = CLOUDC_W*ADJUST; CLOUDC_H = CLOUDC_H*ADJUST;
        CLOUDD_W = CLOUDD_W*ADJUST; CLOUDD_H = CLOUDD_H*ADJUST;
        UFO_W = UFO_W*ADJUST; UFO_H = UFO_H*ADJUST;
        UFOLIGHT_W = UFOLIGHT_W*ADJUST; UFOLIGHT_H = UFOLIGHT_H*ADJUST;
        BOSSBIRD_W = BOSSBIRD_W*ADJUST; BOSSBIRD_H = BOSSBIRD_H*ADJUST;
        BOSSFIRE_W = BOSSFIRE_W*ADJUST; BOSSFIRE_H = BOSSFIRE_H*ADJUST;
        KINTOUN_W = KINTOUN_W*ADJUST; KINTOUN_H = KINTOUN_H*ADJUST;
        MAINOBJ_W = MAINOBJ_W*ADJUST; MAINOBJ_H = MAINOBJ_H*ADJUST;
//        MAINSTATUS_W = MAINSTATUS_W*ADJUST; MAINSTATUS_H = MAINSTATUS_H*ADJUST; // [maybe don't need adjust]
        ARROW_BLUE_W = ARROW_BLUE_W*ADJUST; ARROW_BLUE_H = ARROW_BLUE_H*ADJUST;
        ARROW_RED_W = ARROW_RED_W*ADJUST; ARROW_RED_H = ARROW_RED_H*ADJUST;

        var nameList:Array<UIImage> = []
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgFieldA_1)
        SetupObjArray(fieldAArray, num: 10, name: nameList, bonus: false, footHold: true, enemy:false, attrname: Database.NAME_FIELD, width: FIELD_W, height: FIELD_H)
        
//        nameList.removeAll(keepCapacity: false)
//        nameList.append(self.parent.imgFieldB_1)
//        SetupObjArray(fieldBArray, num: 10, name: nameList, bonus: false, footHold: true, enemy: false, attrname: Database.NAME_ROCK, width: ROCK_W, height: ROCK_H)
        
        //nameList.removeAll(keepCapacity: false)
        //nameList.append("border_red.png")
        //SetupObjArray(self.fieldCArray, num: 20, name: nameList, bonus: false, footHold: true, enemy: false, attrname: "border", width: 100, height: 20)
        
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgFieldD_1)
        nameList.append(self.parent.imgFieldD_2)
        SetupObjArray(fieldDArray, num: 10, name: nameList, bonus: false, footHold: true, enemy: false, attrname: Database.NAME_BUSH, width: BUSH_W, height: BUSH_H)
        
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgBonusA_1)
        nameList.append(self.parent.imgBonusA_2)
        SetupObjArray(bonusAArray, num: 50, name: nameList, bonus: true, footHold: false, enemy:false, attrname: Database.NAME_FLOWER, width: FLOWER_W, height: FLOWER_H)
        
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgBonusB_1)
        nameList.append(self.parent.imgBonusB_2)
        SetupObjArray(bonusBArray, num: 10, name: nameList, bonus: true, footHold: false, enemy: false, attrname: Database.NAME_SUN, width: SUN_W, height: SUN_H)
        
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgEnemyA_1)
        nameList.append(self.parent.imgEnemyA_2)
        nameList.append(self.parent.imgEnemyA_3)
        SetupObjArray(enemyAArray, num: 50, name: nameList, bonus: false, footHold: false, enemy:true, attrname: Database.NAME_BIRD, width: BIRD_W, height: BIRD_H)
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgEnemyB_1)
        nameList.append(self.parent.imgEnemyB_2)
        nameList.append(self.parent.imgEnemyB_3)
        SetupObjArray(enemyBArray, num: 40, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_BIGBIRD, width: BIGBIRD_W, height: BIGBIRD_H)
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgEnemyC_1)
        nameList.append(self.parent.imgEnemyC_2)
        SetupObjArray(enemyCArray, num: 20, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_BIGMOUSE, width: BIGMOUSE_W, height: BIGMOUSE_H)
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgEnemyD_1)
        SetupObjArray(enemyDArray, num: 10, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_EYEBIRD, width: EYEBIRD_W, height: EYEBIRD_H)
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgEnemyE_1)
        SetupObjArray(enemyEArray, num: 20, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_FALLBERRY, width: FALLBERRY_W, height: FALLBERRY_H)
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgEnemyF_1)
        SetupObjArray(enemyFArray, num: 30, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_FALLHAND, width: FALLHAND_W, height: FALLHAND_H)
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgEnemyG_1)
        nameList.append(self.parent.imgEnemyG_2)
        SetupObjArray(enemyGArray, num: 40, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_SMALLMOUSE, width: SMALLMOUSE_W, height: SMALLMOUSE_H)
        nameList.removeAll(keepCapacity: false)
        // add [ENHANCE-A]
        for (var ii = 0; ii < self.parent.imgEnemyH.count; ii++) { nameList.append(self.parent.imgEnemyH[ii]); }
        SetupObjArray(enemyHArray, num: 10, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_UFO, width: UFO_W, height: UFO_H)
        nameList.removeAll(keepCapacity: false)
        for (var ii = 0; ii < self.parent.imgEnemyI.count; ii++) { nameList.append(self.parent.imgEnemyI[ii]); }
        SetupObjArray(enemyIArray, num: 10, name: nameList, bonus: false, footHold: false, enemy: false, attrname: Database.NAME_UFOLIGHT, width: UFOLIGHT_W, height: UFOLIGHT_H)
        nameList.removeAll(keepCapacity: false)
        for (var ii = 0; ii < self.parent.imgBossBird.count; ii++) { nameList.append(self.parent.imgBossBird[ii]); }
        SetupObjArray(enemyJArray, num: 1, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_BOSS_BIRD, width: BOSSBIRD_W, height: BOSSBIRD_H)
        nameList.removeAll(keepCapacity: false)
        for (var ii = 0; ii < self.parent.imgFire.count; ii++) { nameList.append(self.parent.imgFire[ii]); }
        SetupObjArray(enemyKArray, num: 1, name: nameList, bonus: false, footHold: false, enemy: true, attrname: Database.NAME_BOSS_FIRE, width: BOSSFIRE_W, height: BOSSFIRE_H)
        // add end [ENHANCE-A]
        nameList.removeAll(keepCapacity: false)
        nameList.append(self.parent.imgCloudA_1)
        SetupObjArray(cloudAArray, num: 20, name: nameList, bonus: false, footHold: true, enemy: false, attrname: Database.NAME_CLOUDHAND, width: CLOUDHAND_W, height: CLOUDHAND_H)
        var strObj: [UIImage] = [ self.parent.imgCloudB_1, self.parent.imgCloudB_2, self.parent.imgCloudB_3, self.parent.imgCloudB_4, self.parent.imgCloudB_5, self.parent.imgCloudB_6, self.parent.imgCloudB_7 ]
        for (var ii: Int = 0; ii < 30; ii++)
        {
            nameList.removeAll(keepCapacity: false)
            nameList.append(strObj[Int(arc4random_uniform(UInt32(strObj.count)))])
            SetupObjArray(cloudBArray, num: 1, name: nameList, bonus: false, footHold: true, enemy: false, attrname: Database.NAME_CLOUDB, width: CLOUDB_W, height: CLOUDB_H)
        }
        nameList.removeAll(keepCapacity: false)
        for (var ii = 0; ii < self.parent.imgCloudC.count; ii++) { nameList.append(self.parent.imgCloudC[ii]); }
        SetupObjArray(cloudCArray, num: 40, name: nameList, bonus: false, footHold: true, enemy: false, attrname: Database.NAME_CLOUDC, width: CLOUDC_W, height: CLOUDC_H)
        // add [ENHANCE-A]
        nameList.removeAll(keepCapacity: false)
        for (var ii = 0; ii < self.parent.imgKintoun.count; ii++) { nameList.append(self.parent.imgKintoun[ii]); }
        SetupObjArray(kintounArray, num: 3, name: nameList, bonus: false, footHold: true, enemy: false, attrname: Database.NAME_KINTOUN, width: KINTOUN_W, height: KINTOUN_H)

        nameList.removeAll(keepCapacity: false)
        for (var ii = 0; ii < self.parent.imgCloudD.count; ii++) { nameList.append(self.parent.imgCloudD[ii]); }
        SetupObjArray(cloudDArray, num: 40, name: nameList, bonus: false, footHold: true, enemy: false, attrname: Database.NAME_CLOUDD, width: CLOUDD_W, height: CLOUDD_H)
        
        // add end[ENHANCE-A]
        
        if (imgMainObj == nil)
        {
            imgMainObj = ImageObject()
            imgMainObj.frame = CGRect(x: 40, y: MAINOBJ_Y, width: MAINOBJ_W, height: MAINOBJ_H)
            // アニメーションの設定
            imgMainObj.animationImages = self.animeMainCharaRunning
            imgMainObj.animationDuration = 0.5
            imgMainObj.animationRepeatCount = 0
            imgMainObj.startAnimating()
            self.view.addSubview(imgMainObj)
            self.imgMainObj = imgMainObj
        }
        // add [ENHANCE-A]
        if (lblMainStatus == nil)
        {
            lblMainStatus = UILabel()
            lblMainStatus.frame.origin = CGPoint(x: 0, y: 0)
            lblMainStatus.frame.size = CGSize(width: MAINSTATUS_W, height: MAINSTATUS_H)
            lblMainStatus.text = "sample"
            lblMainStatus.textColor = UIColor(red: 1.0, green: 0.05, blue: 0.1, alpha: 1.0)
            lblMainStatus.hidden = true
            self.view.addSubview(lblMainStatus)
            self.lblMainStatus = lblMainStatus
        }
        if (imgArrowBlue == nil)
        {
            imgArrowBlue = ImageObject()
            imgArrowBlue.frame.origin = CGPoint(x: 0, y: 0)
            imgArrowBlue.frame.size = CGSize(width: ARROW_BLUE_W, height: ARROW_BLUE_H)
            imgArrowBlue.image = self.parent.imgArrowBlue[0]
            imgArrowBlue.hidden = true
            self.view.addSubview(imgArrowBlue)
            self.imgArrowBlue = imgArrowBlue
        }
        if (imgArrowRed == nil)
        {
            imgArrowRed = ImageObject()
            imgArrowRed.frame.origin = CGPoint(x: 0, y: 100)
            imgArrowRed.frame.size = CGSize(width: ARROW_RED_W, height: ARROW_RED_H)
            imgArrowRed.image = self.parent.imgArrowRed[0]
            imgArrowRed.hidden = true
            self.view.addSubview(imgArrowRed)
            self.imgArrowRed = imgArrowRed
        }
        // add end [ENHANCE-A]
       
        self.basePos_mainChara = imgMainObj.frame
        
        if (objArray.count <= 0)
        {
            objArray.addObjectsFromArray(fieldAArray as [AnyObject])
//            objArray.addObjectsFromArray(fieldBArray)
            objArray.addObjectsFromArray(fieldCArray as [AnyObject])
            objArray.addObjectsFromArray(fieldDArray as [AnyObject])
            objArray.addObjectsFromArray(bonusAArray as [AnyObject])
            objArray.addObjectsFromArray(bonusBArray as [AnyObject])
            objArray.addObjectsFromArray(enemyAArray as [AnyObject])
            objArray.addObjectsFromArray(enemyBArray as [AnyObject])
            objArray.addObjectsFromArray(enemyCArray as [AnyObject])
            objArray.addObjectsFromArray(enemyDArray as [AnyObject])
            objArray.addObjectsFromArray(enemyEArray as [AnyObject])
            objArray.addObjectsFromArray(enemyFArray as [AnyObject])
            objArray.addObjectsFromArray(enemyGArray as [AnyObject])
            objArray.addObjectsFromArray(enemyHArray as [AnyObject]) // add [ENHANCE-A]
            objArray.addObjectsFromArray(enemyIArray as [AnyObject]) // add [ENHANCE-A]
            objArray.addObjectsFromArray(enemyJArray as [AnyObject]) // add [ENHANCE-A]
            objArray.addObjectsFromArray(enemyKArray as [AnyObject]) // add [ENHANCE-A]
            objArray.addObjectsFromArray(cloudAArray as [AnyObject])
            objArray.addObjectsFromArray(cloudBArray as [AnyObject])
            objArray.addObjectsFromArray(cloudCArray as [AnyObject]) // add [ENHANCE-A]
            objArray.addObjectsFromArray(kintounArray as [AnyObject]) // add [ENHANCE-A]
            objArray.addObjectsFromArray(cloudDArray as [AnyObject]) // add [ENHANCE-A]
            self.objArray = objArray
        }
        

        if (self.numList.count <= 0)
        {
            self.numList = [fieldAArray, fieldCArray, fieldDArray, bonusAArray, bonusBArray, enemyAArray, enemyBArray, enemyCArray, enemyDArray, enemyEArray, enemyFArray, enemyGArray, enemyHArray, enemyIArray, enemyJArray, enemyKArray, cloudAArray, cloudBArray, cloudCArray, kintounArray, cloudDArray] // change [ENHANCE-A]
        }

        // randomMode用のタイミングリストを設定
        var stageValue:Int = 0;
        var speedX0Value:Double = 0.0
        var speedX1Value:Double = 0.0
        var cloudValue:Int = 0;
        var birdValue:Int = 0;
        var bird2Value:Int = 0;
        var bigbirdValue:Int = 0;
        var smallmouseValue:Int = 0;
        var fallberryValue:Int = 0;
        var fallberry2Value:Int = 0;
        var bonusAValue:Int = 50; // initial activate
        var bonusA2Value:Int = 0;
        var bonusA3Value:Int = 0;
        var bigmouseValue:Int = 0;
        var fallhandValue:Int = 0;
        
        if (self.stageTime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                stageTime.append(stageValue);
                if (ii >= 0) { stageValue = stageTime.last! + 500 + 200 * (ii - 0); }
            }
        }
        if (self.speedX0Time.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                speedX0Time.append(speedX0Value);
                if (ii >= 0) { speedX0Value = 0.0 + 0.04 * (Double)(ii) }
            }
        }
        if (self.speedX1Time.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                speedX1Time.append(speedX1Value);
                if (ii >= 0) { speedX1Value = 0.0 + 0.06 * (Double)(ii) }
            }
        }
        if (self.cloudTime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                cloudTime.append(cloudValue);
                if (ii >= 4) { cloudValue = 210 - 2 * (ii - 4); }
            }
        }

        if (self.bonusATime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                bonusATime.append(bonusAValue);
                if (ii >= 0) { bonusAValue = 50 - 0 * (ii - 0); } // const 50
            }
        }
        
        if (self.bonusA2Time.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                bonusA2Time.append(bonusA2Value);
                if (ii >= 0) { bonusA2Value = 130 - 1 * (ii - 0); }
            }
        }
        
        if (self.bonusA3Time.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                bonusA3Time.append(bonusA3Value);
                if (ii >= 13) { bonusA3Value = 110 - 1 * (ii - 13); }
            }
        }
        
        if (self.birdTime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                birdTime.append(birdValue);
                if (ii >= 0) { birdValue = 210 -  2 * (ii - 0); }
            }
        }
        if (self.bird2Time.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                bird2Time.append(bird2Value);
                if (ii >= 28) { bird2Value = 160 -  2 * (ii - 28); }
            }
        }
        
        if (self.bigbirdTime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                bigbirdTime.append(bigbirdValue);
                if (ii >= 1) { bigbirdValue = 300 -  2 * (ii - 1); }
            }
        }
        
        if (self.smallmouseTime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                smallmouseTime.append(smallmouseValue);
                if (ii >= 5) { smallmouseValue = 230 - 2 * (ii - 5); }
            }
        }
        
        if (self.fallberryTime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                fallberryTime.append(fallberryValue);
                if (ii >= 7) { fallberryValue = 400 - 4 * (ii - 7); }
            }
        }

        if (self.fallberry2Time.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                fallberry2Time.append(fallberry2Value);
                if (ii >= 33) { fallberry2Value = 300 - 4 * (ii - 33); }
            }
        }

        if (self.bigmouseTime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                bigmouseTime.append(bigmouseValue);
                if (ii >= 10) { bigmouseValue = 500 - 5 * (ii - 10); }
            }
        }
        
        if (self.fallhandTime.count <= 0) {
            for (var ii = 0; ii < STAGE_DIV; ii++) {
                fallhandTime.append(fallhandValue);
                if (ii >= 38) { fallhandValue = 650 - 9 * (ii - 38); }
            }
        }

        self.view.bringSubviewToFront(imgMainObj)

        self.SetupGameProgress()

        self.LoadStageData(self.currentScene, stageNum: self.currentStage)

        SetupBackground()

        // 加速度検知起動
        self._motionManager = CMMotionManager() // emu no
        self._motionManager.accelerometerUpdateInterval = 0.02 // emu no
        //self.timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("DebugMethod"), userInfo: nil, repeats: true); // emu
    //} // emu

    //func DebugMethod() { // emu
    //    let imgMainObj = self.imgMainObj // emu
    //    let objArray = self.objArray // emu

    let handler:CMAccelerometerHandler = {(data:CMAccelerometerData?, error:NSError?) -> Void in // emu no
        // 条件に応じて、アニメーションを一時停止させる。
        if (self.gamePause) { return }
        if (self.gameover) { return }
        
        // ステージを配置
        self.SetupScene()
        //
        // プログラムカウンタの更新
        self.loopCounter++
        self.progress++
        
        // シーンの更新
        let BASE_SPEED: CGFloat = ScaleLogic.GameSpeed(self.parent.SCREEN_WIDTH)
        //self.lblProgress.text = "\(self.progress)"
        self.score++;
        let score = NSString(format: "%08d", self.score)
        self.lblScore.text = score as String    //"\(self.score)";
        
        // 背景を一定速度で左へ進める。
        for (var ii:Int = 0; ii < self.backgroundArray.count; ii++)
        {
            let current:UIImageView! = self.backgroundArray[ii]
            current.center = CGPoint(x:current.center.x - BASE_SPEED, y: current.center.y)
        }

        // 背景１／２を交互に前方へ移動させる。
        if (self.loopCounter >= self.imgBackground.frame.size.width / BASE_SPEED)
        {
            self.loopCounter = 0
            for (var ii:Int = 0; ii < self.backgroundArray.count; ii+=2)
            {
                let current:UIImageView! = self.backgroundArray[ii]
                let current2:UIImageView! = self.backgroundArray[ii+1]
                if (current.center.x < 0)
                {
                    self.SetupNextBackground(current2, target: current)
                }
                else if (current2.center.x < 0)
                {
                    self.SetupNextBackground(current, target: current2)
                }
            }
        }

        // 全オブジェクトの更新
        for (var ii = 0; ii < objArray.count; ii++)
        {
            let current:ImageObject = objArray[ii] as! ImageObject
            if (current.nowActive) {
                // 全オブジェクトを一定速度で左へ進める
                if (current.attr == Database.NAME_ROCK ||
                    current.attr == Database.NAME_FIELD)// ||
                    //current.attr == "cloudC")
                {
                    let adjust1:CGFloat = ScaleLogic.FieldSpeed(self.parent.SCREEN_WIDTH) + BASE_SPEED
                    current.center = CGPointMake(current.center.x-adjust1, current.center.y)
                }
                else
                {
                    let adjust1:CGFloat = ScaleLogic.ObjectSpeed(self.parent.SCREEN_WIDTH) + BASE_SPEED
                    current.center = CGPointMake(current.center.x-adjust1, current.center.y)
                }

                // 各オブジェクト固有の動作を行う。
                let currentX:CGFloat = current.center.x
                let currentY:CGFloat = current.center.y
                let detect:Bool = current.MoveUpdate(ii, base: self.parent.SCREEN_WIDTH, scaleY: self.parent.SCREEN_HEIGHT)
                // todo
                // bigbirdがsmallbirdに変換するために作られたコード。本来はクラス構築をきっちり行うべきである。
                if (detect)
                {
                    let random:Int = (Int)(arc4random() % 9) + 2;
                    self.SearchObj("enemyA").ActivateObject((Double)(currentX), y: (Double)(currentY), move: 38, activeRandomX: (Double)(random), width: 0, fixPattern: 0, fixPattern2: 0)
                    self.SearchObj("enemyA").ActivateObject((Double)(currentX), y: (Double)(currentY), move: 39, activeRandomX: (Double)(random), width: 0, fixPattern: 0, fixPattern2: 0)
                    self.SearchObj("enemyA").ActivateObject((Double)(currentX), y: (Double)(currentY), move: 40, activeRandomX: (Double)(random), width: 0, fixPattern: 0, fixPattern2: 0)
                }
            }
        }

        // UI操作: デバイスが傾いているとき、多少左右移動させる。
        if (imgMainObj.nowFreeze > 0) { // add [ENHANCE-A]
            // フリーズでは、操作不可能として、フリーズカウントを更新する。
            imgMainObj.RefreshStatus(0);
        } else {
            // 横移動 // emu no
            if (data!.acceleration.y > 0.1)
            {
                if (imgMainObj.frame.origin.x < self.basePos_mainChara.origin.x + ScaleLogic.MoveBorder_Front(self.parent.SCREEN_WIDTH))
                {
                    imgMainObj.center = CGPoint(x:imgMainObj.center.x + (CGFloat)(data!.acceleration.y*5.0), y:imgMainObj.center.y)
                }
            }
            else if (data!.acceleration.y < -0.1)
            {
                if (imgMainObj.frame.origin.x > self.basePos_mainChara.origin.x - ScaleLogic.MoveBorder_Back(self.parent.SCREEN_WIDTH))
                {
                    imgMainObj.center = CGPointMake(imgMainObj.center.x + (CGFloat)(data!.acceleration.y*6.0), imgMainObj.center.y)
                }
            }
            else
            {
                var move:CGFloat = 1.5
                if (imgMainObj.frame.origin.x > self.basePos_mainChara.origin.x)
                {
                    if (imgMainObj.frame.origin.x - self.basePos_mainChara.origin.x < 1.5)
                    {
                        move = imgMainObj.frame.origin.x - self.basePos_mainChara.origin.x
                    }
                    imgMainObj.center = CGPointMake(imgMainObj.center.x - move, imgMainObj.center.y)
                }
                else if (imgMainObj.frame.origin.x < self.basePos_mainChara.origin.x)
                {
                    if (self.basePos_mainChara.origin.x - imgMainObj.frame.origin.x < 1.5)
                    {
                        move = self.basePos_mainChara.origin.x - imgMainObj.frame.origin.x
                    }
                    imgMainObj.center = CGPointMake(imgMainObj.center.x + move, imgMainObj.center.y)
                }
            }
            
            // 縦移動（キン斗雲に乗っている時限定の操作） emu no
            if (imgMainObj.nowRiding == 1) {
                if (data!.acceleration.x > 0.1 && imgMainObj.center.y < self.parent.SCREEN_HEIGHT - 10) {
                    imgMainObj.center = CGPointMake(imgMainObj.center.x, imgMainObj.center.y + (CGFloat)(data!.acceleration.x * 7.0))
                } else if (data!.acceleration.x < -0.1 && imgMainObj.center.y > 50) {
                    imgMainObj.center = CGPointMake(imgMainObj.center.x, imgMainObj.center.y + (CGFloat)(data!.acceleration.x * 7.0))
                }
            }
        }
    
        // ジャンプ中の動作
        var shadowCloudLine:CGFloat = 0
        var detectField:Bool = false
        var detectCloud:Bool = false // 雲にのっていることを示すフラグ
        if (self.tapMainCharaMoveY > 0)
        {
            imgMainObj.animationImages = self.animeMainCharaStillJump
            imgMainObj.animationDuration = 1.0
            imgMainObj.animationRepeatCount = 0
            imgMainObj.startAnimating()

            var SPEED1:CGFloat = 10
            if (self.tapMainCharaMoveY < 55) { SPEED1 = 7 }
            if (self.tapMainCharaMoveY < 30) { SPEED1 = 3 }
            if (self.tapMainCharaMoveY < 10) { SPEED1 = 1 }
            self.tapMainCharaMoveY = self.tapMainCharaMoveY - SPEED1
            if (self.tapMainCharaMoveY < 0) {self.tapMainCharaMoveY = 0 }
            imgMainObj.center = CGPointMake(imgMainObj.center.x, imgMainObj.center.y - SPEED1)
        }
        // 足場の確認（雲含む）
        else
        {
            detectCloud = false
            // 雲などの足場に乗っている場合は、落下させないフラグを立てる(detectField)
            for (var ii = 0; ii < objArray.count; ii++)
            {
                let current:ImageObject = objArray[ii] as! ImageObject
                if ((current.isFootHold && current.hidden == false) ||
                (current.isEnemy && current.attr == Database.NAME_EYEBIRD && current.specialMove))
                {
                    var adjustOnField:CGFloat = 10
                    if (current.attr == Database.NAME_ROCK) { adjustOnField = 70 }
                    else if (current.attr == "border") { adjustOnField = 30 }
                    else if (current.attr == Database.NAME_CLOUDHAND) { adjustOnField = 20 }
                    else if (current.attr == Database.NAME_CLOUDB) { adjustOnField = 25 }
                    else if (current.attr == Database.NAME_CLOUDC) { adjustOnField = 15 }
                    else if (current.attr == Database.NAME_CLOUDD) { adjustOnField = 15 } // add [ENHANCE-A]
                    else if (current.attr == Database.NAME_EYEBIRD) { adjustOnField = 0 }
                    else if (current.attr == Database.NAME_BUSH)
                    {
                        adjustOnField = -50 // 草オブジェクト判定は、DetectObjectCurveで実施。この値には、十分な負の値を入れる。
                    }
                    
                    if ((current.frame.origin.x <= imgMainObj.center.x) &&
                        (imgMainObj.center.x <= current.frame.origin.x + current.frame.size.width) &&
                        (imgMainObj.center.y <= current.center.y) &&
                        (current.frame.origin.y - adjustOnField <= imgMainObj.center.y))
                    {
                        // add start [ENHANCE-A]
                        if (current.attr == Database.NAME_KINTOUN && current.nowRiding == 0) {
                            current.nowRiding = 1;
                            current.parentObj = imgMainObj;
                            imgMainObj.nowRiding = 1;
                        }
                        if (current.attr == Database.NAME_CLOUDD && current.maxDisappear == 0) {
                            current.maxDisappear = 20;
                            current.nowDisappear = 20;
                        }
                        // add end [ENHANCE-A]

                        self.repeatedTap = 0 // add (ENHANCE-A)
						self.detectRepeatedTapTime = 0 // add (ENHANCE-A)
                        self.tapFallDownY = 0
                        detectField = true
                        self.firstJump = false
                        self.secondJump = false
                        if (current.attr == Database.NAME_CLOUDHAND ||
                        current.attr == Database.NAME_CLOUDB ||
                        current.attr == Database.NAME_CLOUDC ||
                        current.attr == Database.NAME_CLOUDD || // add [ENHANCE-A]
                        current.attr == Database.NAME_EYEBIRD )
                        {
                            detectCloud = true
                            shadowCloudLine = self.cloudRiseLine
                            self.cloudRiseLine = current.center.y
                        }
                        break
                    }
                } else {
                    if (current.attr == Database.NAME_UFOLIGHT && current.hidden == false &&
                        self.DetectObject(current, pos: imgMainObj.center, reduceX: 20.0, reduceY: 30.0)) {
                        imgMainObj.nowFreeze = 50;
                        imgMainObj.animationImages = self.animeMainCharaFreeze
                        imgMainObj.animationDuration = 1.0
                        imgMainObj.animationRepeatCount = 0
                        imgMainObj.startAnimating()
                        break;
                    }
                }
            }
        }
        
        if (detectField)
        {
            if (self.detectFieldTime <= 5)
            {
                imgMainObj.animationImages = self.animeMainCharaEndJump
                imgMainObj.animationDuration = 1.0
                imgMainObj.animationRepeatCount = 0
                imgMainObj.startAnimating()
            }
            else if (self.detectFieldTime == 6)
            {
                imgMainObj.animationImages = self.animeMainCharaRunning
                imgMainObj.animationDuration = 0.5
                imgMainObj.animationRepeatCount = 0
                imgMainObj.startAnimating()
            }
            self.detectFieldTime++
            
            if (self.mode == gameMode.modeTutorial && self.tutorialProgress == 7) {
                self.TutorialEnd()
            }
        }

        // 地面より高い場合、落下させる。(landscapeのため、横と縦が反対となっている）
        let FALL_SPEED:CGFloat = 0.5
        if (detectField == false && self.tapMainCharaMoveY <= 0 && imgMainObj.center.y < self.parent.SCREEN_HEIGHT + 20 && imgMainObj.nowFreeze <= 0 && imgMainObj.nowRiding == 0) // change [ENHANCE-A]
        {
            //self.debug1 = false
            let P_Gravity:CGFloat = ScaleLogic.Gravity(self.parent.SCREEN_WIDTH)
            self.tapFallDownY++
            var moveY:CGFloat = self.tapFallDownY * P_Gravity * 0.016

            // 落下中、タップ連打で少しだけ宙に浮かせる。
			if (2 <= self.repeatedTap && self.repeatedTap <= 6 && self.detectRepeatedTapTime < 16) {
                self.tapFallDownY--;
                self.detectRepeatedTapTime++
                moveY = moveY * 0.1;// / (CGFloat)(self.repeatedTap))
                
                if (self.mode == gameMode.modeTutorial && self.tutorialProgress == 6 && self.repeatedTap == 6) {
                    self.tutorialScore3++;
                    if (self.tutorialScore3 >= 1) {
                        UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                            self.lblTutorial.center = CGPoint(x: -700, y: self.parent.SCREEN_HEIGHT/2)
                            }, completion: {finished in
                                self.lblTutorial.center  = CGPoint(x: 700, y: self.parent.SCREEN_HEIGHT/2)
                                self.lblTutorial.text = "Tutorial Complete! \n Let's enjoy!"
                                UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                    self.lblTutorial.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
                                    }, completion: {finished in
                                        self.tutorialProgress = 7
                                          }
                                )
                            }
                        )
                    }
                    
                }
            }

            if ((CGFloat)(self.parent.SCREEN_HEIGHT) + 20.0 - imgMainObj.center.y < FALL_SPEED)
            {
                moveY = self.parent.SCREEN_HEIGHT - imgMainObj.center.y
            }
            imgMainObj.center = CGPointMake(imgMainObj.center.x, imgMainObj.center.y + moveY)
        }

        //雲に乗っている場合、かつ、雲が縦方向に動いている場合、プレイヤーもそれに合わせて動かす。
        if (detectCloud)
        {
            if (shadowCloudLine > 0)
            {
                imgMainObj.center = CGPointMake(imgMainObj.center.x, imgMainObj.center.y + self.cloudRiseLine - shadowCloudLine );
            }
        }
        else
        {
            self.cloudRiseLine = 0;
        }

        // チュートリアル時、矢印を表示する。
        if (self.mode == gameMode.modeTutorial && self.tutorialProgress == 2) {
            self.imgArrowBlue.center = CGPoint(x: self.imgMainObj.center.x + 50, y: self.imgMainObj.center.y)
            if (self.imgMainObj.center.x >= 350) {
                self.imgArrowBlue.hidden = true
                UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.lblTutorial.center = CGPoint(x: -700, y: self.parent.SCREEN_HEIGHT/2)
                    }, completion: {finished in
                        self.lblTutorial.center  = CGPoint(x: 700, y: self.parent.SCREEN_HEIGHT/2)
                        self.lblTutorial.text = "go back the device \n go back Berry."
                        UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                            self.lblTutorial.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
                            }, completion: {finished in
                                self.tutorialProgress = 3
                            }
                        )
                        
                    }
                )
            }
        }
        if (self.mode == gameMode.modeTutorial && self.tutorialProgress == 3) {
            if (self.imgMainObj.frame.origin.x <= self.basePos_mainChara.origin.x) {
                UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.lblTutorial.center = CGPoint(x: -700, y: self.parent.SCREEN_HEIGHT/2)
                    }, completion: {finished in
                        self.lblTutorial.center  = CGPoint(x: 700, y: self.parent.SCREEN_HEIGHT/2)
                        self.lblTutorial.text = "tilt device to the left \n go behind Berry."
                        UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                            self.lblTutorial.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
                            }, completion: {finished in
                                self.tutorialProgress = 4
                                self.imgArrowRed.hidden = false
                            }
                        )
                    }
                )
            }
        }
        if (self.mode == gameMode.modeTutorial && self.tutorialProgress == 4) {
            self.imgArrowRed.center = CGPoint(x: self.imgMainObj.center.x - 50, y: self.imgMainObj.center.y)
            if (imgMainObj.frame.origin.x <= self.basePos_mainChara.origin.x - ScaleLogic.MoveBorder_Back(self.parent.SCREEN_WIDTH)) {
                self.imgArrowRed.hidden = true
                UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.lblTutorial.center = CGPoint(x: -700, y: self.parent.SCREEN_HEIGHT/2)
                    }, completion: {finished in
                        self.lblTutorial.center  = CGPoint(x: 700, y: self.parent.SCREEN_HEIGHT/2)
                        self.lblTutorial.text = "double touch in timely \n double jump Berry!"
                        UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                            self.lblTutorial.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
                            }, completion: {finished in
                                self.tutorialProgress = 5
                            }
                        )
                    }
                )
            }
        }

        // 画面下部に落ちた場合、即死とする。
        if (imgMainObj.center.y > self.parent.SCREEN_HEIGHT + 5 )
        {
            // emu no
            self.DAMAGE = 1000
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            self.GameOver(imgMainObj)
            return
        }
            
            // 当たり判定 emu no
            for (var ii:Int = 0; ii < objArray.count; ii++)
            {
                let current:ImageObject = objArray[ii] as! ImageObject
                if (current.hidden == false)
                {
                    if (current.isFootHold && current.attr == Database.NAME_BUSH)
                    {
                        let baseLine_Y:CGFloat = 267
                        var diff:Double = 0.0
                        if (self.DetectObjectCurve(imgMainObj, target: current, reduce: 0, diff:&diff)) {
                            if (diff < 0)
                            {
                                if (baseLine_Y - imgMainObj.center.y <= 0)
                                {
                                    diff = 0
                                }
                                else if (diff < -1 * Double(FALL_SPEED))
                                {
                                    diff = 0
                                }
                                else if (imgMainObj.center.y - CGFloat(diff) > baseLine_Y) // over fall_speedより前で判定してはいけない。
                                {
                                    diff =  Double(imgMainObj.center.y - baseLine_Y)
                                }
                            }
                            if (self.tapMainCharaMoveY <= 0)
                            {
                                if (self.firstJump || self.secondJump)
                                {
                                    imgMainObj.animationImages = self.animeMainCharaRunning
                                    imgMainObj.animationDuration = 0.5
                                    imgMainObj.animationRepeatCount = 0
                                    imgMainObj.startAnimating()
                                }

                                self.firstJump = false
                                self.secondJump = false
                            }
                            imgMainObj.center = CGPointMake(imgMainObj.center.x, imgMainObj.center.y - CGFloat(diff))
                        }
                        
                        //return; // bush判定は位置を補正するだけであり、敵のあたり判定やボーナス取得は継続して判定する。
                    }
                    if (current.isEnemy)
                    {
                        var reduceValue:CGFloat = 3
                        if (current.attr == Database.NAME_BIGMOUSE)
                        {
                            reduceValue = 1;
                        } else if (current.attr == Database.NAME_BOSS_FIRE)
                        {
                            reduceValue = 10;
                        }
                        
                        if (current.attr == Database.NAME_EYEBIRD)
                        {
                            let direction:Int = self.DetectObjectDirection(imgMainObj, target: current, reduce: 5)
                            if (direction == -1)
                            {
                                // 「当たってない」は何もしない
                            }
                            else if (4 <= direction && direction <= 7)
                            {
                                // 「下当たり」はダメージ
                                self.DAMAGE = 20
                                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                                self.GameOver(imgMainObj)
                                return
                            }
                            else if (0 <= direction && direction <= 3 && current.specialMove == false)
                            {
                                // 「上当たり」乗っかれる
                                current.specialMove = true
                                
                                // イチゴちゃんを無敵モードにする。
                                if (imgMainObj.immuneDamage <= 0)
                                {
                                    var imageEnemyD:[UIImage] = []
                                    imageEnemyD.append(UIImage(named: "eye_bird_reverse.png")!)
                                    current.stopAnimating()
                                    current.animationImages = imageEnemyD
                                    current.animationDuration = 1.0
                                    current.animationRepeatCount = 0
                                    current.sizeToFit()
                                    current.startAnimating()
                                    current.frame = CGRectMake(current.frame.origin.x, current.frame.origin.y, 160, 110)

                                    self.xepherPlayer.PlayMusic("muteki", ext: "wav")
                                    imgMainObj.immuneDamage = 250
                                }
                            }
                        } else if ((current.attr == Database.NAME_BOSS_BIRD) && (self.DetectObjectBoss(current, pos: imgMainObj.center)) ||
                                   ((current.attr != Database.NAME_BOSS_BIRD) && (self.DetectObject(current, pos: imgMainObj.center, reduce: reduceValue)))
                                )
                        {
                            current.MoveToDefault()
                            if (imgMainObj.immuneDamage <= 0) // 無敵モードでなければダメージを受ける。
                            {
                                self.DAMAGE = 1000
                                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                                self.GameOver(imgMainObj)
                            }
                            return
                        }
                    }
                    if (current.isBonus)
                    {
                        if (self.DetectObject(imgMainObj, pos: current.center, reduce: 2))
                        {
                            self.GetBonus(current)
                            return
                        }
                    }
                }
            }
        
            // 無敵モード更新
            if (imgMainObj.immuneDamage > 0)
            {
                imgMainObj.immuneDamage--
                if (imgMainObj.immuneDamage <= 0)
                {
                    self.xepherPlayer.PlayMusic("VB\(self.currentScene)", ext: "wav")
                    imgMainObj.animationImages = self.animeMainCharaRunning
                    imgMainObj.animationDuration = 0.5
                    imgMainObj.animationRepeatCount = 0
                    imgMainObj.startAnimating()
                }
                else if (imgMainObj.immuneDamage >= 190)
                {
                    imgMainObj.animationImages = self.animeMainCharaImmuneDamage
                    imgMainObj.animationDuration = 0.3
                    imgMainObj.animationRepeatCount = 0
                    imgMainObj.startAnimating()
                }
            }
        } // emu

        //取得開始
        self._motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: handler) // emu
    }

    func GameProgress() {
    }

    // add start [ENHANCE-A]
    func TutorialEnd() {
        self.xepherPlayer.StopMusic()
        self.gameover = true
        self.parent.SetupObjectLayout()
    }
    // add end [ENHANCE-A]
    
    func GameEnd() {
        self.xepherPlayer.StopMusic()
        
        self.gameover = true

        self.parent.updateHighScore = self.score;
        if (self.mode == gameMode.modeRandom) {
            self.parent.updateHighScoreAdditional = "Random";
            let randomStageNum:Int = GetRandomStageNumber(self.progress)
            self.parent.UpdateSaveDataForRandom(self.score, bonusA: self.bonusACount, bonusB: self.bonusBCount, randomStageNumber: randomStageNum, scene: self.currentScene) // change [ENHANCE-A]
        } else {
            self.parent.updateHighScoreAdditional = "";
            self.parent.UpdateSaveData(self.score, bonusA: self.bonusACount, bonusB: self.bonusBCount, scene: self.currentScene) // change [ENHANCE-A]
            self.parent.UpdateBackgroundImage()
        }
        self.lblMainMessage.text = Database.CLEAR_MESSAGE_1;
        if (self.currentScene == 2) {
            self.lblMainMessage.text = Database.CLEAR_MESSAGE_2;
        }
        self.view.bringSubviewToFront(self.lblMainMessage)
        self.lblMainMessage.hidden = false
        if (self._motionManager.accelerometerActive)
        {
            self._motionManager.stopAccelerometerUpdates()
        }
        self.parent.SetupObjectLayout()
    }
    func GameOver(imgMainObj:ImageObject) {
        self.xepherPlayer.StopMusic()
        self.xepherPlayer.PlaySound("end")
    
        self.gameover = true

        self.parent.updateHighScore = self.score;
        if (self.mode == gameMode.modeRandom) {
            self.parent.updateHighScoreAdditional = "Random";
            let randomStageNum:Int = GetRandomStageNumber(self.progress)
            self.parent.UpdateSaveDataForRandom(self.score, bonusA: self.bonusACount, bonusB:self.bonusBCount, randomStageNumber:randomStageNum, scene: self.currentScene) // change [ENHANCE-A]
        } else {
            self.parent.updateHighScoreAdditional = "";
            self.parent.UpdateSaveData(self.score, bonusA: self.bonusACount, bonusB: self.bonusBCount, scene: self.currentScene) // change [ENHANCE-A]
        }
        self.view.bringSubviewToFront(self.lblMessage)
        self.lblMessage.hidden = false
        if (self._motionManager.accelerometerActive)
        {
            self._motionManager.stopAccelerometerUpdates()
        }
        
        var imageArray: [UIImage] = []
        imageArray.append(UIImage(named: "berry_run01.png")!)
        imgMainObj.animationImages = imageArray
        imgMainObj.animationDuration = 0.5
        imgMainObj.animationRepeatCount = 0
        imgMainObj.startAnimating()
    }
    
    func SetupBackground()
    {
        for (var ii:Int = 0; ii < self.backgroundArray.count; ii++)
        {
            let current:UIImageView = backgroundArray[ii] as UIImageView
            if (self.currentScene == 2) {
                current.image = self.parent.imgBackground02
            } else {
                current.image = self.parent.imgBackground01
            }
            current.frame = CGRect(x: 0, y: 0, width: parent.SCREEN_WIDTH, height: parent.SCREEN_HEIGHT)
        }

        for (var ii:Int = 0; ii < self.backgroundArray.count; ii+=2)
        {
            let current:UIImageView = backgroundArray[ii] as UIImageView
            let current2:UIImageView = backgroundArray[ii+1] as UIImageView
            SetupNextBackground(current, target: current2)
        }
    }
    func SetupNextBackground(src:UIView, target:UIView)
    {
        target.center = CGPoint(x:src.center.x + src.frame.size.width, y:src.center.y)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.xepherPlayer == nil)
        {
            self.xepherPlayer = XepherPlayer()
        }
        self.xepherPlayer.PlayMusic("VB\(self.currentScene)", ext: "wav")
        
        newAccelerometer()
    }
    override func viewDidLayoutSubviews() {
        self.imgFinish.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: ScaleLogic.ImgFinish_Y(self.parent.SCREEN_WIDTH))
        self.imgCongratulations.center = CGPoint(x: ScaleLogic.ImgCongratulations_X(self.parent.SCREEN_WIDTH), y: ScaleLogic.ImgCongratulations_Y(self.parent.SCREEN_WIDTH))
        self.lblMessage.center = CGPoint(x: ScaleLogic.LblMessage_X(self.parent.SCREEN_WIDTH), y: ScaleLogic.LblMessage_Y(self.parent.SCREEN_WIDTH))
        self.lblMainMessage.center = CGPoint(x: ScaleLogic.LblMainMessage_X(self.parent.SCREEN_WIDTH), y: ScaleLogic.LblMainMessage_Y(self.parent.SCREEN_WIDTH))
        self.imgScoreBonusA.center = CGPoint(x: ScaleLogic.ImgScoreABonus_X(self.parent.SCREEN_WIDTH), y: ScaleLogic.ImgScoreABonus_Y(self.parent.SCREEN_WIDTH))
        self.imgScoreBonusB.center = CGPoint(x: ScaleLogic.ImgScoreBBonus_X(self.parent.SCREEN_WIDTH), y: ScaleLogic.ImgScoreBBonus_Y(self.parent.SCREEN_WIDTH))
        self.lblBonusACount.center = CGPoint(x: ScaleLogic.LblBonusACount_X(self.parent.SCREEN_WIDTH), y: ScaleLogic.LblBonusACount_Y(self.parent.SCREEN_WIDTH))
        self.lblBonusBCount.center = CGPoint(x: ScaleLogic.LblBonusBCount_X(self.parent.SCREEN_WIDTH), y: ScaleLogic.LblBonusBCount_Y(self.parent.SCREEN_WIDTH))
        self.lblReady.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
        self.imgTotalBonusA.center = CGPoint(x: ScaleLogic.ImgTotalBonusA_X(self.parent.SCREEN_WIDTH), y: 35);
        self.lblBonusAScore.center = CGPoint(x: ScaleLogic.LblTotalBonusA_X(self.parent.SCREEN_WIDTH), y: 35);
        self.imgTotalBonusB.center = CGPoint(x: ScaleLogic.ImgTotalBonusB_X(self.parent.SCREEN_WIDTH), y: 35);
        self.lblBonusBScore.center = CGPoint(x: ScaleLogic.LblTotalBonusB_X(self.parent.SCREEN_WIDTH), y: 35);
        self.lblScore.center = CGPoint(x: ScaleLogic.LblTotalScore_X(self.parent.SCREEN_WIDTH), y: 35);
        self.lblStageNumber.center = CGPoint(x: ScaleLogic.LblStage_X(self.parent.SCREEN_WIDTH), y: 35);
        self.lblPause.center = CGPoint(x: ScaleLogic.LblPause_X(self.parent.SCREEN_WIDTH), y: 35)
        self.lblViewPause.center = CGPoint(x: ScaleLogic.LblViewPause_X(self.parent.SCREEN_WIDTH), y: ScaleLogic.LblViewPause_Y(self.parent.SCREEN_WIDTH))
    }
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent?) {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if (self.gameover == true)
        {
            if (self._motionManager.accelerometerActive)
            {
                self._motionManager.stopAccelerometerUpdates()
            }
            self.parent.GetSaveData()
            self.parent.GetSaveDataForRandom()
            dismissViewControllerAnimated(true, completion: nil)
        }
        else
        {
            let touch:UITouch = touches.first!
            let pos: CGPoint = touch.locationInView(self.view)
            if (self.DetectObject(self.lblPause, pos: pos, reduce: 0))
            {
                if (gamePause == false)
                {
                    self.xepherPlayer.StopMusic()
                }
                else
                {
                    self.xepherPlayer.PlayMusic("VB\(self.currentScene)", ext: "wav")
                }
                gamePause = !gamePause
                self.lblViewPause.hidden = !self.lblViewPause.hidden
                return
            }
            
            // ポーズ中であれば、どの箇所を謳歌してもポーズ解除とする。
            else if (gamePause)
            {
                self.xepherPlayer.PlayMusic("VB\(self.currentScene)", ext: "wav")
                self.gamePause = false
                self.lblViewPause.hidden = true
                return
            }
            
            // タップの場所に限らず、ジャンプ可能とする。
            if (true) // [self DetectObject:_imgMainChara :pos :0])
            {
                if (self.tapMainCharaMoveY <= 0)
                {
                    var jumptime:CGFloat = 80
                    if (self.parent.SCREEN_WIDTH == 736) { // maybe iPhone 6 plus
                        jumptime = 100;
                    } else if (self.parent.SCREEN_WIDTH == 667) { // maybe iPhone 6
                        jumptime = 90;
                    } else if (self.parent.SCREEN_WIDTH == 568) { // maybe iPhone 5S
                        jumptime = 80;
                    } else if (self.parent.SCREEN_WIDTH == 480) { // maybe iPhone 4S
                        jumptime = 80;
                    }
                    if (self.firstJump == false)
                    {
                        if (self.mode == gameMode.modeTutorial && self.tutorialProgress == 1) {
                            self.lblMainStatus.frame.origin = CGPoint(x: imgMainObj.center.x + 3, y: imgMainObj.center.y - 30)
                            self.lblMainStatus.text = "Good";
                            self.tutorialScore1++;
                            self.lblTutorial.text = "touch the screen \n jump Berry! \(self.tutorialScore1)"
                            self.lblMainStatus.hidden = false;
                            UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                self.lblMainStatus.center = CGPoint(x: self.lblMainStatus.center.x, y: self.lblMainStatus.center.y - 50)
                                }, completion: {finished in
                                    self.lblMainStatus.hidden = true;
                                }
                            )
                            
                            if (self.tutorialScore1 >= 3) {
                                UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                    self.lblTutorial.center = CGPoint(x: -700, y: self.parent.SCREEN_HEIGHT/2)
                                    }, completion: {finished in
                                        //self.lblTutorial.hidden = true;
                                        self.lblTutorial.center  = CGPoint(x: 700, y: self.parent.SCREEN_HEIGHT/2)
                                        self.lblTutorial.text = "tilt device to the right \n go forward Berry!"
                                        //self.lblTutorial.hidden = false;
                                        UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                            self.lblTutorial.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
                                            }, completion: {finished in
                                                self.tutorialProgress = 2
                                                self.imgArrowBlue.hidden = false
                                            }
                                        )
                                    }
                                )
                            }
                        }
                        
                        self.firstJump = true
                        self.xepherPlayer.PlaySound("tobu1")
                        self.StartJump(imgMainObj, jumptime:jumptime)
                    }
                    else if (secondJump == false)
                    {
	                    // セカンドジャンプはジャンプ頂点近辺でのみ可能とする。
                        if ((self.tapMainCharaMoveY <= 15 && self.tapFallDownY <= 0) ||
                            (self.tapMainCharaMoveY <= 0 && self.tapFallDownY <= 15))
                        {
                            if (self.mode == gameMode.modeTutorial && self.tutorialProgress == 5) {
                                self.lblMainStatus.frame.origin = CGPoint(x: imgMainObj.center.x + 3, y: imgMainObj.center.y - 30)
                                self.lblMainStatus.text = "Great";
                                self.tutorialScore2++;
                                self.lblTutorial.text = "double touch in timely \n double jump Berry! \(self.tutorialScore2)"
                                self.lblMainStatus.hidden = false;
                                UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                    self.lblMainStatus.center = CGPoint(x: self.lblMainStatus.center.x, y: self.lblMainStatus.center.y - 50)
                                    }, completion: {finished in
                                        self.lblMainStatus.hidden = true;
                                    }
                                )
                                
                                if (self.tutorialScore2 >= 2) {
                                    UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                        self.lblTutorial.center = CGPoint(x: -700, y: self.parent.SCREEN_HEIGHT/2)
                                        }, completion: {finished in
                                            self.lblTutorial.center  = CGPoint(x: 700, y: self.parent.SCREEN_HEIGHT/2)
                                            self.lblTutorial.text = "tap repeatedly while jumping \n stay in air Berry!"
                                            UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                                self.lblTutorial.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
                                                }, completion: {finished in
                                                    self.tutorialProgress = 6
                                                }
                                            )
                                        }
                                    )
                                }
                            }
                            
                            self.secondJump = true
                            self.xepherPlayer.PlaySound("tobu2")
                            self.StartJump(imgMainObj, jumptime:jumptime)
						// 落下中、タップ連打判定
                        } else if (self.tapFallDownY > 15 && self.repeatedTap < 10) { // add (ENHANCE-A)
							self.repeatedTap++;
							self.detectRepeatedTapTime = 0;
						}
                    }
                    else
                    {
                        // ３段ジャンプはさせない（何もしない）

						// 落下中、タップ連打判定
						if (self.tapFallDownY > 15 && self.repeatedTap < 10) { // add (ENHANCE-A)
							self.repeatedTap++;
							self.detectRepeatedTapTime = 0;
						}
                    }
                }
            }
        }
    }
    
    func StartJump(imgMainObj:ImageObject, jumptime: CGFloat) {
		self.repeatedTap = 0 // add (ENHANCE-A)
		self.detectRepeatedTapTime = 0 // add (ENHANCE-A)
        self.tapFallDownY = 0
        self.detectFieldTime = 0
        self.tapMainCharaMoveY = jumptime
        imgMainObj.animationImages = self.animeMainCharaFirstJump
        imgMainObj.animationDuration = 0.05
        imgMainObj.animationRepeatCount = 1
        imgMainObj.startAnimating()
    }

    var objectList:AnyObject? = nil
    func LoadStageData(sceneNum: Int, stageNum: Int) {
        let filePath = NSBundle.mainBundle().pathForResource("StageData\(sceneNum).plist", ofType:nil )
        let rootRealPList = NSDictionary(contentsOfFile:filePath!)
        self.objectList = rootRealPList?.valueForKey("Stage\(stageNum)")
    }
    
    var timer:NSTimer!

    var readyCount:Int = 0;
    func UpdateReady()
    {
        self.lblReady.hidden = !self.lblReady.hidden;
        self.readyCount++;
        if (self.readyCount < 8)
        {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("UpdateReady"), userInfo: nil, repeats: false);
        }
    }
 
    func GetRandomStageNumber(let value:Int) -> Int
    {
        var div:Int = 0
        for (var ii = 0; ii < STAGE_DIV-1; ii++) {
            if (stageTime[ii] <= value && value < stageTime[ii+1]) {
                div = ii;
                return div;
            }
        }
        return STAGE_DIV;
    }
    
    func SetupScene() {
        let FIELD_LEN:Int = 908
        let INITIAL_X:Double = 800.0
        var y:Double = 310.0
        
        if (self.parent.SCREEN_WIDTH == 736) { // maybe iPhone 6 plus
            y = 395;
        } else if (self.parent.SCREEN_WIDTH == 667) { // maybe iPhone 6
            y = 365;
        } else if (self.parent.SCREEN_WIDTH == 568) { // maybe iPhone 5S
            y = 310;
        } else if (self.parent.SCREEN_WIDTH == 480) { // maybe iPhone 4S
            y = 310;
        }

        // 一番初めはフィールドを配置する。
        if (self.firstField == false)
        {
            self.firstField = true;
            if (self.currentScene == 2) {
                for (var ii:Double = 0; ii < 8; ii++) {
                    SearchObj("cloudC").ActivateObject(80*ii, y: y, move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
                }
            } else {
                SearchObj("field").ActivateObject(0, y: y, move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
            }
            
            if (self.mode == gameMode.modeRandom) {
                SearchObj("field").ActivateObject(1136, y: y, move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
            }
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("UpdateReady"), userInfo: nil, repeats: false);
        }

        // 通常モード
        if (self.mode != gameMode.modeRandom)
        {
            let existKey: AnyObject? = self.objectList?.valueForKey("\(self.progress)")
            for (var ii: Int = 0; ii < existKey?.count; ii++)
            {
                let keyNum: AnyObject? = existKey?.valueForKey("\(ii)")
                let name: String = keyNum?.valueForKey("name") as! String
                
                var dx: Double = 0.0
                let keyDx = (keyNum?.valueForKey("x") as? NSString)
                if (keyDx != nil) { dx = keyDx!.doubleValue + INITIAL_X }

                var dy: Double = 0.0
                let keyDy = (keyNum?.valueForKey("y") as? NSString)
                if (keyDy != nil) { dy = keyDy!.doubleValue }
                if (self.parent.SCREEN_WIDTH == 736) { // maybe iPhone 6 plus
                    dy = dy * 1.20
                } else if (self.parent.SCREEN_WIDTH == 667) { // maybe iPhone 6
                    dy = dy * 1.10
                } else if (self.parent.SCREEN_WIDTH == 568) { // maybe iPhone 5S
                    dy = dy * 1.00
                } else if (self.parent.SCREEN_WIDTH == 480) { // maybe iPhone 4S
                    dy = dy * 1.00
                }
                
                var move: Int = 0
                let keyMove = (keyNum?.valueForKey("move") as? NSString)
                if (keyMove != nil) { move = keyMove!.integerValue }
                
                var random: Double = 0
                let keyRandom = (keyNum?.valueForKey("random") as? NSString)
                if (keyRandom != nil) { random = keyRandom!.doubleValue }
                if (random > 0)
                {
                    random = Double(arc4random() % UInt32(random))
                    dy = dy + Double(random)
                }

                var randomX: Double = 0
                let keyRandomX = (keyNum?.valueForKey("randomX") as? NSString)
                if (keyRandomX != nil) { randomX = keyRandomX!.doubleValue }
                if (randomX > 0)
                {
                    randomX = Double(arc4random() % UInt32(randomX)) - randomX/2.0
                    dx = dx - randomX
                }
                
                var activeRandom: Double = 0
                let keyActiveRandom = (keyNum?.valueForKey("activeRandom") as? NSString)
                if (keyActiveRandom != nil) { activeRandom = keyActiveRandom!.doubleValue }
                if (activeRandom > 0)
                {
                    activeRandom = Double(arc4random() % UInt32(activeRandom)) - activeRandom/2.0
                }
                
                var width: Int = 0
                let keyWidth: String? = (keyNum?.valueForKey("width") as? String)
                if (keyWidth != nil) { width = Int(keyWidth!)! }
                
                var fixPattern: Double = 0.0
                let keyFixPattern = keyNum?.valueForKey("fixPattern") as? NSString
                if (keyFixPattern != nil) { fixPattern = keyFixPattern!.doubleValue }
                
                var fixPattern2: Double = 0.0
                let keyFixPattern2 = keyNum?.valueForKey("fixPattern2") as? NSString
                if (keyFixPattern2 != nil) { fixPattern2 = keyFixPattern2!.doubleValue }
            
                var hiddenFirst: Bool = false
                let keyHiddenFirst = keyNum?.valueForKey("hiddenFirst") as? NSString
                if (keyHiddenFirst != nil) { hiddenFirst = keyHiddenFirst!.boolValue }
                
                SearchObj(name).ActivateObject(dx, y: y-dy, move: move, activeRandomX: activeRandom, width: width, fixPattern: fixPattern, fixPattern2: fixPattern2, hiddenFirst:hiddenFirst)
            }
            
            
            // コンティニュー中継ポイント判定と
			// 現在のステージ情報を表示
            if (self.currentScene == 2) {
                for (var ii = 0; ii < Database.PROGRESS_2_1.count; ii++) {
                    if (self.progress == Database.PROGRESS_2_1[ii]) { self.parent.progressStage2_1[ii] = 1 }
                }

                var temp = "[HVN] \(self.currentStage)-1"
                for (var ii = Database.PROGRESS_2_1.count-1; ii >= 0; ii--) {
                    if (self.progress >= Database.PROGRESS_2_1[ii]) {
                        temp = "[HVN] \(self.currentStage)-\(ii+2)"; break;
                    }
                }
                self.lblStageNumber.text = temp;
            } else if (self.currentScene == 0) {
                self.lblStageNumber.text = "Tutorial"
            } else {
                if (self.currentStage == 1) // change (ENHANCE-A)
                {
                    if (self.progress == Database.PROGRESS_1_1_1) { self.parent.progressStage1_1_1 = 1 }
                    else if (self.progress == Database.PROGRESS_1_1_2) { self.parent.progressStage1_1_2 = 1 }
                    else if (self.progress == Database.PROGRESS_1_1_3) { self.parent.progressStage1_1_3 = 1 }
                    
                    if (self.progress >= Database.PROGRESS_1_1_3) { self.lblStageNumber.text = "Stage 1-4"; }
                    else if (self.progress >= Database.PROGRESS_1_1_2) { self.lblStageNumber.text = "Stage 1-3"; }
                    else if (self.progress >= Database.PROGRESS_1_1_1) { self.lblStageNumber.text = "Stage 1-2"; }
                    else { self.lblStageNumber.text = "Stage 1-1"; }
                }
                else if (self.currentStage == 2) // change (ENHANCE-A)
                {
                    if (self.progress == Database.PROGRESS_1_2_1) { self.parent.progressStage1_2_1 = 1 }
                    else if (self.progress == Database.PROGRESS_1_2_2) { self.parent.progressStage1_2_2 = 1 }
                    else if (self.progress == Database.PROGRESS_1_2_3) { self.parent.progressStage1_2_3 = 1 }
                    
                    if (self.progress >= Database.PROGRESS_1_2_3) { self.lblStageNumber.text = "Stage 2-4"; }
                    else if (self.progress >= Database.PROGRESS_1_2_2) { self.lblStageNumber.text = "Stage 2-3"; }
                    else if (self.progress >= Database.PROGRESS_1_2_1) { self.lblStageNumber.text = "Stage 2-2"; }
                    else { self.lblStageNumber.text = "Stage 2-1"; }
                }
                else if (self.currentStage == 3) // change (ENHANCE-A)
                {
                    if (self.progress == Database.PROGRESS_1_3_1) { self.parent.progressStage1_3_1 = 1 }
                    else if (self.progress == Database.PROGRESS_1_3_2) { self.parent.progressStage1_3_2 = 1 }
                    else if (self.progress == Database.PROGRESS_1_3_3) { self.parent.progressStage1_3_3 = 1 }
                    
                    if (self.progress >= Database.PROGRESS_1_3_3) { self.lblStageNumber.text = "Stage 3-4"; }
                    else if (self.progress >= Database.PROGRESS_1_3_2) { self.lblStageNumber.text = "Stage 3-3"; }
                    else if (self.progress >= Database.PROGRESS_1_3_1) { self.lblStageNumber.text = "Stage 3-2"; }
                    else { self.lblStageNumber.text = "Stage 3-1"; }
                }
                else if (self.currentStage == 4) // change (ENHANCE-A)
                {
                    if (self.progress == Database.PROGRESS_1_4_1) { self.parent.progressStage1_4_1 = 1 }
                    else if (self.progress == Database.PROGRESS_1_4_2) { self.parent.progressStage1_4_2 = 1 }
                    else if (self.progress == Database.PROGRESS_1_4_3) { self.parent.progressStage1_4_3 = 1 }
                    else if (self.progress == Database.PROGRESS_1_4_4) { self.parent.progressStage1_4_4 = 1 }
                        //else if (self.progress == Database.PROGRESS_1_4_5) { self.parent.progressStage1_4_5 = 1 } // delete 2015/05/20
                        
                        //if (self.progress >= Database.PROGRESS_1_4_5) { self.lblStageNumber.text = "Stage 4-6"; } // delete 2015/05/20
                    else if (self.progress >= Database.PROGRESS_1_4_4) { self.lblStageNumber.text = "Stage 4-5"; }
                    else if (self.progress >= Database.PROGRESS_1_4_3) { self.lblStageNumber.text = "Stage 4-4"; }
                    else if (self.progress >= Database.PROGRESS_1_4_2) { self.lblStageNumber.text = "Stage 4-3"; }
                    else if (self.progress >= Database.PROGRESS_1_4_1) { self.lblStageNumber.text = "Stage 4-2"; }
                    else { self.lblStageNumber.text = "Stage 4-1"; }
                }
                else if (self.currentStage == 5) // change (ENHANCE-A)
                {
                    if (self.progress == Database.PROGRESS_1_5_1) { self.parent.progressStage1_5_1 = 1 }
                    else if (self.progress == Database.PROGRESS_1_5_2) { self.parent.progressStage1_5_2 = 1 }
                    else if (self.progress == Database.PROGRESS_1_5_3) { self.parent.progressStage1_5_3 = 1 }
                    
                    if (self.progress >= Database.PROGRESS_1_5_3) { self.lblStageNumber.text = "Stage 5-4"; }
                    else if (self.progress >= Database.PROGRESS_1_5_2) { self.lblStageNumber.text = "Stage 5-3"; }
                    else if (self.progress >= Database.PROGRESS_1_5_1) { self.lblStageNumber.text = "Stage 5-2"; }
                    else { self.lblStageNumber.text = "Stage 5-1"; }
                }
                else if (self.currentStage == 6) // change (ENHANCE-A)
                {
                    if (self.progress == Database.PROGRESS_1_6_1) { self.parent.progressStage1_6_1 = 1 }
                    else if (self.progress == Database.PROGRESS_1_6_2) { self.parent.progressStage1_6_2 = 1 }
                    else if (self.progress == Database.PROGRESS_1_6_3) { self.parent.progressStage1_6_3 = 1 }
                    else if (self.progress == Database.PROGRESS_1_6_4) { self.parent.progressStage1_6_4 = 1 }
                    
                    if (self.progress >= Database.PROGRESS_1_6_4) { self.lblStageNumber.text = "Stage 6-5"; }
                    else if (self.progress >= Database.PROGRESS_1_6_3) { self.lblStageNumber.text = "Stage 6-4"; }
                    else if (self.progress >= Database.PROGRESS_1_6_2) { self.lblStageNumber.text = "Stage 6-3"; }
                    else if (self.progress >= Database.PROGRESS_1_6_1) { self.lblStageNumber.text = "Stage 6-2"; }
                    else { self.lblStageNumber.text = "Stage 6-1"; }
                }
            }

            // ステージ終了判定
            var FINISH_LINE:Int = Database.FINISH_LINE_1[0]; // STAGE_1 change (ENHANCE-A)
            if (self.currentScene == 2) {
                FINISH_LINE = Database.FINISH_LINE_2[self.currentStage - 1];
            } else if (self.currentScene == 0) {
                FINISH_LINE = Database.FINISH_LINE_0[self.currentStage - 1];
            } else {
                FINISH_LINE = Database.FINISH_LINE_1[self.currentStage - 1];
//                if (self.currentStageName == Database.STAGE_2) { FINISH_LINE = Database.FINISH_LINE_1_2 }delete (ENHANCE-A)
//                else if (self.currentStageName == Database.STAGE_3) { FINISH_LINE = Database.FINISH_LINE_1_3 }delete (ENHANCE-A)
//                else if (self.currentStageName == Database.STAGE_4) { FINISH_LINE = Database.FINISH_LINE_1_4 }delete (ENHANCE-A)
//                else if (self.currentStageName == Database.STAGE_5) { FINISH_LINE = Database.FINISH_LINE_1_5 }delete (ENHANCE-A)
//                else if (self.currentStageName == Database.STAGE_6) { FINISH_LINE = Database.FINISH_LINE_1_6 }delete (ENHANCE-A)
            }
            
            if (self.progress == FINISH_LINE)
            {
                self.imgMainObj.nowRiding = 0 // add [ENHANCE-A]
                for (var ii:Int = 0; ii < objArray.count; ii++)
                {
                    let current:ImageObject = objArray[ii] as! ImageObject
                    if (current.hidden == false && current.attr == Database.NAME_KINTOUN) {
                        current.nowRiding = 2; // 2 is end-sign(not false(0))
                    }
                }
                self.xepherPlayer.PlayMusic("ichigo_2", ext: "m4a")
                self.imgFinish.hidden = false
            }
            else if (self.progress == FINISH_LINE+80)
            {
                self.lblBonusACount.text = String(format: "%03d", stageBonusACount)
                self.lblBonusACount.hidden = false
                self.imgScoreBonusA.hidden = false
            }
            else if (self.progress == FINISH_LINE + 160)
            {
                self.lblBonusBCount.text = String(format: "%03d", stageBonusBCount)
                self.lblBonusBCount.hidden = false
                self.imgScoreBonusB.hidden = false
            }
            else if (self.progress == FINISH_LINE+320)
            {
                self.xepherPlayer.PlayMusic("VB\(self.currentScene)", ext: "wav")
                self.stageBonusACount = 0
                self.stageBonusBCount = 0
                self.imgFinish.hidden = true
                self.lblBonusACount.hidden = true
                self.lblBonusBCount.hidden = true
                self.imgScoreBonusA.hidden = true
                self.imgScoreBonusB.hidden = true
                
                if (self.currentScene == 2) {
                    if (1 <= self.currentStage && self.currentStage <= 5)
                    {
                        self.readyCount = 0;
                        self.firstField = false;
                        self.parent.completeStage2[self.currentStage - 1] = 1
                        self.currentStage++;
                        self.LoadStageData(self.currentScene, stageNum: self.currentStage);
                    }
                    else
                    {
                        self.imgCongratulations.hidden = false
                        self.GameEnd()
                    }
                } else {
                    if (self.currentStage == 1) // change (ENHANCE-A)
                    {
                        self.readyCount = 0;
                        self.firstField = false;
                        self.parent.completeStage1_1 = 1
                        self.currentStage = 2 // change (ENHANCE-A)
                        self.LoadStageData(self.currentScene, stageNum: self.currentStage); // change (ENHANCE-A)
                    }
                    else if (self.currentStage == 2) // change (ENHANCE-A)
                    {
                        self.readyCount = 0;
                        self.firstField = false;
                        self.parent.completeStage1_2 = 1
                        self.currentStage = 3 // change (ENHANCE-A)
                        self.LoadStageData(self.currentScene, stageNum: self.currentStage); // change (ENHANCE-A)
                    }
                    else if (self.currentStage == 3) // change (ENHANCE-A)
                    {
                        self.readyCount = 0;
                        self.firstField = false;
                        self.parent.completeStage1_3 = 1
                        self.currentStage = 4 // change (ENHANCE-A)
                        self.LoadStageData(self.currentScene, stageNum: self.currentStage); // change (ENHANCE-A)
                    }
                    else if (self.currentStage == 4) // change (ENHANCE-A)
                    {
                        self.readyCount = 0;
                        self.firstField = false;
                        self.parent.completeStage1_4 = 1
                        self.currentStage = 5 // change (ENHANCE-A)
                        self.LoadStageData(self.currentScene, stageNum: self.currentStage); // change (ENHANCE-A)
                    }
                    else if (self.currentStage == 5) // change (ENHANCE-A)
                    {
                        self.readyCount = 0;
                        self.firstField = false;
                        self.parent.completeStage1_5 = 1
                        self.currentStage = 6 // change (ENHANCE-A)
                        self.LoadStageData(self.currentScene, stageNum: self.currentStage); // change (ENHANCE-A)
                    }
                    else if (self.currentStage == 6) // change (ENHANCE-A)
                    {
                        self.imgCongratulations.hidden = false
                        self.parent.completeStage1_6 = 1 // add [ENHANCE-A]
                        self.parent.availableRandom = 1
                        self.GameEnd()
                    }
                }
                progress = -1; // SetupSceneの開始番号は０、その一つ前は-1
            }
        }
        // ランダムモード todo
        else {
            let FIELD_A:String = "field";  // field
            //let FIELD_B:String = "fieldB"; // rock
            //let FIELD_C:String = "fieldC"; // border
            let BONUS_A = "bonusA"; // flower
            let BONUS_B = "bonusB"; // sun
            let ENEMY_A = "enemyA"; // bird
            let ENEMY_B = "enemyB"; // bigbird
            let ENEMY_C = "enemyC"; // bigmouse
            //var ENEMY_D = "enemyD"; // eyebird
            let ENEMY_E = "enemyE"; // fallberry
            let ENEMY_F = "enemyF"; // fallhand
            let ENEMY_G = "enemyG"; // smallmouse
            //var CLOUD_A = "cloudA"; // fall hand
            let CLOUD_B = "cloudB"; // chijo cloud
            //var CLOUD_C = "cloudC"; // white cloud
            
            var division:Int = 0;

            division = self.GetRandomStageNumber(self.progress);
            self.lblStageNumber.text = "Level \(division+1)";

            if (division >= STAGE_DIV && self.progress >= stageTime[STAGE_DIV-1])
            {
                division = STAGE_DIV-1;
                self.lblStageNumber.text = "Level Ω";
            }

            for (var ii = 0; ii < STAGE_DIV; ii++) {
                if (self.progress != 0 && stageTime[ii] == self.progress ) {
                    var achiveName:String = ""
                    if (ii == 4) { achiveName = "RANDOMLEVEL5" }
                    else if (ii == 9) { achiveName = "RANDOMLEVEL10" }
                    else if (ii == 14) { achiveName = "RANDOMLEVEL15" }
                    else if (ii == 19) { achiveName = "RANDOMLEVEL20" }
                    else if (ii == 24) { achiveName = "RANDOMLEVEL25" }
                    else if (ii == 29) { achiveName = "RANDOMLEVEL30" }
                    else if (ii == 34) { achiveName = "RANDOMLEVEL35" }
                    else if (ii == 39) { achiveName = "RANDOMLEVEL40" }
                    else if (ii == 44) { achiveName = "RANDOMLEVEL45" }
                    else if (ii == 49) { achiveName = "RANDOMLEVEL50" }
                    else if (ii == 54) { achiveName = "RANDOMLEVEL55" }
                    else if (ii == 59) { achiveName = "RANDOMLEVEL60" }
                    else if (ii == 64) { achiveName = "RANDOMLEVEL65" }
                    else if (ii == 69) { achiveName = "RANDOMLEVEL70" }
                    else if (ii == 74) { achiveName = "RANDOMLEVEL75" }
                    else if (ii == 79) { achiveName = "RANDOMLEVEL80" }
                    else if (ii == 84) { achiveName = "RANDOMLEVEL85" }
                    else if (ii == 89) { achiveName = "RANDOMLEVEL90" }
                    else if (ii == 94) { achiveName = "RANDOMLEVEL95" }
                    else if (ii == 99) { achiveName = "RANDOMLEVEL100" }
                    self.parent.authenticateAchievement(achiveName)
                    
                    self.lblStageChange.center = CGPoint(x: 700, y: self.parent.SCREEN_HEIGHT/2)
                    self.lblStageChange.text = "Stage Level  \(ii+1)"
                    self.lblStageChange.hidden = false;
                    UIView.animateWithDuration(2.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                        self.lblStageChange.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
                        }, completion: {finished in
                            UIView.animateWithDuration(2.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                    self.lblStageChange.center = CGPoint(x: -700, y: self.parent.SCREEN_HEIGHT/2)
                                }, completion: {finished in
                                    self.lblStageChange.hidden = true;
                                }
                            )
                        }
                    )
                    break;
                }
            }
			

            if ( progress == 1)
            {
                let randFactor:UInt32 = 50;
                self.SearchObj(BONUS_A).ActivateObject(INITIAL_X-500, y: y-30.0-(Double)(arc4random() % randFactor), move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
                self.SearchObj(BONUS_A).ActivateObject(INITIAL_X-400, y: y-30.0-(Double)(arc4random() % randFactor), move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
                self.SearchObj(BONUS_A).ActivateObject(INITIAL_X-300, y: y-30.0-(Double)(arc4random() % randFactor), move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
                self.SearchObj(BONUS_A).ActivateObject(INITIAL_X-200, y: y-30.0-(Double)(arc4random() % randFactor), move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
                self.SearchObj(BONUS_A).ActivateObject(INITIAL_X-100, y: y-30.0-(Double)(arc4random() % randFactor), move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
            }
            
            let speedX0:Double = self.speedX0Time[division];
            let speedX1:Double = self.speedX1Time[division];

            // bonusA
			if ((bonusATime[division] != 0) && (self.progress % bonusATime[division]) == 0) {
                var BONUS:String = BONUS_A;
                let rand:UInt32 = arc4random() % 50;
                let rand2:UInt32 = arc4random() % 400;
                if (rand2 == 0) { BONUS = BONUS_B; }
                let dy:Double = 30.0;
                self.SearchObj(BONUS).ActivateObject(INITIAL_X, y: y-dy-(Double)(rand), move: 52, activeRandomX: 0, width: 0, fixPattern: speedX0, fixPattern2: 0)
			}

			if ((bonusA2Time[division] != 0) && (self.progress % bonusA2Time[division]) == 0) {
                var BONUS:String = BONUS_A;
                let rand:UInt32 = arc4random() % 40;
                let rand2:UInt32 = arc4random() % 400;
                if (rand2 == 0) { BONUS = BONUS_B; }
                let dy:Double = 160.0;
                self.SearchObj(BONUS).ActivateObject(INITIAL_X, y: y-dy-(Double)(rand), move: 52, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: 0)
            }

            if ((bonusA3Time[division] != 0) && (self.progress % bonusA3Time[division]) == 0) {
                var BONUS:String = BONUS_A;
                let rand:UInt32 = arc4random() % 40;
                let rand2:UInt32 = arc4random() % 400;
                if (rand2 == 0) { BONUS = BONUS_B; }
                let dy:Double = 100.0;
                self.SearchObj(BONUS).ActivateObject(INITIAL_X, y: y-dy-(Double)(rand), move: 52, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: 0)
            }
            
            // enemyA(small bird)
			if ((birdTime[division] != 0) && (self.progress % birdTime[division]) == 0) {
				if (self.changeBird == false)
				{
                    self.changeBird = true;
	                let rand:UInt32 = arc4random() % 60;
	                let randomY:Double = 0;
					let rand2:UInt32 = arc4random() % 2;
	                if (self.progress > 12000 && rand2 == 0) {
		                self.SearchObj(ENEMY_A).ActivateObject(INITIAL_X, y: y-30.0-(Double)(rand), move: 14, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: randomY)
					} else {
		                self.SearchObj(ENEMY_A).ActivateObject(INITIAL_X, y: y-30.0-(Double)(rand), move: 52, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: randomY)
					}
				} else {
                    self.changeBird = false;
	                let rand:UInt32 = arc4random() % 60;
                    let rand2:UInt32 = arc4random() % 2;
	                var randomY:Double = 0;
	                if (self.progress >= 7500) { randomY = (Double)(arc4random() % 20) * 0.1; }
	                if (self.progress > 12000 && rand2 == 0) {
		                self.SearchObj(ENEMY_A).ActivateObject(INITIAL_X, y: y-160.0-(Double)(rand), move: 14, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: randomY)
					} else {
		                self.SearchObj(ENEMY_A).ActivateObject(INITIAL_X, y: y-160.0-(Double)(rand), move: 52, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: randomY)
					}
				}
			}
            
            // enemyA(small bird2)
            if ((bird2Time[division] != 0) && (self.progress % bird2Time[division]) == 0) {
                if (self.changeBird2 == false)
                {
                    self.changeBird2 = true;
                    let rand:UInt32 = arc4random() % 60;
                    let randomY:Double = 0;
                    self.SearchObj(ENEMY_A).ActivateObject(INITIAL_X, y: y-30.0-(Double)(rand), move: 10, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: randomY)
                } else {
                    self.changeBird2 = false;
                    let rand:UInt32 = arc4random() % 60;
                    let randomY:Double = 0;
                    self.SearchObj(ENEMY_A).ActivateObject(INITIAL_X, y: y-160.0-(Double)(rand), move: 10, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: randomY)
                }
            }

            // enemyB(big bird)
			if ((bigbirdTime[division] != 0) && (self.progress % bigbirdTime[division]) == 0) {
                let rand:UInt32 = arc4random() % 80;
                var rand2:Int = 0;
                if (2500 <= self.progress)
                {
                    rand2 = (Int)(arc4random() % 3);
                    if (rand2 == 0) { rand2 = 0; }
                    else if (rand2 == 1) { rand2 = 1; }
                    else if (rand2 == 2) { rand2 = 54; }
                }
                self.SearchObj(ENEMY_B).ActivateObject(INITIAL_X, y: y-110.0-(Double)(rand), move: rand2, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: 0)
			}

            // enemyC(big mouse)
			if ((bigmouseTime[division] != 0) && (self.progress % bigmouseTime[division]) == 0) {
                self.SearchObj(ENEMY_C).ActivateObject(INITIAL_X, y: y-130.0, move: 11, activeRandomX: 0, width: 0, fixPattern: 2, fixPattern2: 0)
			}
            
            // enemyD(eye bird)
            
            // enemyE(fall berry)
			if ((fallberryTime[division] != 0) && (self.progress % fallberryTime[division]) == 0) {
                let rand:UInt32 = arc4random() % 400 - 200;
                self.SearchObj(ENEMY_E).ActivateObject(INITIAL_X, y: y-320.0, move: 34, activeRandomX: (Double)(rand), width: 0, fixPattern: speedX1, fixPattern2: 0)
			}
            // enemyE(fall berry2)
            if ((fallberry2Time[division] != 0) && (self.progress % fallberry2Time[division]) == 0) {
                let rand:UInt32 = arc4random() % 100 - 250;
                self.SearchObj(ENEMY_E).ActivateObject(INITIAL_X, y: y-320.0, move: 34, activeRandomX: (Double)(rand), width: 0, fixPattern: speedX1, fixPattern2: 0)
            }
            
            // enemyF(fall hand)
            if ((fallhandTime[division] != 0) && (self.progress % fallhandTime[division]) == 0) {
                var rand:Int = (Int)(arc4random() % 3);
                if (rand == 0) { rand =  41; }
                else if (rand == 1) { rand = 42; }
                else if (rand == 2) { rand = 43; }
                self.SearchObj(ENEMY_F).ActivateObject(INITIAL_X, y: y-350.0, move:rand, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: 0)
            }
            
            // enemyG(small mouse)
			if ((smallmouseTime[division] != 0) && (self.progress % smallmouseTime[division]) == 0) {
                self.SearchObj(ENEMY_G).ActivateObject(INITIAL_X, y: y-40.0, move: 35, activeRandomX: 0, width: 0, fixPattern: speedX1, fixPattern2: 0)
			}

            // cloudA(hand)
            
            // cloudB(chijo cloud)
			if ((cloudTime[division] != 0) && (self.progress % cloudTime[division]) == 0) {
                let rand:Double = (Double)(arc4random() % 40);
                var dy:Double = 0.0;
				if (self.changeCloudB == false) {
					self.changeCloudB = true;
					dy = 60.0;
				} else {
					self.changeCloudB = false;
					dy = 120.0;
				}
                self.SearchObj(CLOUD_B).ActivateObject(INITIAL_X, y: y-dy-(Double)(rand), move: 52, activeRandomX: 0, width: 0, fixPattern: 0.5 + speedX1, fixPattern2: 0)
			}

            // cloudC(white cloud)
            
            // field
            if ((self.progress % FIELD_LEN) == 0)
            {
                self.SearchObj(FIELD_A).ActivateObject(1136, y: y, move: 0, activeRandomX: 0, width: 0, fixPattern: 0, fixPattern2: 0)
            }
        }
        
        // add [ENHANCE-A]
        if (self.mode == gameMode.modeTutorial) {
            if (self.progress == 150) {
            self.lblTutorial.center  = CGPoint(x: 700, y: self.parent.SCREEN_HEIGHT/2)
            self.lblTutorial.text = "touch the screen \n jump Berry!"
            self.lblTutorial.hidden = false;
            UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.lblTutorial.center = CGPoint(x: self.parent.SCREEN_WIDTH/2, y: self.parent.SCREEN_HEIGHT/2)
                }, completion: {finished in
                    self.tutorialProgress = 1
                }
            )
            }
        }
        // add end [ENHANCE-A]
    }

    func SetupObjArray(list:NSMutableArray, num:Int, name:Array<UIImage>, bonus:Bool, footHold:Bool, enemy:Bool, attrname:String, width:CGFloat, height:CGFloat) {
        if (name.count <= 0) { return; }
        for (var ii:Int = 0; ii < num; ii++)
        {
            let obj:ImageObject = ImageObject()
            obj.image = name[0]
            obj.isBonus = bonus
            obj.isFootHold = footHold
            obj.isEnemy = enemy
            obj.attr = attrname
            obj.hidden = true
            obj.sizeToFit()
            obj.frame = CGRect(x:ImageObject.INIT_POS_X, y:ImageObject.INIT_POS_Y, width:width, height:height)
            var imageList: [UIImage] = []
            for var jj:Int = 0; jj < name.count; jj++ {
                imageList.append(name[jj])
            }
            obj.animationImages = imageList
            obj.animationDuration = 0.5
            obj.animationRepeatCount = 0
            obj.startAnimating()
            
            list.addObject(obj)
            self.view.addSubview(obj)
        }
    }

    func SearchObj(objName: String) -> ImageObject! {
        var min: Int = 0
        var max: Int = 0
        let nameList:NSArray = [Database.ID_FIELD, Database.ID_FIELD_C, Database.ID_FIELD_D, Database.ID_BONUS_A, Database.ID_BONUS_B, Database.ID_ENEMY_A, Database.ID_ENEMY_B, Database.ID_ENEMY_C, Database.ID_ENEMY_D, Database.ID_ENEMY_E, Database.ID_ENEMY_F, Database.ID_ENEMY_G, Database.ID_ENEMY_H, Database.ID_ENEMY_I, Database.ID_ENEMY_J, Database.ID_ENEMY_K, Database.ID_CLOUD_A, Database.ID_CLOUD_B, Database.ID_CLOUD_C, Database.ID_KINTOUN, Database.ID_CLOUD_D] // change [ENHANCE-A]
        
        var cumulative:Int = 0
        for (var ii:Int = 0; ii < nameList.count; ii++)
        {
            if (objName == nameList[ii] as? NSString)
            {
                min = cumulative
                max = cumulative + numList[ii].count
            }
            cumulative += numList[ii].count
        }
        
        for (var ii:Int = min; ii < max; ii++)
        {
            let current:ImageObject = self.objArray[ii] as! ImageObject
            if (current.hidden)
            {
                return current
            }
        }
        return nil
    }
    
    // -1:当たってない, 0:左上の左, 1:左上の上, // 2:右上の上, // 3:右上の右, // 4:左下の左, // 5:左下の下, // 6:右下の下, // 7:右下の右
    func DetectObjectDirection(valueBody:ImageObject, target:ImageObject, reduce:Int) -> Int
    {
        if ((valueBody.frame.origin.x + CGFloat(reduce) <= target.center.x) &&
            (target.center.x <= valueBody.frame.origin.x + valueBody.frame.size.width - CGFloat(reduce)) &&
            (valueBody.frame.origin.y + CGFloat(reduce) <= target.center.y) &&
            (target.center.y <= valueBody.frame.origin.y + valueBody.frame.size.height - CGFloat(reduce))
           )
        {
            if (target.center.y >= valueBody.center.y)
            {
                let diffY:Double = Double(target.center.y - valueBody.center.y)
                // 左上
                if (target.center.x >= valueBody.center.x)
                {
                    let diffX:Double = Double(target.center.x - valueBody.center.x)
                    if (diffX >= diffY) { return 0 }
                    else { return 1 }
                }
                // 右上
                else
                {
                    let diffX:Double = Double(valueBody.center.x - target.center.x)
                    if (diffX >= diffY) { return 3 }
                    else { return 2 }
                }
            } else {
                let diffY:Double = Double(valueBody.center.y - target.center.y)
                // 左上
                if (target.center.x >= valueBody.center.x)
                {
                    let diffX:Double = Double(target.center.x - valueBody.center.x)
                    if (diffX >= diffY) { return 4 }
                    else { return 5 }
                }
                // 右上
                else
                {
                    let diffX:Double = Double(valueBody.center.x - target.center.x)
                    if (diffX >= diffY) { return 7 }
                    else { return 6 }
                }
            }
        }
        return -1
    }
    
    func DetectObjectCurve(valueBody:ImageObject, target:ImageObject, reduce:Int, inout diff: Double) -> Bool {
        if ((target.frame.origin.x <= valueBody.frame.origin.x + valueBody.frame.size.width/2) &&
            (valueBody.frame.origin.x + valueBody.frame.size.width/2 <= target.frame.origin.x + target.frame.size.width) &&
            (target.frame.origin.y <= valueBody.frame.origin.y + valueBody.frame.size.height) &&
            (valueBody.frame.origin.y <= target.frame.origin.y + target.frame.size.height))
        {
            let r:Double = Double(target.frame.size.width / 2.0)
            let srcX:Double = Double(valueBody.frame.origin.x + valueBody.frame.size.width / 2.0) - Double(target.frame.origin.x)
            let srcY:Double = Double(target.frame.origin.y + target.frame.size.height / 2.0) - Double(valueBody.frame.origin.y + valueBody.frame.size.height)
            let border:Double = r * sin(srcX * 90.0 / r * M_PI / 180.0)
            let difference:Double = border - srcY
            diff = difference
            return true
        }
        return false
    }

    // add start [ENHANCE-A]
    func DetectObject(valueBody:UIView, pos:CGPoint, reduceX:CGFloat, reduceY:CGFloat) -> Bool {
        if ((valueBody.frame.origin.x + reduceX <= pos.x) &&
            (pos.x <= valueBody.frame.origin.x + valueBody.frame.size.width - reduceX) &&
            (valueBody.frame.origin.y + reduceY <= pos.y) &&
            (pos.y <= valueBody.frame.origin.y + valueBody.frame.size.height - reduceY))
        {
            return true
        }
        return false
    }
    func DetectObjectBoss(valueBody:UIView, pos:CGPoint) -> Bool {
        let a:CGFloat = 30
        let b:CGFloat = 20
        let c:CGFloat = 30
        if ((valueBody.center.x - a - b <= pos.x) &&
            (pos.x <= valueBody.center.x + a - b) &&
            (valueBody.frame.origin.y + c <= pos.y) &&
            (pos.y <= valueBody.frame.origin.y + valueBody.frame.size.height - c))
        {
            return true
        }
        let x:CGFloat = 15
        let y:CGFloat = 2
        let z:CGFloat = 20
        let z2:CGFloat = 80
        if ((valueBody.center.y - x - y <= pos.y) &&
            (pos.y <= valueBody.center.y + x - y) &&
            (valueBody.frame.origin.x + z <= pos.x) &&
            (pos.x <= valueBody.frame.origin.x + valueBody.frame.size.width - z2))
        {
            return true;
        }
        return false;
    }
    // add end [ENHANCE-A]
    func DetectObject(valueBody:UIView, pos:CGPoint, reduce:CGFloat) -> Bool {
        if ((valueBody.frame.origin.x + reduce <= pos.x) &&
            (pos.x <= valueBody.frame.origin.x + valueBody.frame.size.width - reduce) &&
            (valueBody.frame.origin.y + reduce <= pos.y) &&
            (pos.y <= valueBody.frame.origin.y + valueBody.frame.size.height - reduce))
        {
            return true
        }
        return false
    }
    
    func GetBonus(obj:ImageObject) {
        if (obj.attr == Database.NAME_SUN)
        {
            self.xepherPlayer.PlaySound("koe (1)")
            self.score = self.score + 1500
            self.bonusBCount++
            self.stageBonusBCount++
            self.parent.PlusContinueCoin()
        }
        else
        {
            self.xepherPlayer.PlaySound("hanatori1")
            self.score = self.score + 300
            self.bonusACount++
            self.stageBonusACount++
        }
        let scoreText:NSString = NSString(format: "%08d", score)
        self.lblScore.text = scoreText as String
        self.lblBonusAScore.text = "\(self.bonusACount)";
        self.lblBonusBScore.text = "\(self.bonusBCount)";
        obj.MoveToDefault()
    }
    

    func SetupGameProgress() {
        if (self.mode == gameMode.modeContinue) // change (ENHANCE-A)
        {
            if (self.currentScene == 1) {
                if (self.parent.completeStage1_1 == 0)
                {
                    self.currentStage = 1; // change (ENHANCE-A)
                    if (self.parent.progressStage1_1_1 == 1) { self.progress = Database.PROGRESS_1_1_1; }
                    if (self.parent.progressStage1_1_2 == 1) { self.progress = Database.PROGRESS_1_1_2; }
                    if (self.parent.progressStage1_1_3 == 1) { self.progress = Database.PROGRESS_1_1_3; }
                }
                else if (self.parent.completeStage1_2 == 0)
                {
                    self.currentStage = 2; // change (ENHANCE-A)
                    if (self.parent.progressStage1_2_1 == 1) { self.progress = Database.PROGRESS_1_2_1; }
                    if (self.parent.progressStage1_2_2 == 1) { self.progress = Database.PROGRESS_1_2_2; }
                    if (self.parent.progressStage1_2_3 == 1) { self.progress = Database.PROGRESS_1_2_3; }
                }
                else if (self.parent.completeStage1_3 == 0)
                {
                    self.currentStage = 3; // change (ENHANCE-A)
                    if (self.parent.progressStage1_3_1 == 1) { self.progress = Database.PROGRESS_1_3_1; }
                    if (self.parent.progressStage1_3_2 == 1) { self.progress = Database.PROGRESS_1_3_2; }
                    if (self.parent.progressStage1_3_3 == 1) { self.progress = Database.PROGRESS_1_3_3; }
                }
                else if (self.parent.completeStage1_4 == 0)
                {
                    self.currentStage = 4; // change (ENHANCE-A)
                    if (self.parent.progressStage1_4_1 == 1) { self.progress = Database.PROGRESS_1_4_1; }
                    if (self.parent.progressStage1_4_2 == 1) { self.progress = Database.PROGRESS_1_4_2; }
                    if (self.parent.progressStage1_4_3 == 1) { self.progress = Database.PROGRESS_1_4_3; }
                    if (self.parent.progressStage1_4_4 == 1) { self.progress = Database.PROGRESS_1_4_4; }
                    //if (self.parent.progressStage1_4_5 == 1) { self.progress = Database.PROGRESS_1_4_5; } // delete 2015/05/20
                }
                else if (self.parent.completeStage1_5 == 0)
                {
                    self.currentStage = 5; // change (ENHANCE-A)
                    if (self.parent.progressStage1_5_1 == 1) { self.progress = Database.PROGRESS_1_5_1; }
                    if (self.parent.progressStage1_5_2 == 1) { self.progress = Database.PROGRESS_1_5_2; }
                    if (self.parent.progressStage1_5_3 == 1) { self.progress = Database.PROGRESS_1_5_3; }
                }
                else if (self.parent.completeStage1_6 == 0)
                {
                    self.currentStage = 6; // change (ENHANCE-A)
                    if (self.parent.progressStage1_6_1 == 1) { self.progress = Database.PROGRESS_1_6_1; }
                    if (self.parent.progressStage1_6_2 == 1) { self.progress = Database.PROGRESS_1_6_2; }
                    if (self.parent.progressStage1_6_3 == 1) { self.progress = Database.PROGRESS_1_6_3; }
                    if (self.parent.progressStage1_6_4 == 1) { self.progress = Database.PROGRESS_1_6_4; }
                }
            }
        }
        else if (self.mode == gameMode.modeTutorial) {
            self.currentScene = 0;
            self.currentStage = 1;
            self.progress = 0;
        }
//        self.currentScene = 0; // debug only
//        self.currentStage = self.parent.selectStage; // debug only
//        self.progress = 0; // debug only
    }
}