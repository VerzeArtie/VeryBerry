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
    var parent:ViewController! = nil;
    
    var number:Int = 0

    enum SceneName : Int {
        case Ground = 1, Heaven
        
        func toString() -> String {
            switch self {
            case .Ground: return "GND"
            case .Heaven: return "HVN"
            }
        }
    }

    var sceneName:Dictionary<Int, String> = [1: "GND" , 2: "HVN" ]
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tapStageSelect(sender:UIButton) {
        self.parent.selectScene = sender.tag / 100;
        self.parent.selectStage = sender.tag % 100;

        var str = SceneName(rawValue: self.parent.selectScene)!.toString()
        self.parent.btnSceneSelect.setTitle("[\(str)] \(self.parent.selectScene) - \(self.parent.selectStage)", forState: UIControlState.Normal)
        
        var str2 = self.sceneName[self.parent.selectScene]!;
        self.parent.btnSceneSelect.setTitle("[\(str2)] \(self.parent.selectScene) - \(self.parent.selectStage)", forState: UIControlState.Normal)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}