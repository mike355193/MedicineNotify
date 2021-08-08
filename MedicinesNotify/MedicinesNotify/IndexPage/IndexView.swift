//
//  IndexView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/8.
//

import SwiftUI

struct IndexView: View {
    var body: some View {
        VStack
        {
            // navBar
            HStack
            {
                // burger icon button
                BurgerButton()
                
                Spacer()
                
                // Weather
                WheatherView()
                Spacer()
                
                // notify icon button
                NotifyButton()
            }
            .padding()
            Spacer()
            
            ClockView()
            Spacer()
            NextMedicineListView()
        }
    }
}

private struct BurgerButton: View {
    var body: some View {
        Image(systemName: "ellipsis.rectangle")
    }
}

private struct BurgerView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

private struct WheatherView: View {
    var body: some View {
        Image(systemName: "sun.max.fill")
    }
}

private struct NotifyButton: View {
    var body: some View {
        Image(systemName: "bell.fill")
    }
}

private struct ClockView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// accroding nowtime to get what needs to be show on this list
// prepare readyMedicineItems array
private func GetNeededMedicineItmes(timePeriod: String)->[MedicineItem]
{
    var readyMedicineItems: [MedicineItem] = []
    
    // load file MedicineItems.json to get all items
    let medicineItems: MedicineItems = JsonParserInRoot("MedicineItems.json")
    
    for medicineItem in medicineItems.defaults
    {
        if (timePeriod == "早上" && medicineItem.timePeriod.morning)
        {
            readyMedicineItems.append(medicineItem)
        }
        if (timePeriod == "中午" && medicineItem.timePeriod.noon)
        {
            readyMedicineItems.append(medicineItem)
        }
        if (timePeriod == "晚上" && medicineItem.timePeriod.evening)
        {
            readyMedicineItems.append(medicineItem)
        }
        if (timePeriod == medicineItem.timing && medicineItem.timePeriod.evening)
        {
            readyMedicineItems.append(medicineItem)
        }
    }
    
    for medicineItem in medicineItems.custom
    {
        if (timePeriod == "早上" && medicineItem.timePeriod.morning)
        {
            readyMedicineItems.append(medicineItem)
        }
        if (timePeriod == "中午" && medicineItem.timePeriod.noon)
        {
            readyMedicineItems.append(medicineItem)
        }
        if (timePeriod == "晚上" && medicineItem.timePeriod.evening)
        {
            readyMedicineItems.append(medicineItem)
        }
        if (timePeriod == medicineItem.timing && medicineItem.timePeriod.evening)
        {
            readyMedicineItems.append(medicineItem)
        }
    }
    
    return readyMedicineItems
}

private struct NextMedicineListView: View {
    var body: some View {
        // judge the timePeriod now
        let timePeriodNow = GetNowTimePeriod()
        let readyMedicineItems = GetNeededMedicineItmes(timePeriod: timePeriodNow)
        //var readyMedicineItems = GetNeededMedicineItmes(timePeriod: "中午")
        
        VStack
        {
            HStack
            {
                Text(timePeriodNow)
                Spacer()
            }
            ForEach(0..<readyMedicineItems.count)
            {
                index in
                if (index < readyMedicineItems.count)
                {
                    MedicineItemView(medicineItem: readyMedicineItems[index])
                }
            }
        }
        
        
        
        
        
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
