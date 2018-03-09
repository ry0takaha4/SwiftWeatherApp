//
//  WeatherDataModel.swift
//  MCWeatherApp
//
//  Created by AdminAir on 2018/03/09.
//  Copyright © 2018年 ryotakahashi. All rights reserved.
//

import Foundation
import SwiftyJSON

// SwiftyJSONによるパースを行うクラス
class WeatherDataModel: NSObject {
    // 天気　晴れ、曇　などが格納される
    var weather: String = ""
    // 気温
    var temp: Int = 0
    
    // weatherDataManagerクラスから初期化される
    init?(data: JSON) {
        // 引数で渡ってきたJSONデータをここでパースする
        // 今日の天気データを取得して変数に格納する
        self.weather = data["list"][0]["weather"][0]["main"].stringValue
        //気温データを取得して変数に格納する
        self.temp = data["list"][0]["main"]["temp"].intValue
    }
    
    

}
