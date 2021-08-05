//
//  EditMyListView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/5.
//

import SwiftUI

struct EditMyListView: View {
    
    var body: some View {
        VStack
        {
            // back icon button and timePeriod Texts
            HStack
            {
                // back icon [NavigationLink]
                NavigationLink(
                    destination:
                        /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    //func()
                    label:
                        {
                            Image(systemName: "arrowshape.turn.up.left.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                        })
                
                Spacer()
                
                // timePeriod Texts
                
                // load file TimePeriodSetting.json to get TimePeriodSetting
                 let timePeriodSetting: TimePeriodSetting = JsonParserInRoot("TimePeriodSetting.json")
                
                VStack
                {
                    HStack
                    {
                        Text("早上 \(timePeriodSetting.morining)")
                        Text("中午 \(timePeriodSetting.noon)")
                    }
                    HStack
                    {
                        Text("晚上 \(timePeriodSetting.evening)")
                        Text("睡前 \(timePeriodSetting.beforeSleep)")
                    }
                }
                
            }
            .padding()
            
            // list all medecineItems in defaults and customs
            MedicineItemsView()
            
            
        }
    }
}

struct MedicineItemsView: View {
    // load file MedicineItems.json to get all items
    let medicineItems: MedicineItems = JsonParserInRoot("MedicineItems.json")
    
    var body: some View {
        VStack
        {
            List()
            {
                // defaults
                ForEach(0..<medicineItems.defaults.count)
                {
                    index in
                    MedicineItemView(medicineItem: medicineItems.defaults[index])
                }
                // customs
                ForEach(0..<medicineItems.custom.count)
                {
                    index in
                    MedicineItemView(medicineItem: medicineItems.custom[index])
                }
            }
        }
    }
}

struct MedicineItemView: View {
    // load file MedicineItems.json to get all items
    let medicineItem: MedicineItem
    
    var body: some View {
        HStack
        {
            Button(action:
                    {
                        // according state to do that to do
                        // state = not selected
                        
                        // state = selected
                    },
                   label:
                    {
                        // according state to do that to show
                        // state = not selected
                        Image(systemName: "plus.circle.fill")
                        // state = selected
                        Image(systemName: "minus.circle.fill")
                    })
            
            Text(medicineItem.name)
            Spacer()
            Image(systemName: medicineItem.imgUrl)
        }
    }
}

struct EditMyListView_Previews: PreviewProvider {
    static var previews: some View {
        EditMyListView()
    }
}
