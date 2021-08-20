//
//  IndexView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/8.
//

import SwiftUI

struct IndexView: View {
    @State var burgerView: Bool = false
    @State private var myListIsShown = false
    var body: some View {
        ZStack
        {
            ScrollView
            {
                VStack
                {
                    // navBar
                    HStack
                    {
                        /*
                        // burger icon button
                        BurgerButton()
                        */
                        // my medicines List
                        
                        Button(
                            action:
                                {
                                    self.myListIsShown = true
                                },
                            label:
                                {
                                    Image(systemName: "list.triangle")
                                })
                            .fullScreenCover(isPresented: $myListIsShown) {
                                MyListView(myListIsShown: self.$myListIsShown)
                            }
                        
                        Spacer()
                        
                        // Weather
                        WheatherView()
                        Spacer()
                        
                        // notify icon button
                        NotifyButton()
                    }
                    .foregroundColor(Color(hex: 0x460046)) //todo
                    .padding()
                    .overlay(
                        EmptyView()
                            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                            .background(LinearGradient(gradient:
                                                        Gradient(
                                                            colors: [Color(hex: 0x2828FF), .white, Color(hex: 0x2828FF)]),
                                                       startPoint: .topLeading,
                                                       endPoint: .bottomTrailing))
                            .cornerRadius(50)
                            .opacity(0.3)
                    )
                    
                    Spacer()
                    
                    ClockView()
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 200, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .overlay(
                            EmptyView()
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                                .background(LinearGradient(gradient:
                                                            Gradient(
                                                                colors: [.green, .white, .green]),
                                                           startPoint: .topLeading,
                                                           endPoint: .bottomTrailing))
                                .cornerRadius(50)
                                .opacity(0.3)
                        )
                        //.background(Color.red)
                        //.background(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .top, endPoint: .bottom))
                    
                    Spacer()
                    NextMedicineListView()
                        .padding()
                        .overlay(
                            EmptyView()
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                                //.background(Color.gray)
                                .background(LinearGradient(gradient:
                                                            Gradient(
                                                                colors: [Color(hex: 0xD9B300), .white, Color(hex: 0xD9B300)]),
                                                           startPoint: .topLeading,
                                                           endPoint: .bottomTrailing))
                                .cornerRadius(50)
                                .opacity(0.3)
                        )
                }
                
            }
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
            .background(LinearGradient(gradient:
                                        Gradient(
                                            colors: [Color(hex: 0x2828FF), .white, Color(hex: 0x2828FF)]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
    }
}

private struct WheatherView: View {
    var body: some View {
        Image(systemName: "sun.max.fill")
    }
}

private struct NotifyButton: View {
    @State private var notifyIsShown = false
    var body: some View {
        Button(
            action:
                {
                    self.notifyIsShown = true
                },
            label:
                {
                    Image(systemName: "bell.fill")
                })
            .sheet(isPresented: self.$notifyIsShown) {
                NotifyView(notifyIsShown: self.$notifyIsShown)
            }
    }
}


private struct ClockView: View {
    @State var nowTime = getNowTime()
    @State var nowTimeString: String = ""
    @State var nowDate = getNowDate()
    @State var nowDateString: String = ""
    @State var timePeriodNow: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        // fix: timer to update
        VStack
        {
            Text(nowTimeString)
                .font(.system(size: 96, weight: .heavy, design: .rounded))
                .padding(.bottom)
                .onReceive(timer)
                { _ in
                    nowTime = getNowTime()
                    nowTimeString = FormatTimePeriodToString(hour: self.nowTime.hour, minute: self.nowTime.miniute)
                }
            
            Text(nowDateString)
                .font(.system(size: 18, weight: .heavy, design: .rounded))
                .padding(.bottom)
                .onReceive(timer)
                { _ in
                    nowDate = getNowDate()
                    nowDateString = FormatDateToString(year: self.nowDate.year, month: self.nowDate.month, day: self.nowDate.day, weekDay: self.nowDate.weekDay)
                }
            
            Text("下一個時段： \(timePeriodNow)")
                .font(.system(size: 32, weight: .heavy, design: .rounded))
                .onReceive(timer)
                { _ in
                    timePeriodNow = GetNowTimePeriod()
                }
        }
        .foregroundColor(Color(hex: 0x28004D))
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
    @State var timePeriodNow: String = ""
    @State var timePeriodNext: String = ""
    @State var readyMedicineItems: [MedicineItem] = []
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack
        {
            // judge the timePeriod per second
            Text("")
                .onReceive(timer)
                { _ in
                    timePeriodNext = GetNowTimePeriod()
                    if (timePeriodNext != timePeriodNow)
                    {
                        timePeriodNow = timePeriodNext
                        // TODO: if medicineItems not checked, put into notify and make some record
                        
                    }
                    readyMedicineItems = GetNeededMedicineItmes(timePeriod: timePeriodNow)
                    
                }

            if(readyMedicineItems.count > 0)
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
        .font(.system(size: 28, weight: .heavy, design: .rounded))
        .foregroundColor(Color(hex: 0x460046))
        
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
