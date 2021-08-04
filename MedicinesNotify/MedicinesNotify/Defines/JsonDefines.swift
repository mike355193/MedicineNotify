//
//  JsonDefines.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/4.
//

import Foundation

// here the json struct about 我的清單
struct CustomMedicineItem : Decodable {
    var name: String
    var number: Int
}

// here the json struct about 首頁，
struct NotifyMedicineItem : Decodable {
    var name: String
    var number: Int
}
