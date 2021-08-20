//
//  AddMedicineFrameView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/5.
//

import SwiftUI

struct AddMedicineFrameView: View {
    let medicineItem: MedicineItem
    
    var body: some View {
        ScrollView
        {
            VStack
            {
                // image
                Image(systemName: medicineItem.imgUrl)
                    .resizable()
                    .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 100, idealHeight: 200, maxHeight: 120)
                    .padding()
                Spacer()
                // name and info
                HStack
                {
                    VStack(alignment: .leading)
                    {
                        Text(medicineItem.name)
                            .font(.title)
                            .padding(.bottom)
                        Text(medicineItem.info)
                            .font(.body)
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                // timing
                HStack
                {
                    // 飯前
                    TimingCheckObject(timing: medicineItem.timing, lebel: "飯前")
                    Spacer()
                    // 飯後
                    TimingCheckObject(timing: medicineItem.timing, lebel: "飯後")
                    Spacer()
                    // 睡前
                    TimingCheckObject(timing: medicineItem.timing, lebel: "睡前")
                }
                .padding([.leading, .bottom, .trailing])
                
                // timePeriod
                HStack
                {
                    // 早上
                    TimePeriodCheckObject(timePeriod: medicineItem.timePeriod.morning, lebel: "早上")
                    Spacer()
                    // 中午
                    TimePeriodCheckObject(timePeriod: medicineItem.timePeriod.noon, lebel: "中午")
                    Spacer()
                    // 晚上
                    TimePeriodCheckObject(timePeriod: medicineItem.timePeriod.evening, lebel: "晚上")
                }
                .padding([.leading, .bottom, .trailing])
            }
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
        }
    }
}

private struct TimingCheckObject: View {
    var timing: String
    var lebel: String
    
    var body: some View {
        Button(action:
                {
                    // according state to do that to do
                    // state = selected
                    
                    // state = not selected
                },
               label:
                {
                    Group
                    {
                        // according state to do that to show
                        // state = selected
                        if (timing == lebel)
                        {
                            Image(systemName: "dot.circle")
                        }
                        // state = not selected
                        else
                        {
                            Image(systemName: "circle")
                        }
                        Text(lebel)
                    }
                    .foregroundColor(.black)
                })
    }
}

private struct TimePeriodCheckObject: View {
    var timePeriod: Bool
    var lebel: String
    
    var body: some View {
        Button(action:
                {
                    // according state to do that to do
                    // state = selected
                    
                    // state = not selected
                },
               label:
                {
                    Group
                    {
                        // according state to do that to show
                        // state = selected
                        if (timePeriod == true)
                        {
                            Image(systemName: "checkmark.square.fill")
                        }
                        // state = not selected
                        else
                        {
                            Image(systemName: "square")
                        }
                        Text(lebel)
                    }
                    .foregroundColor(.black)
                })
    }
}


struct AddMedicineFrameView_Previews: PreviewProvider {
    static var previews: some View {
        let fakeMedicineItem: MedicineItem = MedicineItem(imgUrl: "photo.fill", name: "medicineName", info:"info abount this medicine, maybe it's element or it's effects. wordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordwordword", timing: "睡前", timePeriod: MedicineItemTimePeriod(morning: true, noon: true, evening: true), isSelected: false)
        
        AddMedicineFrameView(medicineItem: fakeMedicineItem)
    }
}
