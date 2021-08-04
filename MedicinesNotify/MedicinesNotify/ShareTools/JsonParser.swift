//
//  JsonParser.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/4.
//


// refs: https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E5%95%8F%E9%A1%8C%E8%A7%A3%E7%AD%94%E9%9B%86/%E8%AE%80%E5%8F%96%E5%B0%88%E6%A1%88%E8%A3%A1%E7%9A%84%E6%AA%94%E6%A1%88%E6%B8%AC%E8%A9%A6-json-%E8%A7%A3%E7%A2%BC-d30154dcc154

// to use json parser
// you should definition your json STRUCT first
//
// struct sample:
// struct Person : Decodable {
//     var name: String
//     var number: Int
// }
//
// call func sample:
// let person: Person = JsonParserInRoot("sample.json")
//
// then you can use the "person" value to do anything you want


import SwiftUI

// NOT RECOMMEND
// jsonfile in Asset
// when you put a file into asset, it can not editable anymore.
// even you edit at other ways, it can not sync the file that you already putted into asset.
func JsonParserInFile<T: Decodable>(_ filename: String) -> T {
    guard let data = NSDataAsset(name: filename)?.data else {
        fatalError("Couldn't load \(filename) from asset")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

// BETTER
// jsonfile in Project navigator
// when you put a file into project, it is just a reference.
// it can edit anytime and can sync, too.
func JsonParserInRoot<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
