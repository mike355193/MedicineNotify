//
//  JsonDefines.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/4.
//

import Foundation

// 時機
enum Timing: Int {
    case
        beforeEat,
        afterEat,
        beforeSleep
}

// 時段
enum TimePeriod: Int {
    case
        moring,
        noon,
        evening
}

// here the json struct about 我的清單
struct CustomMedicineItem : Decodable {
    var imgUrl: String
    var name: String
    var info: String
    // var timing: Timing
    var timing: String  //飯前飯後睡前
}

// here the json struct about 首頁，
struct NotifyMedicineItem : Decodable {
    var imgUrl: String
    var name: String
    var info: String
    //var timePeriod: TimePeriod
    var timePeriod: String  //早上中午晚上
}

struct MedicineItem : Decodable {
    var imgUrl: String
    var name: String
}


struct MedicineItems : Decodable {
    var defaults: [MedicineItem]
    var custom: [MedicineItem]
}
