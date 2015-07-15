//
//  ViewController.swift
//  VeryBerry
//
//  Created by Summer on 2015/01/28.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import UIKit
import GameKit
import iAd
import EventKit


class ViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet var btnSceneSelect: UIButton! = nil // add [ENHANCE-A]
    @IBOutlet var lblCopyright: UILabel! = nil
    @IBOutlet var lblMessageForAD: UILabel! = nil
    @IBOutlet var lblContinueCoinNum: UILabel! = nil
    @IBOutlet var imgContinueCoin: UIImageView! = nil
    @IBOutlet var btnRandomContinueYes: UIButton! = nil
    @IBOutlet var btnRandomContinueNo: UIButton! = nil
    @IBOutlet var lblRandomStageNum:UILabel! = nil
    @IBOutlet weak var adBanner:ADBannerView! = nil
    @IBOutlet var btnRandomStart:UIButton! = nil
    @IBOutlet var btnScore:UIButton! = nil
    @IBOutlet var btnPlay:UIButton! = nil
    @IBOutlet var btnContinue:UIButton! = nil

    var SCREEN_WIDTH :CGFloat = 0
    var SCREEN_HEIGHT :CGFloat = 0
    var updateHighScore: Int = 0
    var updateHighScoreAdditional: String = ""
    var imgBack_opening :UIImageView! = nil
    var continueMode:Int = 0
    var setupFirst :Bool = false
    var debug1 :Bool = false
    var availableRandom:Int = 0
    var progressRandomLevel:Int = 0
    var continueCoin:Int = 0
    var progressStage1_1_1:Int = 0
    var progressStage1_1_2:Int = 0
    var progressStage1_1_3:Int = 0
    var completeStage1_1:Int = 0
    var progressStage1_2_1:Int = 0
    var progressStage1_2_2:Int = 0
    var progressStage1_2_3:Int = 0
    var completeStage1_2:Int = 0
    var progressStage1_3_1:Int = 0
    var progressStage1_3_2:Int = 0
    var progressStage1_3_3:Int = 0
    var completeStage1_3:Int = 0
    var progressStage1_4_1:Int = 0
    var progressStage1_4_2:Int = 0
    var progressStage1_4_3:Int = 0
    var progressStage1_4_4:Int = 0
    var progressStage1_4_5:Int = 0
    var completeStage1_4:Int = 0
    var progressStage1_5_1:Int = 0
    var progressStage1_5_2:Int = 0
    var progressStage1_5_3:Int = 0
    var completeStage1_5:Int = 0
    var progressStage1_6_1:Int = 0
    var progressStage1_6_2:Int = 0
    var progressStage1_6_3:Int = 0
    var progressStage1_6_4:Int = 0
    var completeStage1_6:Int = 0

    var selectScene:Int = 1; // add (ENHANCE-A)
    var selectStage:Int = 1; // add (ENHANCE-A)
    
    var randomMode:Bool = false // random modeを示すフラグ（false:stage true:random)
    var imgBackground01: UIImage! = nil
    var imgBackground02: UIImage! = nil
    //var imgBerryJump01: UIImage! = nil
    var imgBerryJump02: UIImage! = nil
    var imgBerryJump03: UIImage! = nil
    var imgBerryJump04: UIImage! = nil
    var imgBerryRun01: UIImage! = nil
    var imgBerryRun02: UIImage! = nil
    var imgBerryRun03: UIImage! = nil
    var imgBerryRun04: UIImage! = nil
    var imgBerryRun05: UIImage! = nil
    var imgBerryRun06: UIImage! = nil
    var imgBerryRun11: UIImage! = nil
    var imgBerryRun12: UIImage! = nil
    var imgBerryRun13: UIImage! = nil
    var imgBerryRun14: UIImage! = nil
    var imgBerryRun15: UIImage! = nil
    var imgBerryRun16: UIImage! = nil
    var imgFieldA_1: UIImage! = nil
    //var imgFieldB_1: UIImage! = nil
    //var imgFieldC_1: UIImage! = nil
    var imgFieldD_1: UIImage! = nil
    var imgFieldD_2: UIImage! = nil
    var imgBonusA_1: UIImage! = nil
    var imgBonusA_2: UIImage! = nil
    var imgBonusB_1: UIImage! = nil
    var imgBonusB_2: UIImage! = nil
    var imgEnemyA_1: UIImage! = nil
    var imgEnemyA_2: UIImage! = nil
    var imgEnemyA_3: UIImage! = nil
    var imgEnemyB_1: UIImage! = nil
    var imgEnemyB_2: UIImage! = nil
    var imgEnemyB_3: UIImage! = nil
    var imgEnemyC_1: UIImage! = nil
    var imgEnemyC_2: UIImage! = nil
    var imgEnemyD_1: UIImage! = nil
    var imgEnemyE_1: UIImage! = nil
    var imgEnemyF_1: UIImage! = nil
    var imgEnemyG_1: UIImage! = nil
    var imgEnemyG_2: UIImage! = nil
    var imgEnemyH: [UIImage] = [];
    var imgEnemyI: [UIImage] = [];
    var imgCloudA_1: UIImage! = nil
    var imgCloudB_1: UIImage! = nil
    var imgCloudB_2: UIImage! = nil
    var imgCloudB_3: UIImage! = nil
    var imgCloudB_4: UIImage! = nil
    var imgCloudB_5: UIImage! = nil
    var imgCloudB_6: UIImage! = nil
    var imgCloudB_7: UIImage! = nil
	// Stage 2 (ENHANCE-A)
    var progressStage2_1:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var progressStage2_2:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var progressStage2_3:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var progressStage2_4:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var progressStage2_5:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var progressStage2_6:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var completeStage2:[Int] = [0, 0, 0, 0, 0, 0]
    var imgBerryFreeze01: UIImage! = nil
    var imgCloudC: [UIImage] = [];
    
    func PlusContinueCoin() {
        self.continueCoin++
        var ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var flag:String = String(self.continueCoin)
        //println("bannerViewActionShouldBegin: continue: \(self.continueCoin)")
        ud.setValue(flag, forKey: "continueCoin")
        ud.synchronize()
        self.lblContinueCoinNum.text = "( \(self.continueCoin) )"
    }
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        //println("bannerView");
        self.adBanner?.hidden = true
    }
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        //println("bannerViewActionDidFinish")
    }
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        //println("bannerViewActionShouldBegin")
        // 広告タップの度に、コンティニューポイントを加算する。
        PlusContinueCoin()
        return true; // change 2015/05/20 [return willLeave can't touch iAD!]
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        //println("bannerViewDidLoagAd")
        self.adBanner.hidden = false
    }
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        //println("bannerViewWillLoadAd")
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CallViewScore" {
            //println("CallViewScore")
            var controller = segue.destinationViewController as! ViewScoreController
            controller.parent = self
        }
        else if segue.identifier == "CallPlay" {
            //println("CallPlay")
            var controller = segue.destinationViewController as! ViewGameController
            controller.mode = ViewGameController.gameMode.modeStart
            controller.currentScene = self.selectScene // add (ENHANCE-A)
            controller.currentStage = self.selectStage // add (ENHANCE-A)
            controller.parent = self
        }
        else if segue.identifier == "CallContinue" {
            //println("CallContinue")
            var controller = segue.destinationViewController as! ViewGameController
            controller.mode = ViewGameController.gameMode.modeContinue
            controller.parent = self
        }
        else if segue.identifier == "CallRandom" {
            //println("CallRandom")
            var controller = segue.destinationViewController as! ViewGameController
            controller.mode = ViewGameController.gameMode.modeRandom
            controller.parent = self
        }
        else if segue.identifier == "CallRandomContinueYes" {
            //println("CallRandomContinueYes")
            if (self.continueCoin > 0)
            {
                self.continueCoin--;
                var ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
                var flag:String = String(self.continueCoin)
                //println("prepareForSegue:CallRandomContinueYes: \(self.continueCoin)")
                ud.setValue(flag, forKey: "continueCoin")
                ud.synchronize()
                self.lblContinueCoinNum.text = "( \(self.continueCoin) )"
            }
            var controller = segue.destinationViewController as! ViewGameController
            controller.mode = ViewGameController.gameMode.modeRandom
            var value:Int = 0;
            //println("current Random Level: \(self.progressRandomLevel)")
            for (var ii:Int = 0; ii < self.progressRandomLevel; ii++)
            {
                value += 500 + 200 * ii;
            }
            //println("current value: \(value)")
            controller.progress = value
            controller.parent = self
        }
        else if segue.identifier == "CallRandomContinueNo" {
            //println("CallRandomContinueNo")
            var controller = segue.destinationViewController as! ViewGameController
            controller.mode = ViewGameController.gameMode.modeRandom
            controller.parent = self
        }
        else if segue.identifier == "CallStageSelect" {
            var controller = segue.destinationViewController as! ViewStageController
            controller.parent = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adBanner.delegate = self
        self.adBanner.hidden = true
//        self.canDisplayBannerAds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //println("viewWillAppear")

        // 画像のロードをこの時点で行い、ステージ開始時の速度を改善試みている。
        self.imgBackground01 = UIImage(named: "background1.png")
        self.imgBackground02 = UIImage(named: "back_tenjo-19.png")//"background2.png")
        
        self.imgBerryJump02 = UIImage(named: "berry_jump02.png")
        self.imgBerryJump03 = UIImage(named: "berry_jump03.png")
        self.imgBerryJump04 = UIImage(named: "berry_jump04.png")
        self.imgBerryRun01 = UIImage(named: "berry_run01.png")
        self.imgBerryRun02 = UIImage(named: "berry_run02.png")
        self.imgBerryRun03 = UIImage(named: "berry_run03.png")
        self.imgBerryRun04 = UIImage(named: "berry_run04.png")
        self.imgBerryRun05 = UIImage(named: "berry_run05.png")
        self.imgBerryRun06 = UIImage(named: "berry_run06.png")
        self.imgBerryRun11 = UIImage(named: "berry_run11.png")
        self.imgBerryRun12 = UIImage(named: "berry_run12.png")
        self.imgBerryRun13 = UIImage(named: "berry_run13.png")
        self.imgBerryRun14 = UIImage(named: "berry_run14.png")
        self.imgBerryRun15 = UIImage(named: "berry_run15.png")
        self.imgBerryRun16 = UIImage(named: "berry_run16.png")
        
        self.imgFieldA_1 = UIImage(named: "img_chijo_mid.png")
        //self.imgFieldB_1 = UIImage(named: "img_chitei_iwaba.png")
        self.imgFieldD_1 = UIImage(named: "bush_01.png")
        self.imgFieldD_2 = UIImage(named: "bush_02.png")
        self.imgBonusA_1 = UIImage(named: "hana1_01.png")
        self.imgBonusA_2 = UIImage(named: "hana1_02.png")
        self.imgBonusB_1 = UIImage(named: "hana2_01.png")
        self.imgBonusB_2 = UIImage(named: "hana2_02.png")
        self.imgEnemyA_1 = UIImage(named: "bird_01.png")
        self.imgEnemyA_2 = UIImage(named: "bird_02.png")
        self.imgEnemyA_3 = UIImage(named: "bird_03.png")
        self.imgEnemyB_1 = UIImage(named: "bird_l_01.png")
        self.imgEnemyB_2 = UIImage(named: "bird_l_02.png")
        self.imgEnemyB_3 = UIImage(named: "bird_l_03.png")
        self.imgEnemyC_1 = UIImage(named: "bigmouse_01.png")
        self.imgEnemyC_2 = UIImage(named: "bigmouse_02.png")
        self.imgEnemyD_1 = UIImage(named: "eye_bird.png")
        self.imgEnemyE_1 = UIImage(named: "morimori_falling_berry.png")
        self.imgEnemyF_1 = UIImage(named: "fall_hand.png")
        self.imgEnemyG_1 = UIImage(named: "smallmouse_01.png")
        self.imgEnemyG_2 = UIImage(named: "smallmouse_02.png")
        self.imgCloudA_1 = UIImage(named: "hand.png")
        self.imgCloudB_1 = UIImage(named: "img_chijo_front_red.png")
        self.imgCloudB_2 = UIImage(named: "img_chijo_front_turquoise.png")
        self.imgCloudB_3 = UIImage(named: "img_chijo_front_blue.png")
        self.imgCloudB_4 = UIImage(named: "img_chijo_front_green.png")
        self.imgCloudB_5 = UIImage(named: "img_chijo_front_orange.png")
        self.imgCloudB_6 = UIImage(named: "img_chijo_front_cyan.png")
        self.imgCloudB_7 = UIImage(named: "img_chijo_front_brown.png")
		// Stage 2 (ENHANCE-A)
        self.imgBerryFreeze01 = UIImage(named: "berry_freeze01.png")
        if (self.imgCloudC.count <= 0) {
            self.imgCloudC.append(UIImage(named: "whitecloud_01.png")!)
            self.imgCloudC.append(UIImage(named: "whitecloud_02.png")!)
            self.imgCloudC.append(UIImage(named: "whitecloud_03.png")!)
            self.imgCloudC.append(UIImage(named: "whitecloud_04.png")!)
        }
        if (self.imgEnemyH.count <= 0) {
            self.imgEnemyH.append(UIImage(named: "ufo-17.png")!)
        }
        if (self.imgEnemyI.count <= 0) {
            self.imgEnemyI.append(UIImage(named: "ufo-18.png")!)
        }
        
        SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
        SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
        // iosバージョンによって横向きのwidth,heightにならない。万が一widthが小さい場合、反転させておく。
        if (SCREEN_WIDTH < SCREEN_HEIGHT)
        {
            SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.width
            SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.height
        }
        //println("\(SCREEN_WIDTH) \(SCREEN_HEIGHT)")

        self.GetSaveData()
        self.GetSaveDataForRandom()
        
        if (self.imgBack_opening == nil)
        {
            self.imgBack_opening = UIImageView()
            UpdateBackgroundImage()
            self.imgBack_opening.frame = CGRect(x: 0, y: 0, width: self.SCREEN_WIDTH, height: self.SCREEN_HEIGHT)
            self.view.addSubview(self.imgBack_opening)
            self.view.sendSubviewToBack(self.imgBack_opening)
            self.view.bringSubviewToFront(self.adBanner)
        }
        
        self.BackToTitle()
    }
    
    func UpdateBackgroundImage() {
        if (self.availableRandom != 0) {
            self.imgBack_opening.image = UIImage(named: "top-03.png")
        } else {
            self.imgBack_opening.image = UIImage(named: "top-03-1.png")
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //println("viewDidAppear: \(SCREEN_WIDTH)  \(SCREEN_HEIGHT)")
    }
    
    override func viewWillLayoutSubviews() {
        //println("viewWillLayoutSubviews");
    }

    override func viewDidLayoutSubviews() {
        //println("viewDidLayoutSubviews");
        SetupObjectLayout()
        self.lblRandomStageNum.text = "Current Stage( \(self.progressRandomLevel) )"
        if (self.progressRandomLevel >= 100) {
            self.lblRandomStageNum.text = "Current Stage( Ω )"
        }

        authenticateLocalPlayer();
        if (self.continueCoin <= 0) {
            self.btnRandomContinueYes.enabled = false;
            self.btnRandomContinueYes.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
            self.btnRandomContinueYes.backgroundColor = UIColor.blackColor()
        } else {
            self.btnRandomContinueYes.enabled = true;
            self.btnRandomContinueYes.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            self.btnRandomContinueYes.backgroundColor = UIColor.whiteColor()
        }
    }

    func SetupObjectLayout() {
        // default iphone 6
        var width = 225
        var widthScore = 130
        var height = 50
        var dY11:CGFloat = 51; var dY12:CGFloat = 268; var dY13:CGFloat = 338; var dY14:CGFloat = 342;
        var dY22:CGFloat = 268; var dY23:CGFloat = 338; var dY24:CGFloat = 342;
        if (SCREEN_WIDTH == 736) { // maybe iPhone 6 plus
            width = 260; widthScore = 130; height = 55;
            dY11 = 57; dY12 = 296; dY13 = 373; dY14 = 378;
            dY22 = 296; dY23 = 373; dY24 = 378;
        } else if (SCREEN_WIDTH == 568) { // maybe iPhone 5S
            //println("iphone 5s layout")
            width = 170; widthScore = 100; height = 44
            dY11 = 44; dY12 = 228; dY13 = 288; dY14 = 292;
            dY22 = 228;  dY23 = 288; dY24 = 292;
        } else if (SCREEN_WIDTH == 480) { // maybe iPhone 4S
            //println("iphone 4s layout")
            width = 130; widthScore = 85; height = 43;
            dY11 = 44; dY12 = 228; dY13 = 288; dY14 = 292;
            dY22 = 228; dY23 = 288; dY24 = 292;
        }

        self.lblRandomStageNum.center = CGPointMake(ScaleLogic.RandomContinueLabel_X(self.SCREEN_WIDTH), ScaleLogic.RandomContinueLabel_Y(self.SCREEN_WIDTH))
        self.btnRandomContinueYes.center = CGPointMake(ScaleLogic.RandomContinueYes_X(self.SCREEN_WIDTH), ScaleLogic.RandomContinueYes_Y(self.SCREEN_WIDTH))
        self.imgContinueCoin.center = CGPointMake(ScaleLogic.ImgContinueCoin_X(self.SCREEN_WIDTH), ScaleLogic.ImgContinueCoin_Y(self.SCREEN_WIDTH))
        self.lblContinueCoinNum.center = CGPointMake(ScaleLogic.LblContinueNum_X(self.SCREEN_WIDTH), ScaleLogic.LblContinueNum_Y(self.SCREEN_WIDTH))
        self.lblContinueCoinNum.text =  "( \(self.continueCoin) )"
        self.lblCopyright.center = CGPointMake(ScaleLogic.LblCopyright_X(self.SCREEN_WIDTH), ScaleLogic.LblCopyright_Y(self.SCREEN_WIDTH))
        
        if (self.availableRandom != 0) {
            //println("available random")
            self.lblRandomStageNum.hidden = false;
            self.lblContinueCoinNum.hidden = false;
            self.btnRandomContinueYes.hidden = false;
//            self.btnRandomContinueNo.hidden = false; // todo temp delete 2015/06/04
            self.imgContinueCoin.hidden = false;
            self.btnRandomStart.hidden = false;
            self.lblMessageForAD.hidden = false;

            self.btnRandomStart.center = CGPointMake(SCREEN_WIDTH - btnRandomStart.frame.size.width/2, dY11)
            self.btnRandomStart.bounds.size = CGSizeMake(CGFloat(width), CGFloat(height))
            self.btnPlay.center = CGPointMake(SCREEN_WIDTH - btnPlay.frame.size.width/2, dY12)
            self.btnPlay.bounds.size = CGSizeMake(CGFloat(width), CGFloat(height))
            self.btnContinue.center = CGPointMake(SCREEN_WIDTH - btnContinue.frame.size.width/2, dY13)
            self.btnContinue.bounds.size = CGSizeMake(CGFloat(width), CGFloat(height))
            self.btnScore.center = CGPointMake(0 + CGFloat(widthScore/2), dY14)
            self.btnScore.bounds.size = CGSizeMake(CGFloat(widthScore), CGFloat(height))
            self.lblMessageForAD.center = CGPointMake(ScaleLogic.LblMessageForAD_X(self.SCREEN_WIDTH), ScaleLogic.LblMessageForAD_Y(self.SCREEN_WIDTH))
        }
        else
        {
            //println("still normal")
            self.lblRandomStageNum.hidden = true;
            self.lblContinueCoinNum.hidden = true;
            self.btnRandomContinueYes.hidden = true;
//            self.btnRandomContinueNo.hidden = true; // todo temp delete 2015/06/01
            self.imgContinueCoin.hidden = true;
            self.btnRandomStart.hidden = true;
            self.lblMessageForAD.hidden = true;
            
            self.btnPlay.center = CGPointMake(SCREEN_WIDTH - btnPlay.frame.size.width/2, dY22)
            self.btnPlay.bounds.size = CGSizeMake(CGFloat(width), CGFloat(height))
            self.btnContinue.center = CGPointMake(SCREEN_WIDTH - btnContinue.frame.size.width/2, dY23)
            self.btnContinue.bounds.size = CGSizeMake(CGFloat(width), CGFloat(height))
            self.btnScore.center = CGPointMake(0 + CGFloat(widthScore/2), dY24)
            self.btnScore.bounds.size = CGSizeMake(CGFloat(widthScore), CGFloat(height))
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    let MAX_SCORE_NUM:Int = 5

    func BackToTitle() {
        continueMode = 0
        setupFirst = false
        randomMode = false
    }

	func GetSaveDataForRandom() {
        //println("GetSaveDataForRandom")
        // ビルド環境にあるファイルを読み込むフォルダ
        var ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var data:String? = ud.valueForKey("progressRandomLevel") as? String
        if (data != nil) { if (data! != "") { self.progressRandomLevel = data!.toInt()! } }
        var data2:String? = ud.valueForKey("continueCoin") as? String
        if (data2 != nil ) { if (data2! != "") { self.continueCoin = data2!.toInt()! } }
	}
    func GetSaveData() {
        // ビルド環境にあるファイルを読み込むフォルダ
        var ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
		var MAX_NUM = 9;
        
        var fixString:String = "progressStage";
        var data1_1_1:String? = ud.valueForKey("progressStage1_1_1") as? String
        var data1_1_2:String? = ud.valueForKey("progressStage1_1_2") as? String
        var data1_1_3:String? = ud.valueForKey("progressStage1_1_3") as? String
        var data1_1:String? = ud.valueForKey("completeStage1_1") as? String
        
        var data1_2_1:String? = ud.valueForKey("progressStage1_2_1") as? String
        var data1_2_2:String? = ud.valueForKey("progressStage1_2_2") as? String
        var data1_2_3:String? = ud.valueForKey("progressStage1_2_3") as? String
        var data1_2:String? = ud.valueForKey("completeStage1_2") as? String
        
        var data1_3_1:String? = ud.valueForKey("progressStage1_3_1") as? String
        var data1_3_2:String? = ud.valueForKey("progressStage1_3_2") as? String
        var data1_3_3:String? = ud.valueForKey("progressStage1_3_3") as? String
        var data1_3:String? = ud.valueForKey("completeStage1_3") as? String
        
        var data1_4_1:String? = ud.valueForKey("progressStage1_4_1") as? String
        var data1_4_2:String? = ud.valueForKey("progressStage1_4_2") as? String
        var data1_4_3:String? = ud.valueForKey("progressStage1_4_3") as? String
        var data1_4_4:String? = ud.valueForKey("progressStage1_4_4") as? String
        var data1_4_5:String? = ud.valueForKey("progressStage1_4_5") as? String
        var data1_4:String? = ud.valueForKey("completeStage1_4") as? String
        
        var data1_5_1:String? = ud.valueForKey("progressStage1_5_1") as? String
        var data1_5_2:String? = ud.valueForKey("progressStage1_5_2") as? String
        var data1_5_3:String? = ud.valueForKey("progressStage1_5_3") as? String
        var data1_5:String? = ud.valueForKey("completeStage1_5") as? String
        
        var data1_6_1:String? = ud.valueForKey("progressStage1_6_1") as? String
        var data1_6_2:String? = ud.valueForKey("progressStage1_6_2") as? String
        var data1_6_3:String? = ud.valueForKey("progressStage1_6_3") as? String
        var data1_6_4:String? = ud.valueForKey("progressStage1_6_4") as? String
        var data1_6:String? = ud.valueForKey("completeStage1_6") as? String
        
        if (data1_1_1 != nil) { if (data1_1_1! == "1") { self.progressStage1_1_1 = 1 } }
        if (data1_1_2 != nil) { if (data1_1_2! == "1") { self.progressStage1_1_2 = 1 } }
        if (data1_1_3 != nil) { if (data1_1_3! == "1") { self.progressStage1_1_3 = 1 } }
        if (data1_1 != nil) { if (data1_1! == "1") { self.completeStage1_1 = 1 } }
        
        if (data1_2_1 != nil) { if (data1_2_1! == "1") { self.progressStage1_2_1 = 1 } }
        if (data1_2_2 != nil) { if (data1_2_2! == "1") { self.progressStage1_2_2 = 1 } }
        if (data1_2_3 != nil) { if (data1_2_3! == "1") { self.progressStage1_2_3 = 1 } }
        if (data1_2 != nil) { if (data1_2! == "1") { self.completeStage1_2 = 1 } }
        
        if (data1_3_1 != nil) { if (data1_3_1! == "1") { self.progressStage1_3_1 = 1 } }
        if (data1_3_2 != nil) { if (data1_3_2! == "1") { self.progressStage1_3_2 = 1 } }
        if (data1_3_3 != nil) { if (data1_3_3! == "1") { self.progressStage1_3_3 = 1 } }
        if (data1_3 != nil) { if (data1_3! == "1") { self.completeStage1_3 = 1 } }
        
        if (data1_4_1 != nil) { if (data1_4_1! == "1") { self.progressStage1_4_1 = 1 } }
        if (data1_4_2 != nil) { if (data1_4_2! == "1") { self.progressStage1_4_2 = 1 } }
        if (data1_4_3 != nil) { if (data1_4_3! == "1") { self.progressStage1_4_3 = 1 } }
        if (data1_4_4 != nil) { if (data1_4_4! == "1") { self.progressStage1_4_4 = 1 } }
        if (data1_4_5 != nil) { if (data1_4_5! == "1") { self.progressStage1_4_5 = 1 } }
        if (data1_4 != nil) { if (data1_4! == "1") { self.completeStage1_4 = 1 } }
        
        if (data1_5_1 != nil) { if (data1_5_1! == "1") { self.progressStage1_5_1 = 1 } }
        if (data1_5_2 != nil) { if (data1_5_2! == "1") { self.progressStage1_5_2 = 1 } }
        if (data1_5_3 != nil) { if (data1_5_3! == "1") { self.progressStage1_5_3 = 1 } }
        if (data1_5 != nil) { if (data1_5! == "1") { self.completeStage1_5 = 1 } }
        
        if (data1_6_1 != nil) { if (data1_6_1! == "1") { self.progressStage1_6_1 = 1 } }
        if (data1_6_2 != nil) { if (data1_6_2! == "1") { self.progressStage1_6_2 = 1 } }
        if (data1_6_3 != nil) { if (data1_6_3! == "1") { self.progressStage1_6_3 = 1 } }
        if (data1_6_4 != nil) { if (data1_6_4! == "1") { self.progressStage1_6_4 = 1 } }
        if (data1_6 != nil) { if (data1_6! == "1") { self.completeStage1_6 = 1 } }

		// Stage 2 (ENHANCE-A)
        var dataList:[String] = [];
        for (var ii = 1; ii <= MAX_NUM; ii++) {
            var data:String? = ud.valueForKey("\(fixString)2_1_\(ii)") as? String
            if (data != nil && data! == "1") { self.progressStage2_1[ii] = 1 }
        }
        var data2_1:String? = ud.valueForKey("completeStage2_1") as? String
        if (data2_1 != nil && data2_1! == "1") { self.completeStage2[0] = 1 }
		// add end (ENHANCE-A)

        var data_availRandom:String? = ud.valueForKey("availableRandom") as? String
        if (data_availRandom == nil) { /*println("no availableRandom")*/ }
        else { if (data_availRandom == "1") { self.availableRandom = 1 }}
        if (self.availableRandom == 0) { self.btnRandomStart.hidden = true; }
        else { self.btnRandomStart.hidden = false; }
    }
    
    func DetectTopScore(currentScore:Int, additional:String) -> Bool {
        // ビルド環境にあるファイルを読み込むフォルダ
        var ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        // 実機環境を想定したファイルを読み込むフォルダ
        var score0:String = ""
        var score1:String = ""
        var score2:String = ""
        var score3:String = ""
        var score4:String = ""
        var current:AnyObject? = ud.valueForKey("Score\(additional)0")
        if (current != nil) { score0 = current as! String }
        current = ud.valueForKey("Score\(additional)1")
        if (current != nil) { score1 = current as! String }
        current = ud.valueForKey("Score\(additional)2")
        if (current != nil) { score2 = current as! String }
        current = ud.valueForKey("Score\(additional)3")
        if (current != nil) { score3 = current as! String }
        current = ud.valueForKey("Score\(additional)4")
        if (current != nil) { score4 = current as! String }
        
        var sS:[Int] = [0, 0, 0, 0, 0]
        if (score0 != "") { sS[0] = score0.toInt()!; }
        if (score1 != "") { sS[1] = score1.toInt()!; }
        if (score2 != "") { sS[2] = score2.toInt()!; }
        if (score3 != "") { sS[3] = score3.toInt()!; }
        if (score4 != "") { sS[4] = score4.toInt()!; }
        
        // bubble sort
        for (var ii:Int = 0; ii < 4; ii++)
        {
            for (var jj:Int = ii + 1; jj < 5; jj++)
            {
                if (sS[jj] > sS[ii])
                {
                    var tmp: Int = sS[jj]
                    sS[jj] = sS[ii]
                    sS[ii] = tmp
                }
            }
        }
        
        if (currentScore >= sS[0])
        {
            //println("update high score detect. \(currentScore)  \(sS[0])")
            return true;
        }
        
        //println("update high score fail. \(currentScore)  \(sS[0])")
        return false;
    }
    
    func authenticateAchievement(identify: String) {
        var localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler =
            { (viewController : UIViewController!, error : NSError!) -> Void in
                if viewController != nil
                {
                    // ランダムプレイ中のため、プレイヤーに新規入力はさせない（新規入力は最初のscoreで）
                    //self.presentViewController(viewController, animated:true, completion: nil)
                    return;
                }
                else
                {
                    if GKLocalPlayer.localPlayer().authenticated {
                        let gkAchievement = GKAchievement(identifier: identify)
                        gkAchievement.percentComplete = 100.0
                        gkAchievement.showsCompletionBanner = true
                        GKAchievement.reportAchievements([gkAchievement], withCompletionHandler: {(error) -> Void in
                        })
                    }
                }
        }
    }
    
    func authenticateLocalPlayer()
    {
        //println("authenticateLocalPlayer start")
        if (self.updateHighScore > 0) {
            if (self.DetectTopScore(self.updateHighScore, additional:self.updateHighScoreAdditional)) {
                //println("authenticateLocalPlayer updating")
                var localPlayer = GKLocalPlayer.localPlayer()
                
                localPlayer.authenticateHandler =
                    { (viewController : UIViewController!, error : NSError!) -> Void in
                        if viewController != nil
                        {
                            self.presentViewController(viewController, animated:true, completion: nil)
                        }
                        else
                        {
                            if GKLocalPlayer.localPlayer().authenticated {
                                var targetIdentifier:String = "MaxScore"
                                if (self.updateHighScoreAdditional == "Random")
                                {
                                    targetIdentifier = "MAXRANDOMSCORE"
                                }
                                let gkScore = GKScore(leaderboardIdentifier: targetIdentifier)
                                //println("GKScore: \(self.updateHighScore)")
                                gkScore.value = Int64(self.updateHighScore)
                                GKScore.reportScores([gkScore], withCompletionHandler: {(error) -> Void in
                                })
                                
                                self.updateHighScore = 0;
                                self.updateHighScoreAdditional = ""
                            }
                        }
                }
            } else {
                //println("authenticateLocalPlayer end 2")
            }
        }
        else
        {
            //println("authenticateLocalPlayer end 1")
        }

    }

	func UpdateScoreData(score:Int, bonusA:Int, bonusB:Int, nameAdditional:String, scene:Int) {
        // ビルド環境にあるファイルを読み込むフォルダ
        var ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()

		// add start [ENHANCE-A]
		var sceneStr:String = ""
		if (scene == 1) {
			// シーン１はセーブ情報にナンバリングが存在しないため、空文字のまま
		} else {
			sceneStr = "\(scene)-"
		}
		// add end [ENHANCE-A]

        // 実機環境を想定したファイルを読み込むフォルダ
        var currentScoreData:String = String(score)
        var score0:String? = ud.valueForKey("Score\(nameAdditional)\(sceneStr)0") as? String // change [ENHANCE-A]
        var score1:String? = ud.valueForKey("Score\(nameAdditional)\(sceneStr)1") as? String // change [ENHANCE-A]
        var score2:String? = ud.valueForKey("Score\(nameAdditional)\(sceneStr)2") as? String // change [ENHANCE-A]
        var score3:String? = ud.valueForKey("Score\(nameAdditional)\(sceneStr)3") as? String // change [ENHANCE-A]
        var score4:String? = ud.valueForKey("Score\(nameAdditional)\(sceneStr)4") as? String // change [ENHANCE-A]
        var minStr:String = "Score\(nameAdditional)\(sceneStr)0" // 万が一失敗した場合は0番目を対象とする。 // change [ENHANCE-A]
        var minBonusA:String = "BonusA\(nameAdditional)\(sceneStr)0" // 上記同様 // change [ENHANCE-A]
        var minBonusB:String = "BonusB\(nameAdditional)\(sceneStr)0" // 上記同様 // change [ENHANCE-A]

        if (score0 == nil) {
            minStr = "Score\(nameAdditional)\(sceneStr)0" // change [ENHANCE-A]
            minBonusA = "BonusA\(nameAdditional)\(sceneStr)0" // change [ENHANCE-A]
            minBonusB = "BonusB\(nameAdditional)\(sceneStr)0" // change [ENHANCE-A]
        }
        else if (score1 == nil) {
            minStr = "Score\(nameAdditional)\(sceneStr)1" // change [ENHANCE-A]
            minBonusA = "BonusA\(nameAdditional)\(sceneStr)1" // change [ENHANCE-A]
            minBonusB = "BonusB\(nameAdditional)\(sceneStr)1" // change [ENHANCE-A]
        }
        else if (score2 == nil) {
            minStr = "Score\(nameAdditional)\(sceneStr)2" // change [ENHANCE-A]
            minBonusA = "BonusA\(nameAdditional)\(sceneStr)2" // change [ENHANCE-A]
            minBonusB = "BonusB\(nameAdditional)\(sceneStr)2" // change [ENHANCE-A]
        }
        else if (score3 == nil) {
            minStr = "Score\(nameAdditional)\(sceneStr)3" // change [ENHANCE-A]
            minBonusA = "BonusA\(nameAdditional)\(sceneStr)3" // change [ENHANCE-A]
            minBonusB = "BonusB\(nameAdditional)\(sceneStr)3" // change [ENHANCE-A]
        }
        else if (score4 == nil) {
            minStr = "Score\(nameAdditional)\(sceneStr)4" // change [ENHANCE-A]
            minBonusA = "BonusA\(nameAdditional)\(sceneStr)4" // change [ENHANCE-A]
            minBonusB = "BonusB\(nameAdditional)\(sceneStr)4" // change [ENHANCE-A]
        }
        else {
            var s0:Int = score0!.toInt()!
            var s1:Int = score1!.toInt()!
            var s2:Int = score2!.toInt()!
            var s3:Int = score3!.toInt()!
            var s4:Int = score4!.toInt()!
            var minValue = min(s0, min(s1, min(s2, min(s3, s4))))
            if (score < minValue) {
                return; // ５位より低いため、何もせず終了
            }
            if (minValue == s0) { minStr = "Score\(nameAdditional)\(sceneStr)0"; minBonusA = "BonusA\(nameAdditional)\(sceneStr)0"; minBonusB = "BonusB\(nameAdditional)\(sceneStr)0"; } // change [ENHANCE-A]
            else if (minValue == s1) { minStr = "Score\(nameAdditional)\(sceneStr)1"; minBonusA = "BonusA\(nameAdditional)\(sceneStr)1"; minBonusB = "BonusB\(nameAdditional)\(sceneStr)1"; } // change [ENHANCE-A]
            else if (minValue == s2) { minStr = "Score\(nameAdditional)\(sceneStr)2"; minBonusA = "BonusA\(nameAdditional)\(sceneStr)2"; minBonusB = "BonusB\(nameAdditional)\(sceneStr)2"; } // change [ENHANCE-A]
            else if (minValue == s3) { minStr = "Score\(nameAdditional)\(sceneStr)3"; minBonusA = "BonusA\(nameAdditional)\(sceneStr)3"; minBonusB = "BonusB\(nameAdditional)\(sceneStr)3"; } // change [ENHANCE-A]
            else if (minValue == s4) { minStr = "Score\(nameAdditional)\(sceneStr)4"; minBonusA = "BonusA\(nameAdditional)\(sceneStr)4"; minBonusB = "BonusB\(nameAdditional)\(sceneStr)4"; } // change [ENHANCE-A]
            else { return; } // 万が一の場合、何もしない。
        }
        ud.setValue(currentScoreData, forKey: minStr)
        ud.setValue((String)(bonusA), forKey: minBonusA)
        ud.setValue((String)(bonusB), forKey: minBonusB)
        ud.synchronize()
      
	}

    func UpdateSaveDataForRandom(score:Int, bonusA:Int, bonusB:Int, randomStageNumber:Int, scene:Int) {
        //println("UpdateSaveDataForRandom Start: \(randomStageNumber)")
        UpdateScoreData(score, bonusA:bonusA, bonusB:bonusB, nameAdditional:"Random", scene:scene) // change [ENHANCE-A]

		// ステージクリア情報を更新
        var ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var savedata:Int = 0
        var data:String? = ud.valueForKey("progressRandomLevel") as? String
        if (data != nil)
        {
            //println("UpdateSaveDataForRandom: not nil")
            if (data! != "")
            {
                savedata = data!.toInt()!
                //println("UpdateSaveDataForRandom: not empty: \(savedata)")
            } else {
                //println("UpdateSaveDataForRandom: is empty")
            }
        } else {
            //println("UpdateSaveDataForRandom: nil")
        }

        if (savedata <= randomStageNumber)
        {
            //println("UpdateSaveDataForRandom: setValue: \(randomStageNumber)")
            var flag:String = String(randomStageNumber)
            ud.setValue(flag, forKey: "progressRandomLevel")
            ud.synchronize()
        }
	}

    func UpdateSaveData(score:Int, bonusA:Int, bonusB:Int, scene:Int) {
		UpdateScoreData(score, bonusA:bonusA, bonusB:bonusB, nameAdditional:"", scene:scene) // change [ENHANCE-A]
        
        // ステージクリア情報を更新
        var ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var flag:String = String(progressStage1_1_1)
        ud.setValue(flag, forKey: "progressStage1_1_1")
        flag = String(progressStage1_1_2)
        ud.setValue(flag, forKey: "progressStage1_1_2")
        flag = String(progressStage1_1_3)
        ud.setValue(flag, forKey: "progressStage1_1_3")
        
        flag = String(progressStage1_2_1)
        ud.setValue(flag, forKey: "progressStage1_2_1")
        flag = String(progressStage1_2_2)
        ud.setValue(flag, forKey: "progressStage1_2_2")
        flag = String(progressStage1_2_3)
        ud.setValue(flag, forKey: "progressStage1_2_3")
        
        flag = String(progressStage1_3_1)
        ud.setValue(flag, forKey: "progressStage1_3_1")
        flag = String(progressStage1_3_2)
        ud.setValue(flag, forKey: "progressStage1_3_2")
        flag = String(progressStage1_3_3)
        ud.setValue(flag, forKey: "progressStage1_3_3")
        
        flag = String(progressStage1_4_1)
        ud.setValue(flag, forKey: "progressStage1_4_1")
        flag = String(progressStage1_4_2)
        ud.setValue(flag, forKey: "progressStage1_4_2")
        flag = String(progressStage1_4_3)
        ud.setValue(flag, forKey: "progressStage1_4_3")
        flag = String(progressStage1_4_4)
        ud.setValue(flag, forKey: "progressStage1_4_4")
        flag = String(progressStage1_4_5)
        ud.setValue(flag, forKey: "progressStage1_4_5")
        
        flag = String(progressStage1_5_1)
        ud.setValue(flag, forKey: "progressStage1_5_1")
        flag = String(progressStage1_5_2)
        ud.setValue(flag, forKey: "progressStage1_5_2")
        flag = String(progressStage1_5_3)
        ud.setValue(flag, forKey: "progressStage1_5_3")
        
        flag = String(progressStage1_6_1)
        ud.setValue(flag, forKey: "progressStage1_6_1")
        flag = String(progressStage1_6_2)
        ud.setValue(flag, forKey: "progressStage1_6_2")
        flag = String(progressStage1_6_3)
        ud.setValue(flag, forKey: "progressStage1_6_3")
        flag = String(progressStage1_6_4)
        ud.setValue(flag, forKey: "progressStage1_6_4")
        
        flag = String(completeStage1_1)
        ud.setValue(flag, forKey: "completeStage1_1")
        flag = String(completeStage1_2)
        ud.setValue(flag, forKey: "completeStage1_2")
        flag = String(completeStage1_3)
        ud.setValue(flag, forKey: "completeStage1_3")
        flag = String(completeStage1_4)
        ud.setValue(flag, forKey: "completeStage1_4")
        flag = String(completeStage1_5)
        ud.setValue(flag, forKey: "completeStage1_5")
        flag = String(completeStage1_6)
        ud.setValue(flag, forKey: "completeStage1_6")
        
		// add start [ENHANCE-A]
        for (var ii:Int = 0; ii < self.progressStage2_1.count; ii++) {
	        var flag:String = String(progressStage2_1[ii])
	        ud.setValue(flag, forKey: "progressStage2_1_\(ii+1)")
		}
        for (var ii:Int = 0; ii < self.progressStage2_2.count; ii++) {
	        var flag:String = String(progressStage2_2[ii])
	        ud.setValue(flag, forKey: "progressStage2_2_\(ii+1)")
		}
        for (var ii:Int = 0; ii < self.progressStage2_3.count; ii++) {
	        var flag:String = String(progressStage2_3[ii])
	        ud.setValue(flag, forKey: "progressStage2_3_\(ii+1)")
		}
        for (var ii:Int = 0; ii < progressStage2_4.count; ii++) {
	        var flag:String = String(progressStage2_4[ii])
	        ud.setValue(flag, forKey: "progressStage2_4_\(ii+1)")
		}
        for (var ii:Int = 0; ii < progressStage2_5.count; ii++) {
	        var flag:String = String(progressStage2_5[ii])
	        ud.setValue(flag, forKey: "progressStage2_5_\(ii+1)")
		}
        for (var ii:Int = 0; ii < progressStage2_6.count; ii++) {
	        var flag:String = String(progressStage2_6[ii])
	        ud.setValue(flag, forKey: "progressStage2_6_\(ii+1)")
		}
        for (var ii:Int = 0; ii < completeStage2.count; ii++) {
	        var flag:String = String(completeStage2[ii])
	        ud.setValue(flag, forKey: "completeStage2_\(ii+1)")
		}
		// end start [ENHANCE-A]

        // クリア状況を示すフラグを更新
        var availRandomFlag:String = String(availableRandom)
        //println("availRandomFlag \(availRandomFlag)")
        ud.setValue(availRandomFlag, forKey: "availableRandom")
        
        ud.synchronize()
    }

}

