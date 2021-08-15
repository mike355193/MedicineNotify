//
//  JsonDefines.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/4.
//

import Foundation

////////////////////////////////////////////////////////////////////////////////////////
// 我的全部藥物清單
struct CustomMedicineItem : Codable {
    var imgUrl: String
    var name: String
    var info: String
    // var timing: Timing
    var timing: String  //飯前飯後睡前
}
////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////
// 首頁，準備要提醒的藥物清單
struct NotifyMedicineItem : Codable {
    var imgUrl: String
    var name: String
    var info: String
    //var timePeriod: TimePeriod
    var timePeriod: String  //早上中午晚上
}
////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////
// 一個藥品的時機時段設定
struct MedicineItemTimePeriod :Codable {
    var morning: Bool
    var noon: Bool
    var evening: Bool
}

// 一個藥品
struct MedicineItem : Codable {
    var imgUrl: String
    var name: String
    var info: String
    // var timing: Timing
    var timing: String  //飯前飯後睡前
    var timePeriod: MedicineItemTimePeriod
    var isSelected: Bool
}

// 藥品集合，有分系統預設以及使用者設定 顯示在 "EditMyListView"
struct MedicineItems : Codable {
    var defaults: [MedicineItem]
    var custom: [MedicineItem]
}
////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////
// 時間區間設定集，用來做系統判斷什麼時候吃藥以及 顯示在 "EditMyListView"
struct TimePeriodSetting : Codable {
    var moriningHour: Int
    var moriningMinute: Int
    var noonHour: Int
    var noonMinute: Int
    var eveningHour: Int
    var eveningMinute: Int
    var beforeSleepHour: Int
    var beforeSleepMinute: Int
    
    mutating func chnageMorning(h: Int, m: Int) {
           self.moriningHour = h
           self.moriningMinute = m
    }
}
////////////////////////////////////////////////////////////////////////////////////////
