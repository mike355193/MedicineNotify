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
    var body: some View {
        // load file MedicineItems.json to get all items
        var medicineItems: MedicineItems = JsonParserInRoot("MedicineItems.json")
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
                .onDelete
                {
                    (index) in
                    medicineItems.defaults.remove(atOffsets: index)
                }
                // customs
                ForEach(0..<medicineItems.custom.count)
                {
                    index in
                    MedicineItemView(medicineItem: medicineItems.custom[index])
                }
                .onDelete
                {
                    (index) in
                    medicineItems.custom.remove(atOffsets: index)
                }
            }
        }
    }
}

struct MedicineItemView: View {
    let medicineItem: MedicineItem
    
    var body: some View {
        HStack
        {
            Group
            {
                // according state to do that to show
                // state = selected
                if(medicineItem.isSelected == true)
                {
                    //NavigationLink(destination: AddMedicineFrameView(medicineItem: medicineItem))
                    NavigationLink(destination: ContentView())
                    {
                        Image(systemName: "minus.circle.fill")
                    }
                    //Image(systemName: "minus.circle.fill")
                }
                // state = not selected
                else
                {
                    NavigationLink(destination: AddMedicineFrameView(medicineItem: medicineItem))
                    {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .frame(width: 20, height:20)
            //.hidden()
            
            
            /*
            Button(action:
                    {
                        // according state to do that to do
                        // state = selected
                        
                        // state = not selected
                        //AddMedicineFrameView(medicineItem: medicineItem)
                    },
                   label:
                    {
                        // according state to do that to show
                        // state = selected
                        if(medicineItem.isSelected == true)
                        {
                            Image(systemName: "minus.circle.fill")
                        }
                        // state = not selected
                        else
                        {
                            Image(systemName: "plus.circle.fill")
                        }
                    })
            */
            
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
