//
//  JsonDefines.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/4.
//

import Foundation

// 我的全部藥物清單
struct CustomMedicineItem : Decodable {
    var imgUrl: String
    var name: String
    var info: String
    // var timing: Timing
    var timing: String  //飯前飯後睡前
}

// 首頁，準備要提醒的藥物清單
struct NotifyMedicineItem : Decodable {
    var imgUrl: String
    var name: String
    var info: String
    //var timePeriod: TimePeriod
    var timePeriod: String  //早上中午晚上
}

// 一個藥品
struct MedicineItem : Decodable {
    var imgUrl: String
    var name: String
}

// 藥品集合，有分系統預設以及使用者設定 顯示在 "EditMyListView"
struct MedicineItems : Decodable {
    var defaults: [MedicineItem]
    var custom: [MedicineItem]
}


// 時間區間設定集，用來做系統判斷什麼時候吃藥以及 顯示在 "EditMyListView"
struct TimePeriodSetting : Decodable {
    var morining: String
    var noon: String
    var evening: String
    var beforeSleep: String
}
