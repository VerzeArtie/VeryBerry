//
//  ViewScoreController.swift
//  VeryBerry
//
//  Created by Summer on 2015/01/28.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit

class ViewScoreController:UIViewController {
    var imgBack_score :UIImageView! = nil
    var parent: ViewController! = nil
	var viewRandomMode: Bool = false

	@IBOutlet var lblRankNumber: UILabel!
	@IBOutlet var imgRankMedal: UIImageView!
	@IBOutlet var lblRankScore: UILabel!
	@IBOutlet var imgRankBonusA: UIImageView!
	@IBOutlet var imgRankBonusB: UIImageView!
    @IBOutlet var imgMedalRandom1: UIImageView!
    @IBOutlet var imgMedalRandom2: UIImageView!
    @IBOutlet var imgMedalRandom3: UIImageView!
    @IBOutlet var imgMedalRandom4: UIImageView!
    @IBOutlet var imgMedalRandom5: UIImageView!
    @IBOutlet var lblFifthBonusBRandom: UILabel!
    @IBOutlet var lblFourthBonusBRandom: UILabel!
    @IBOutlet var lblThirdBonusBRandom: UILabel!
    @IBOutlet var lblSecondBonusBRandom: UILabel!
    @IBOutlet var lblTopBonusBRandom: UILabel!
    @IBOutlet var lblFifthBonusARandom: UILabel!
    @IBOutlet var lblFourthBonusARandom: UILabel!
    @IBOutlet var lblThirdBonusARandom: UILabel!
    @IBOutlet var lblSecondBonusARandom: UILabel!
    @IBOutlet var lblTopBonusARandom: UILabel!
    @IBOutlet var lblFifthScoreRandom: UILabel!
    @IBOutlet var lblFourthScoreRandom: UILabel!
    @IBOutlet var lblThirdScoreRandom: UILabel!
    @IBOutlet var lblSecondScoreRandom: UILabel!
    @IBOutlet var lblTopScoreRandom: UILabel!
	@IBOutlet var lblStageMode: UILabel!
    @IBOutlet var imgMedal1: UIImageView!
    @IBOutlet var imgMedal2: UIImageView!
    @IBOutlet var imgMedal3: UIImageView!
    @IBOutlet var imgMedal4: UIImageView!
    @IBOutlet var imgMedal5: UIImageView!
    @IBOutlet var lblFifthBonusB: UILabel!
    @IBOutlet var lblFourthBonusB: UILabel!
    @IBOutlet var lblThirdBonusB: UILabel!
    @IBOutlet var lblSecondBonusB: UILabel!
    @IBOutlet var lblTopBonusB: UILabel!
    @IBOutlet var lblFifthBonusA: UILabel!
    @IBOutlet var lblFourthBonusA: UILabel!
    @IBOutlet var lblThirdBonusA: UILabel!
    @IBOutlet var lblSecondBonusA: UILabel!
    @IBOutlet var lblTopBonusA: UILabel!
    @IBOutlet var lblFifthScore: UILabel!
    @IBOutlet var lblFourthScore: UILabel!
    @IBOutlet var lblThirdScore: UILabel!
    @IBOutlet var lblSecondScore: UILabel!
    @IBOutlet var lblTopScore: UILabel!
    @IBOutlet var lblCharaFifth: UILabel!
    @IBOutlet var lblCharaFourth: UILabel!
    @IBOutlet var lblCharaThird: UILabel!
    @IBOutlet var lblCharaSecond: UILabel!
    @IBOutlet var lblCharaFirst: UILabel!
	@IBOutlet var lblRandomMode: UILabel!
    
    func ViewSaveData(additional:String, scene:Int) {
        // ビルド環境にあるファイルを読み込むフォルダ
        let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()

		// add start [ENHANCE-A]
		var sceneStr:String = ""
		if (scene == 1) {
			// シーン１はセーブ情報にナンバリングが存在しないため、空文字のまま
		} else {
			sceneStr = "\(scene)-"
		}
		// add end [ENHANCE-A]

        // 実機環境を想定したファイルを読み込むフォルダ
        var score0:String = ""
        var score1:String = ""
        var score2:String = ""
        var score3:String = ""
        var score4:String = ""
        var bonusAList:[String] = ["", "", "", "", ""]
        var bonusBList:[String] = ["", "", "", "", ""]
        var current:AnyObject? = ud.valueForKey("Score\(additional)\(sceneStr)0") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { score0 = current as! String }
        current = ud.valueForKey("BonusA\(additional)\(sceneStr)0") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusAList[0] = current as! String }
        current = ud.valueForKey("BonusB\(additional)\(sceneStr)0") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusBList[0] = current as! String }
        
        current = ud.valueForKey("Score\(additional)\(sceneStr)1") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { score1 = current as! String }
        current = ud.valueForKey("BonusA\(additional)\(sceneStr)1") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusAList[1] = current as! String }
        current = ud.valueForKey("BonusB\(additional)\(sceneStr)1") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusBList[1] = current as! String }
        
        current = ud.valueForKey("Score\(additional)\(sceneStr)2") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { score2 = current as! String }
        current = ud.valueForKey("BonusA\(additional)\(sceneStr)2") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusAList[2] = current as! String }
        current = ud.valueForKey("BonusB\(additional)\(sceneStr)2") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusBList[2] = current as! String }
        
        current = ud.valueForKey("Score\(additional)\(sceneStr)3") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { score3 = current as! String }
        current = ud.valueForKey("BonusA\(additional)\(sceneStr)3") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusAList[3] = current as! String }
        current = ud.valueForKey("BonusB\(additional)\(sceneStr)3") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusBList[3] = current as! String }
        
        current = ud.valueForKey("Score\(additional)\(sceneStr)4") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { score4 = current as! String }
        current = ud.valueForKey("BonusA\(additional)\(sceneStr)4") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusAList[4] = current as! String }
        current = ud.valueForKey("BonusB\(additional)\(sceneStr)4") // change 2015/06/15 [ENHANCE-A]
        if (current != nil) { bonusBList[4] = current as! String }
        
        var sS:[Int] = [0, 0, 0, 0, 0]
        var bA:[Int] = [0, 0, 0, 0, 0]
        var bB:[Int] = [0, 0, 0, 0, 0]
        if (score0 != "") { sS[0] = Int(score0)!; bA[0] = Int(bonusAList[0])!; bB[0] = Int(bonusBList[0])!; }
        if (score1 != "") { sS[1] = Int(score1)!; bA[1] = Int(bonusAList[1])!; bB[1] = Int(bonusBList[1])!; }
        if (score2 != "") { sS[2] = Int(score2)!; bA[2] = Int(bonusAList[2])!; bB[2] = Int(bonusBList[2])!; }
        if (score3 != "") { sS[3] = Int(score3)!; bA[3] = Int(bonusAList[3])!; bB[3] = Int(bonusBList[3])!; }
        if (score4 != "") { sS[4] = Int(score4)!; bA[4] = Int(bonusAList[4])!; bB[4] = Int(bonusBList[4])!; }
        
        // bubble sort
        for (var ii:Int = 0; ii < 4; ii++)
        {
            for (var jj:Int = ii + 1; jj < 5; jj++)
            {
                if (sS[jj] > sS[ii])
                {
                    let tmp: Int = sS[jj]
                    let tmp2: Int = bA[jj]
                    let tmp3: Int = bB[jj]
                    sS[jj] = sS[ii]
                    bA[jj] = bA[ii]
                    bB[jj] = bB[ii]
                    sS[ii] = tmp
                    bA[ii] = tmp2
                    bB[ii] = tmp3
                }
            }
        }
        var lblS1 = lblTopScore; if (additional != "") { lblS1 = lblTopScoreRandom; }
        var lblS2 = lblSecondScore; if (additional != "") { lblS2 = lblSecondScoreRandom; }
        var lblS3 = lblThirdScore; if (additional != "") { lblS3 = lblThirdScoreRandom; }
        var lblS4 = lblFourthScore; if (additional != "") { lblS4 = lblFourthScoreRandom; }
        var lblS5 = lblFifthScore; if (additional != "") { lblS5 = lblFifthScoreRandom; }
        var lblA1 = lblTopBonusA; if (additional != "") { lblA1 = lblTopBonusARandom; }
        var lblA2 = lblSecondBonusA; if (additional != "") { lblA2 = lblSecondBonusARandom; }
        var lblA3 = lblThirdBonusA; if (additional != "") { lblA3 = lblThirdBonusARandom; }
        var lblA4 = lblFourthBonusA; if (additional != "") { lblA4 = lblFourthBonusARandom; }
        var lblA5 = lblFifthBonusA; if (additional != "") { lblA5 = lblFifthBonusARandom; }
        var lblB1 = lblTopBonusB; if (additional != "") { lblB1 = lblTopBonusBRandom; }
        var lblB2 = lblSecondBonusB; if (additional != "") { lblB2 = lblSecondBonusBRandom; }
        var lblB3 = lblThirdBonusB; if (additional != "") { lblB3 = lblThirdBonusBRandom; }
        var lblB4 = lblFourthBonusB; if (additional != "") { lblB4 = lblFourthBonusBRandom; }
        var lblB5 = lblFifthBonusB; if (additional != "") { lblB5 = lblFifthBonusBRandom; }
        var imgM1 = imgMedal1; if (additional != "") { imgM1 = imgMedalRandom1; }
        var imgM2 = imgMedal2; if (additional != "") { imgM2 = imgMedalRandom2; }
        var imgM3 = imgMedal3; if (additional != "") { imgM3 = imgMedalRandom3; }
        var imgM4 = imgMedal4; if (additional != "") { imgM4 = imgMedalRandom4; }
        var imgM5 = imgMedal5; if (additional != "") { imgM5 = imgMedalRandom5; }
        
        lblS1.text = String(sS[0])
        lblS2.text = String(sS[1])
        lblS3.text = String(sS[2])
        lblS4.text = String(sS[3])
        lblS5.text = String(sS[4])
        lblA1.text = String(bA[0])
        lblA2.text = String(bA[1])
        lblA3.text = String(bA[2])
        lblA4.text = String(bA[3])
        lblA5.text = String(bA[4])
        lblB1.text = String(bB[0])
        lblB2.text = String(bB[1])
        lblB3.text = String(bB[2])
        lblB4.text = String(bB[3])
        lblB5.text = String(bB[4])
        SetupMedal(imgM1, value: sS[0])
        SetupMedal(imgM2, value: sS[1])
        SetupMedal(imgM3, value: sS[2])
        SetupMedal(imgM4, value: sS[3])
        SetupMedal(imgM5, value: sS[4])
    }
    
    func SetupMedal(img:UIImageView, value:Int) {
        if (value >= 500000)
        {
            img.image = UIImage(named: "app_icon_pt_medal.png")
        }
        else if (value >= 100000)
        {
            img.image = UIImage(named: "app_icon_au_medal.png")
        }
        else if (value >= 20000)
        {
            img.image = UIImage(named: "app_icon_ag_medal.png")
        }
        else if (value > 2500)
        {
            img.image = UIImage(named: "app_icon_cu_medal.png")
        }
        else
        {
            // no medal
        }
    }

	// add start [ENHANCE-A]
	@IBAction func TapSceneButton(sender: AnyObject) {
        ViewSaveData("", scene:sender.tag)
	}
	// add end [ENHANCE-A]

    override func viewDidLoad() {
        // delete [ENHANCE-A]
//        if (self.parent.availableRandom == 1) {
//            self.lblStageMode.hidden = false
//        }
        ViewSaveData("", scene:1)
        ViewSaveData("Random", scene:1)
        super.viewDidLoad()
        if (self.imgBack_score == nil)
        {
            self.imgBack_score = UIImageView()
            self.imgBack_score.image = UIImage(named: "app-score.png")
            self.imgBack_score.frame = CGRect(x: 0, y: 0, width: parent.SCREEN_WIDTH, height: parent.SCREEN_HEIGHT)
            self.view.addSubview(self.imgBack_score)
            self.view.sendSubviewToBack(self.imgBack_score)
        }
    }

    override func viewDidLayoutSubviews() {
        SetupObjectLayout()
    }

    var dX1:CGFloat =  0;  var dX2:CGFloat = 0; var dX3:CGFloat = 0; var dX4:CGFloat = 0; var dX5:CGFloat = 0; var dX6:CGFloat = 0;
    var dY10:CGFloat =  0; var dY11:CGFloat = 0; var dY12:CGFloat = 0; var dY13:CGFloat = 0; var dY14:CGFloat = 0; var dY15:CGFloat = 0; var dY16:CGFloat = 0;
    func SetupObjectLayout() {
        if (self.parent.SCREEN_WIDTH == 736) { // maybe iPhone 6 plus
            dX1 = 50; dX2 = 160; dX3 = 350; dX4 = 560; dX5 = 650; dX6 = 368;
            dY10 = 80; dY11 = 120; dY12 = 175; dY13 = 230; dY14 = 285; dY15 = 340; dY16 = 390;
        } else if (self.parent.SCREEN_WIDTH == 667) { // maybe iPhone 6
            dX1 = 50; dX2 = 150; dX3 = 280; dX4 = 490; dX5 = 580; dX6 = 334;
            dY10 = 70; dY11 = 100; dY12 = 150; dY13 = 200; dY14 = 250; dY15 = 300; dY16 = 350;
        } else if (self.parent.SCREEN_WIDTH == 568) { // maybe iPhone 5S
			dX1 = 50; dX2 = 140; dX3 = 230; dX4 = 400; dX5 = 490; dX6 = 284;
            dY10 = 70; dY11 = 100; dY12 = 140; dY13 = 180; dY14 = 220; dY15 = 260; dY16 = 300;
        } else if (self.parent.SCREEN_WIDTH == 480) { // maybe iPhone 4S
			dX1 = 50; dX2 = 120; dX3 = 180; dX4 = 330; dX5 = 400; dX6 = 240;
			dY10 = 70; dY11 = 100; dY12 = 140; dY13 = 180; dY14 = 220; dY15 = 260; dY16 = 300;
        }

		// ＜ステージモード＞
		// RANK表示文字
		self.lblRankNumber.center = CGPointMake(dX1, dY10);
        self.lblCharaFirst.center = CGPointMake(dX1, dY11);
        self.lblCharaSecond.center = CGPointMake(dX1, dY12);
        self.lblCharaThird.center = CGPointMake(dX1, dY13);
        self.lblCharaFourth.center = CGPointMake(dX1, dY14);
        self.lblCharaFifth.center = CGPointMake(dX1, dY15);
		// 称号マーク
//		self.imgRankMedal.center = CGPointMake(dX2, dY10);
		self.imgMedal1.center = CGPointMake(dX2, dY11);
		self.imgMedal2.center = CGPointMake(dX2, dY12);
		self.imgMedal3.center = CGPointMake(dX2, dY13);
		self.imgMedal4.center = CGPointMake(dX2, dY14);
		self.imgMedal5.center = CGPointMake(dX2, dY15);
		// ハイスコア
		self.lblRankScore.center = CGPointMake(dX3, dY10);
        self.lblTopScore.center = CGPointMake(dX3, dY11);
        self.lblSecondScore.center = CGPointMake(dX3, dY12);
        self.lblThirdScore.center = CGPointMake(dX3, dY13);
        self.lblFourthScore.center = CGPointMake(dX3, dY14);
        self.lblFifthScore.center = CGPointMake(dX3, dY15);
		// ハイボーナスA
		self.imgRankBonusA.center = CGPointMake(dX4, dY10);
        self.lblTopBonusA.center = CGPointMake(dX4, dY11);
        self.lblSecondBonusA.center = CGPointMake(dX4, dY12);
        self.lblThirdBonusA.center = CGPointMake(dX4, dY13);
        self.lblFourthBonusA.center = CGPointMake(dX4, dY14);
        self.lblFifthBonusA.center = CGPointMake(dX4, dY15);
		// ハイボーナスB
		self.imgRankBonusB.center = CGPointMake(dX5, dY10);
        self.lblTopBonusB.center = CGPointMake(dX5, dY11);
        self.lblSecondBonusB.center = CGPointMake(dX5, dY12);
        self.lblThirdBonusB.center = CGPointMake(dX5, dY13);
        self.lblFourthBonusB.center = CGPointMake(dX5, dY14);
        self.lblFifthBonusB.center = CGPointMake(dX5, dY15);
		// ステージモード
		self.lblStageMode.center = CGPointMake(dX6, dY16);

		// ＜ランダムモード＞
		// 称号マーク
		self.imgMedalRandom1.center = CGPointMake(dX2+self.parent.SCREEN_WIDTH, dY11);
		self.imgMedalRandom2.center = CGPointMake(dX2+self.parent.SCREEN_WIDTH, dY12);
		self.imgMedalRandom3.center = CGPointMake(dX2+self.parent.SCREEN_WIDTH, dY13);
		self.imgMedalRandom4.center = CGPointMake(dX2+self.parent.SCREEN_WIDTH, dY14);
		self.imgMedalRandom5.center = CGPointMake(dX2+self.parent.SCREEN_WIDTH, dY15);
		// ハイスコア
        self.lblTopScoreRandom.center = CGPointMake(dX3+self.parent.SCREEN_WIDTH, dY11);
        self.lblSecondScoreRandom.center = CGPointMake(dX3+self.parent.SCREEN_WIDTH, dY12);
        self.lblThirdScoreRandom.center = CGPointMake(dX3+self.parent.SCREEN_WIDTH, dY13);
        self.lblFourthScoreRandom.center = CGPointMake(dX3+self.parent.SCREEN_WIDTH, dY14);
        self.lblFifthScoreRandom.center = CGPointMake(dX3+self.parent.SCREEN_WIDTH, dY15);
		// ハイボーナスA
        self.lblTopBonusARandom.center = CGPointMake(dX4+self.parent.SCREEN_WIDTH, dY11);
        self.lblSecondBonusARandom.center = CGPointMake(dX4+self.parent.SCREEN_WIDTH, dY12);
        self.lblThirdBonusARandom.center = CGPointMake(dX4+self.parent.SCREEN_WIDTH, dY13);
        self.lblFourthBonusARandom.center = CGPointMake(dX4+self.parent.SCREEN_WIDTH, dY14);
        self.lblFifthBonusARandom.center = CGPointMake(dX4+self.parent.SCREEN_WIDTH, dY15);
		// ハイボーナスB
        self.lblTopBonusBRandom.center = CGPointMake(dX5+self.parent.SCREEN_WIDTH, dY11);
        self.lblSecondBonusBRandom.center = CGPointMake(dX5+self.parent.SCREEN_WIDTH, dY12);
        self.lblThirdBonusBRandom.center = CGPointMake(dX5+self.parent.SCREEN_WIDTH, dY13);
        self.lblFourthBonusBRandom.center = CGPointMake(dX5+self.parent.SCREEN_WIDTH, dY14);
        self.lblFifthBonusBRandom.center = CGPointMake(dX5+self.parent.SCREEN_WIDTH, dY15);
		// ステージモード
		self.lblRandomMode.center = CGPointMake(dX6+self.parent.SCREEN_WIDTH, dY16);

    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		// if (self.parent.availableRandom != 0 && self.viewRandomMode == false) { // delete [ENHANCE-A]
        if (self.viewRandomMode == false) {
            self.viewRandomMode = true
			self.lblRandomMode.hidden = false;
			self.imgMedalRandom1.hidden = false;
			self.imgMedalRandom2.hidden = false;
			self.imgMedalRandom3.hidden = false;
			self.imgMedalRandom4.hidden = false;
			self.imgMedalRandom5.hidden = false;
			self.lblFifthBonusBRandom.hidden = false;
			self.lblFourthBonusBRandom.hidden = false;
			self.lblThirdBonusBRandom.hidden = false;
			self.lblSecondBonusBRandom.hidden = false;
			self.lblTopBonusBRandom.hidden = false;
			self.lblFifthBonusARandom.hidden = false;
			self.lblFourthBonusARandom.hidden = false;
			self.lblThirdBonusARandom.hidden = false;
			self.lblSecondBonusARandom.hidden = false;
			self.lblTopBonusARandom.hidden = false;
		    self.lblFifthScoreRandom.hidden = false;
		    self.lblFourthScoreRandom.hidden = false;
		    self.lblThirdScoreRandom.hidden = false;
		    self.lblSecondScoreRandom.hidden = false;
		    self.lblTopScoreRandom.hidden = false;
			UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
			    self.imgMedalRandom1.center = CGPoint(x: self.dX2, y: self.imgMedalRandom1.center.y)
			    self.imgMedalRandom2.center = CGPoint(x: self.dX2, y: self.imgMedalRandom2.center.y)
			    self.imgMedalRandom3.center = CGPoint(x: self.dX2, y: self.imgMedalRandom3.center.y)
			    self.imgMedalRandom4.center = CGPoint(x: self.dX2, y: self.imgMedalRandom4.center.y)
			    self.imgMedalRandom5.center = CGPoint(x: self.dX2, y: self.imgMedalRandom5.center.y)
                self.lblTopScoreRandom.center = CGPoint(x: self.dX3, y: self.lblTopScoreRandom.center.y)
                self.lblSecondScoreRandom.center = CGPoint(x: self.dX3, y: self.lblSecondScoreRandom.center.y)
                self.lblThirdScoreRandom.center = CGPoint(x: self.dX3, y: self.lblThirdScoreRandom.center.y)
                self.lblFourthScoreRandom.center = CGPoint(x: self.dX3, y: self.lblFourthScoreRandom.center.y)
                self.lblFifthScoreRandom.center = CGPoint(x: self.dX3, y: self.lblFifthScoreRandom.center.y)
                self.lblFifthBonusARandom.center = CGPoint(x: self.dX4, y: self.lblFifthBonusARandom.center.y)
                self.lblFourthBonusARandom.center = CGPoint(x: self.dX4, y: self.lblFourthBonusARandom.center.y)
                self.lblThirdBonusARandom.center = CGPoint(x: self.dX4, y: self.lblThirdBonusARandom.center.y)
                self.lblSecondBonusARandom.center = CGPoint(x: self.dX4, y: self.lblSecondBonusARandom.center.y)
                self.lblTopBonusARandom.center = CGPoint(x: self.dX4, y: self.lblTopBonusBRandom.center.y)
			    self.lblFifthBonusBRandom.center = CGPoint(x: self.dX5, y: self.lblFifthBonusBRandom.center.y)
			    self.lblFourthBonusBRandom.center = CGPoint(x: self.dX5, y: self.lblFourthBonusBRandom.center.y)
			    self.lblThirdBonusBRandom.center = CGPoint(x: self.dX5, y: self.lblThirdBonusBRandom.center.y)
			    self.lblSecondBonusBRandom.center = CGPoint(x: self.dX5, y: self.lblSecondBonusBRandom.center.y)
			    self.lblTopBonusBRandom.center = CGPoint(x: self.dX5, y: self.lblTopBonusBRandom.center.y)
                self.lblRandomMode.center = CGPoint(x: self.dX6, y: self.lblRandomMode.center.y)
                self.imgMedal1.center = CGPoint(x: -200, y: self.imgMedal1.center.y)
                self.imgMedal2.center = CGPoint(x: -200, y: self.imgMedal2.center.y)
                self.imgMedal3.center = CGPoint(x: -200, y: self.imgMedal3.center.y)
                self.imgMedal4.center = CGPoint(x: -200, y: self.imgMedal4.center.y)
                self.imgMedal5.center = CGPoint(x: -200, y: self.imgMedal5.center.y)
                self.lblFifthBonusB.center = CGPoint(x: -200, y: self.lblFifthBonusB.center.y)
                self.lblFourthBonusB.center = CGPoint(x: -200, y: self.lblFourthBonusB.center.y)
                self.lblThirdBonusB.center = CGPoint(x: -200, y: self.lblThirdBonusB.center.y)
                self.lblSecondBonusB.center = CGPoint(x: -200, y: self.lblSecondBonusB.center.y)
                self.lblTopBonusB.center = CGPoint(x: -200, y: self.lblTopBonusB.center.y)
                self.lblFifthBonusA.center = CGPoint(x: -200, y: self.lblFifthBonusA.center.y)
                self.lblFourthBonusA.center = CGPoint(x: -200, y: self.lblFourthBonusA.center.y)
                self.lblThirdBonusA.center = CGPoint(x: -200, y: self.lblThirdBonusA.center.y)
                self.lblSecondBonusA.center = CGPoint(x: -200, y: self.lblSecondBonusA.center.y)
                self.lblTopBonusA.center = CGPoint(x: -200, y: self.lblTopBonusB.center.y)
                self.lblFifthScore.center = CGPoint(x: -200, y: self.lblFifthScore.center.y)
                self.lblFourthScore.center = CGPoint(x: -200, y: self.lblFourthScore.center.y)
                self.lblThirdScore.center = CGPoint(x: -200, y: self.lblThirdScore.center.y)
                self.lblSecondScore.center = CGPoint(x: -200, y: self.lblSecondScore.center.y)
                self.lblTopScore.center = CGPoint(x: -200, y: self.lblTopScore.center.y)
                self.lblStageMode.center = CGPoint(x: -200, y: self.lblStageMode.center.y)
                
			    }, completion: {finished in
                    
			    }
			)

		} else {
	        dismissViewControllerAnimated(true, completion: nil)
		}
    }
}