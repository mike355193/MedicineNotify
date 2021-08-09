//
//  JsonWriter.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/9.
//

import SwiftUI

func aa (abc:inout TimePeriodSetting)
{
    abc.beforeSleepHour = 9999
}

struct testing {
    var value:Int
}

struct JsonWriter: View {
    var body: some View {
        // load file TimePeriodSetting.json to get TimePeriodSetting
        var timePeriodSetting: TimePeriodSetting = JsonParserInRoot("debug.json")
        
        //timePeriodSetting.beforeSleepHour = 9999;
        
        //aa(abc: &timePeriodSetting)
        
        
        var a = 1
        var b = 2
        let c = a + b
        
        //var d = testing(value: 8)
        //d.value = 0
        
        Text(JsonWriterTool(timePeriodSetting, fileName: "debug.json"))
        
    }
}

func JsonEncoderToString<T: Encodable>(_ jsonObj: T)->String
{
    var ret = ""
    
    do {
        let jsonData = try JSONEncoder().encode(jsonObj)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        
        ret = jsonString
        //print(decodedSentences)
    } catch { print(error) }
    
    
    return ret
}
 

func JsonWriterTool<T: Encodable>(_ jsonObj: T, fileName: String)->String
{
    let JsonString = JsonEncoderToString(jsonObj)
    return JsonString
}

struct JsonWriter_Previews: PreviewProvider {
    static var previews: some View {
        JsonWriter()
    }
}
