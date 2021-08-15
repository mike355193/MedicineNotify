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

struct testing: Codable {
    var value:Int
    
    mutating func chnageStructureValue(id: Int) {
           self.value = id
    }
}

struct JsonWriter: View {
    var body: some View {
        // load file
        var timePeriodSetting: TimePeriodSetting = JsonParserInRoot("debug.json")
        
        var d = testing(value: 8)
        VStack
        {
            Text(String(d.value))
            //d.chnageStructureValue(id: 10)
            //d.value = 10
            Text(String(d.value))
            Text(JsonWriterTool(timePeriodSetting, fileName: "debug.json"))
        }
        //d.value = 0
        
        
        
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
