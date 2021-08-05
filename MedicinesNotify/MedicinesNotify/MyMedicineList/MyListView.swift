//
//  MyListView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/5.
//

import SwiftUI

struct MyListView: View {
    var body: some View {
        VStack
        {
            // back icon button and edit icon button
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
                
                // edit icon button
                NavigationLink(
                    destination:
                        /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    //func()
                    label:
                        {
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                        })
            }
            .padding()
            
            // all medicines list
            CustomMedicineItemView()
        }
    }
}

private struct CustomMedicineItemRow: View {
    let medicineItem: MedicineItem
    
    var body: some View {
        if(medicineItem.isSelected == true)
        {
            HStack {
                Image(systemName: medicineItem.imgUrl)
                            Text(medicineItem.name)
                            Text(medicineItem.info)
                            Spacer()
                            Text(medicineItem.timing)
                
            }
        }
    }
}

private struct CustomMedicineItemView: View {
    // load file MedicineItems.json to get all items
    let medicineItems: MedicineItems = JsonParserInRoot("MedicineItems.json")
    
    var body: some View {
        List()
        {
            // defaults
            ForEach(0..<medicineItems.defaults.count)
            {
                index in
                CustomMedicineItemRow(medicineItem: medicineItems.defaults[index])
            }
            // customs
            ForEach(0..<medicineItems.custom.count)
            {
                index in
                CustomMedicineItemRow(medicineItem: medicineItems.custom[index])
            }
        }

    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
