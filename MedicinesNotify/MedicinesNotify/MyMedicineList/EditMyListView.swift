//
//  EditMyListView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/5.
//

import SwiftUI


struct EditMyListView: View {
    @Binding var editIsShown: Bool
    var body: some View {
        VStack
        {
            // back icon button and timePeriod Texts
            HStack
            {
                // back icon [NavigationLink]
                Button(
                    action:
                        {
                            self.editIsShown = false
                        },
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
                        Text("早上 \(FormatTimePeriodToString(hour:timePeriodSetting.moriningHour, minute:timePeriodSetting.moriningMinute))")
                        Text("中午 \(FormatTimePeriodToString(hour:timePeriodSetting.noonHour, minute:timePeriodSetting.noonMinute))")
                    }
                    HStack
                    {
                        Text("晚上 \(FormatTimePeriodToString(hour:timePeriodSetting.eveningHour, minute:timePeriodSetting.eveningMinute))")
                        Text("睡前 \(FormatTimePeriodToString(hour:timePeriodSetting.beforeSleepHour, minute:timePeriodSetting.beforeSleepMinute))")
                    }
                }
            }
            .padding(.horizontal)
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
            
            // list all medecineItems in defaults and customs
            MedicineItemsView()

        }
    }
}

struct MedicineItemsView: View {
    // load file MedicineItems.json to get all items
    @State var medicineItems: MedicineItems = JsonParserInRoot("MedicineItems.json")
    var body: some View {
        VStack
        {
            NavigationView
            {
                List()
                {
                    // default
                    ForEach(0..<medicineItems.defaults.count)
                    {
                        index in
                        if (index < medicineItems.defaults.count)
                        {
                            MedicineItemView(medicineItem: medicineItems.defaults[index], color: Color(hex: 0xAE8F00))
                        }
                    }
                    // customs
                    ForEach(0..<self.medicineItems.custom.count)
                    {
                        index in
                        if (index < medicineItems.custom.count)
                        {
                            MedicineItemView(medicineItem: medicineItems.custom[index], color: Color(hex: 0xD9B300))
                        }
                    }
                    .onDelete
                    {
                        (indexSet) in
                        self.medicineItems.custom.remove(atOffsets: indexSet)
                    }
                    
                    // add custom medicine button
                    HStack
                    {
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                        Spacer()
                    }
                }
                .navigationBarTitle("回到我的藥單")
                .navigationBarHidden(true)
            }
            
        }
    }
}

struct Safe<T: RandomAccessCollection & MutableCollection, C: View>: View {
   
   typealias BoundElement = Binding<T.Element>
   private let binding: BoundElement
   private let content: (BoundElement) -> C

   init(_ binding: Binding<T>, index: T.Index, @ViewBuilder content: @escaping (BoundElement) -> C) {
      self.content = content
      self.binding = .init(get: { binding.wrappedValue[index] },
                           set: { binding.wrappedValue[index] = $0 })
   }
   
   var body: some View {
      content(binding)
   }
}

private struct MedicineItemView: View {
    let medicineItem: MedicineItem
    let color: Color
    
    var body: some View {
        ZStack
        {
            // view
            HStack
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
                
                Text(medicineItem.name)
                Spacer()
                Image(systemName: medicineItem.imgUrl)
            }
            
            // event
            if(medicineItem.isSelected == true)
            {
                // do some thing remove things. after set, update file into MedicinesItem.json
                
            }
            // state = not selected
            else
            {
                // nav to AddMedicineFrameView. after set, update file into MedicinesItem.json
                NavigationLink(destination: AddMedicineFrameView(medicineItem: medicineItem))
                {
                    EmptyView()
                }
            }
        }
        .padding()
        .overlay(
            EmptyView()
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                //.background(Color.gray)
                .background(LinearGradient(gradient:
                                            Gradient(
                                                colors: [color, .white]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                .cornerRadius(10)
                .opacity(0.3)
        )
        
    }
}

struct EditMyListView_Previews: PreviewProvider {
    static var previews: some View {
        EditMyListView(editIsShown: .constant(true))
    }
}
