//
//  ViewStaffCredit.swift
//  VeryBerry
//
//  Created by Verze on 2015/09/24.
//  Copyright © 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit

class ViewStaffCreidt: UIViewController
{
    var parent: ViewController! = nil

    @IBOutlet var lblStaffType1:UILabel! = nil
    @IBOutlet var lblStaffType2:UILabel! = nil
    @IBOutlet var lblStaffType3:UILabel! = nil
    @IBOutlet var lblStaffName1:UILabel! = nil
    @IBOutlet var lblStaffName2:UILabel! = nil
    @IBOutlet var lblStaffName3:UILabel! = nil
    
    override func viewWillAppear(animated: Bool) {
        let imgBackground:UIImageView = UIImageView();
        imgBackground.image = UIImage(named: "MAP-04.png")
        imgBackground.frame = CGRect(x: 0, y: 0, width: self.parent.SCREEN_WIDTH, height: self.parent.SCREEN_HEIGHT)
        self.view.addSubview(imgBackground);
        self.view.bringSubviewToFront(imgBackground)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}