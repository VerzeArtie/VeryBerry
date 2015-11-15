//
//  ViewAchivement.swift
//  VeryBerry
//
//  Created by Verze on 2015/08/15.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit

class ViewAchivementController: UIViewController {
    var parent: ViewController! = nil
    
    @IBOutlet var imgAchive_1_1_Bronze:UIImageView!
    @IBOutlet var imgAchive_1_1_Silver:UIImageView!
    @IBOutlet var imgAchive_1_1_Gold:UIImageView!
    @IBOutlet var imgAchive_1_2_Bronze:UIImageView!
    @IBOutlet var imgAchive_1_2_Silver:UIImageView!
    @IBOutlet var imgAchive_1_2_Gold:UIImageView!
    @IBOutlet var imgAchive_1_3_Bronze:UIImageView!
    @IBOutlet var imgAchive_1_3_Silver:UIImageView!
    @IBOutlet var imgAchive_1_3_Gold:UIImageView!
    @IBOutlet var imgAchive_1_4_Bronze:UIImageView!
    @IBOutlet var imgAchive_1_4_Silver:UIImageView!
    @IBOutlet var imgAchive_1_4_Gold:UIImageView!
    @IBOutlet var imgAchive_1_5_Bronze:UIImageView!
    @IBOutlet var imgAchive_1_5_Silver:UIImageView!
    @IBOutlet var imgAchive_1_5_Gold:UIImageView!
    @IBOutlet var imgAchive_1_6_Bronze:UIImageView!
    @IBOutlet var imgAchive_1_6_Silver:UIImageView!
    @IBOutlet var imgAchive_1_6_Gold:UIImageView!

    @IBOutlet var imgAchive_2_1_Bronze:UIImageView!
    @IBOutlet var imgAchive_2_1_Silver:UIImageView!
    @IBOutlet var imgAchive_2_1_Gold:UIImageView!
    @IBOutlet var imgAchive_2_2_Bronze:UIImageView!
    @IBOutlet var imgAchive_2_2_Silver:UIImageView!
    @IBOutlet var imgAchive_2_2_Gold:UIImageView!
    @IBOutlet var imgAchive_2_3_Bronze:UIImageView!
    @IBOutlet var imgAchive_2_3_Silver:UIImageView!
    @IBOutlet var imgAchive_2_3_Gold:UIImageView!
    @IBOutlet var imgAchive_2_4_Bronze:UIImageView!
    @IBOutlet var imgAchive_2_4_Silver:UIImageView!
    @IBOutlet var imgAchive_2_4_Gold:UIImageView!
    @IBOutlet var imgAchive_2_5_Bronze:UIImageView!
    @IBOutlet var imgAchive_2_5_Silver:UIImageView!
    @IBOutlet var imgAchive_2_5_Gold:UIImageView!
    @IBOutlet var imgAchive_2_6_Bronze:UIImageView!
    @IBOutlet var imgAchive_2_6_Silver:UIImageView!
    @IBOutlet var imgAchive_2_6_Gold:UIImageView!

    override func viewDidLoad() {
        if (self.parent.completeStage1_1 != 0) { imgAchive_1_1_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage1_2 != 0) { imgAchive_1_2_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage1_3 != 0) { imgAchive_1_3_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage1_4 != 0) { imgAchive_1_4_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage1_5 != 0) { imgAchive_1_5_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage1_6 != 0) { imgAchive_1_6_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        
        if (self.parent.completeStage2[0] != 0) { imgAchive_2_1_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage2[1] != 0) { imgAchive_2_2_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage2[2] != 0) { imgAchive_2_3_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage2[3] != 0) { imgAchive_2_4_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage2[4] != 0) { imgAchive_2_5_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
        if (self.parent.completeStage2[5] != 0) { imgAchive_2_6_Bronze.image = UIImage(named: Database.MEDAL_BRONZE) }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}