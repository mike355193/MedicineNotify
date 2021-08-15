//
//  IndexView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/8.
//

import SwiftUI

struct IndexView: View {
    var body: some View {
        ScrollView
        {
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
                .background(Color.blue)
                Spacer()
                
                ClockView()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 200, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.red)
                
                Spacer()
                NextMedicineListView()
                    .background(Color.yellow)
            }
            .background(Color.gray)
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
        // fix: timer to update
        VStack
        {
            let nowTime = getNowTime()
            let nowTimeString = FormatTimePeriodToString(hour: nowTime.hour, minute: nowTime.miniute)
            Text(nowTimeString)
                .font(.system(size: 100))
                .padding(.bottom)
            
            let nowDate = getNowDate()
            let nowDateString = FormatDateToString(year: nowDate.year, month: nowDate.month, day: nowDate.day, weekDay: nowDate.weekDay)
            Text(nowDateString)
                .padding(.bottom)
            
            let timePeriodNow = GetNowTimePeriod()
            Text("下一個時段： \(timePeriodNow)")
                .font(.system(size: 28))
        }
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
            ForEach(0..<readyMedicineItems.count)
            {
                index in
                if (index < readyMedicineItems.count)
                {
                    CheckMedicineItemView(medicineItem: readyMedicineItems[index])
                        .padding(.bottom)
                }
            }
        }
        
    }
}

private struct CheckMedicineItemView: View {
    let medicineItem: MedicineItem
    
    var body: some View {
        HStack
        {
            // according state to do that to show
            // state = selected
            if(medicineItem.isSelected == true)
            {
                Image(systemName: "checkmark.square")
            }
            // state = not selected
            else
            {
                Image(systemName: "square")
            }
            
            Text(medicineItem.name)
            Spacer()
        }
        
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
