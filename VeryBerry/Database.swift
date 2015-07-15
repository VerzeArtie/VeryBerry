//
//  Database.swift
//  VeryBerry
//
//  Created by Summer on 2015/02/24.
//  Copyright (c) 2015年 AltomoSoft. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion
import AudioToolbox

class Database {
    class var Attack: String { get { return "Attack" } }

    class var STAGE:String { get { return "Stage" } } // add (ENHANCE-A)
    //class var STAGE_1:String { get { return "Stage1" } } // 1-1 delete (ENHANCE-A)
    //class var STAGE_2:String { get { return "Stage2" } } // 1-2 delete (ENHANCE-A)
    //class var STAGE_3:String { get { return "Stage3" } } // 1-3 delete (ENHANCE-A)
    //class var STAGE_4:String { get { return "Stage4" } } // 1-4 delete (ENHANCE-A)
    //class var STAGE_5:String { get { return "Stage5" } } // 1-5 delete (ENHANCE-A)
    //class var STAGE_6:String { get { return "Stage6" } } // 1-6 delete (ENHANCE-A)
    
    class var PROGRESS_1_1_1:Int { get { return 908  } }
    class var PROGRESS_1_1_2:Int { get { return 1816 } }
    class var PROGRESS_1_1_3:Int { get { return 2724 } }
    class var PROGRESS_1_2_1:Int { get { return 908  } }
    class var PROGRESS_1_2_2:Int { get { return 1816 } }
    class var PROGRESS_1_2_3:Int { get { return 2724 } }
    class var PROGRESS_1_3_1:Int { get { return 908  } }
    class var PROGRESS_1_3_2:Int { get { return 1816 } }
    class var PROGRESS_1_3_3:Int { get { return 2724 } }
    class var PROGRESS_1_4_1:Int { get { return 908  } }
    class var PROGRESS_1_4_2:Int { get { return 1816 } }
    class var PROGRESS_1_4_3:Int { get { return 2724 } }
    class var PROGRESS_1_4_4:Int { get { return 3632 } }
    //class var PROGRESS_1_4_5:Int { get { return 4540 } } // delete 2015/05/20
    class var PROGRESS_1_5_1:Int { get { return 908  } }
    class var PROGRESS_1_5_2:Int { get { return 1816 } }
    class var PROGRESS_1_5_3:Int { get { return 2724 } }
    class var PROGRESS_1_6_1:Int { get { return 908  } }
    class var PROGRESS_1_6_2:Int { get { return 1816 } }
    class var PROGRESS_1_6_3:Int { get { return 2451 } }
    class var PROGRESS_1_6_4:Int { get { return 3650 } }

    class var PROGRESS_2_1:[Int] { get { return [908, 1816, 2724, 3632 ] } }
    
//	class var FINISH_LINE_1_1:Int { get { return 3520 } }delete (ENHANCE-A)
//	class var FINISH_LINE_1_2:Int { get { return 3520 } }delete (ENHANCE-A)
//	class var FINISH_LINE_1_3:Int { get { return 4350 } }delete (ENHANCE-A)
//	class var FINISH_LINE_1_4:Int { get { return 5200 } }delete (ENHANCE-A)
//	class var FINISH_LINE_1_5:Int { get { return 3450 } }delete (ENHANCE-A)
//	class var FINISH_LINE_1_6:Int { get { return 4900 } }delete (ENHANCE-A)
    class var FINISH_LINE_1:[Int] { get { return [3520, 3520, 4350, 5200, 3450, 4900 ] } }
    class var FINISH_LINE_2:[Int] { get { return [3520, 3520, 3520, 3520, 3520, 3520 ] } }
    
    class var NAME_FIELD:String { get { return "field" } }
    class var NAME_ROCK:String { get { return "rock" } }
    class var NAME_BUSH:String { get { return "bush" } }
    class var NAME_FLOWER:String { get { return "flower" } }
    class var NAME_SUN:String { get { return "sun" } }
    class var NAME_BIRD:String { get { return "bird" } }
    class var NAME_BIGBIRD:String { get { return "bigbird" } }
    class var NAME_BIGMOUSE:String { get { return "bigmouse" } }
    class var NAME_EYEBIRD:String { get { return "eyebird" } }
    class var NAME_FALLBERRY:String { get { return "fallberry" } }
    class var NAME_FALLHAND:String { get { return "fallhand" } }
    class var NAME_SMALLMOUSE:String { get { return "smallmouse" } }
    class var NAME_UFO:String { get { return "ufo" } } // add [ENHANCE-A]
    class var NAME_UFOLIGHT:String { get { return "ufolight" } } // add [ENHANCE-A]
    class var NAME_CLOUDHAND:String { get { return "cloudA" } } // name規則と文字列が違う仕様が設計不良につながる場合は、StageDataのシートに記載しているcloudAという名前も全て変換すること。
    class var NAME_CLOUDB:String { get { return "cloudB" } }
    class var NAME_CLOUDC:String { get { return "cloudC" } }
    
    
    

}