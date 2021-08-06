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
    @State var listItems = ["Item 1", "Item 2", "Item 3"]
    @State var medicineItems: MedicineItems = JsonParserInRoot("MedicineItems.json")
    var body: some View {
        // load file MedicineItems.json to get all items
        //var medicineItems: MedicineItems = JsonParserInRoot("MedicineItems.json")
        VStack
        {
            NavigationView
            {
                List()
                {
                    ForEach(0..<medicineItems.defaults.count)
                    {
                        index in
                        if (index < medicineItems.defaults.count)
                        {
                            MedicineItemView(medicineItem: medicineItems.defaults[index])
                        }
                    }
                    // customs
                    ForEach(0..<self.medicineItems.custom.count)
                    {
                        index in
                        if (index < medicineItems.custom.count)
                        {
                            MedicineItemView(medicineItem: self.medicineItems.custom[index])
                        }
                    }
                    .onDelete
                    {
                        (indexSet) in
                        self.medicineItems.custom.remove(atOffsets: indexSet)
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

struct MedicineItemView: View {
    let medicineItem: MedicineItem
    
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
        
    }
}

struct EditMyListView_Previews: PreviewProvider {
    static var previews: some View {
        EditMyListView()
    }
}
