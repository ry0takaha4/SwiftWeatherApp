//
//  WeatherDataManager.swift
//  MCWeatherApp
//
//  Created by AdminAir on 2018/03/09.
//  Copyright © 2018年 ryotakahashi. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class WeatherDataManager:NSObject {
    
    // レスポンスデータをパースするモデルクラスのインスタンスを格納するプロパティ
    var weatherData: WeatherDataModel?
    
    // リクエストするURL
    let url =
    "http://api.openweathermap.org/data/2.5/forecast?units=metric&q=Tokyo&APPID=2ec06eb3d8b93310aa2773a10f1dafe4"
    
    
    // APIリクエストを実行する
    func dataRequest() {
        
        
        // AlamofireによるAPI通信
        Alamofire.request(url).responseJSON { response in
            switch response.result {
                
                
            case .success(let value):
                // 通信成功時の処理
                // レスポンスデータをJSON型に変換する
                // これはSwiftyJSONのルール
                let json = JSON(value)
                // JSONデータを引数に渡してモデルクラスのインスタンスを生成
                self.weatherData = WeatherDataModel(data: json)
                // デバッグ用のログ出力を行う
                print(value)
                
                
            case .failure(let error):
                // 通信失敗時の処理
                // 今回はログ出力だけ
                print(error)
            }
        }
    }
    
}
