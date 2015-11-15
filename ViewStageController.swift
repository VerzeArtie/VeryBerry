//
//  File.swift
//  VeryBerry
//
//  Created by Verze on 2015/06/04.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit


class ViewStageController: UIViewController {
    @IBOutlet var scrollView: CustomScrollView! = nil
    
    var parent:ViewController! = nil;
    var imgBack_opening :UIImageView! = nil
    
    var number:Int = 0

    override func viewWillAppear(animated: Bool) {
    }
    
    override func viewDidLoad() {
    }
}