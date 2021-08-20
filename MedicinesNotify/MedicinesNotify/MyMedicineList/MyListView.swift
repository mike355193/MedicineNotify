//
//  MyListView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/5.
//

import SwiftUI

struct MyListView: View {
    @Binding var myListIsShown: Bool
    @State private var editIsShown: Bool = false
    var body: some View {
        VStack
        {
            // back icon button and edit icon button
            HStack
            {
                // back icon 
                Button(
                    action:
                        {
                            self.myListIsShown = false
                        },
                    label:
                        {
                            Image(systemName: "arrowshape.turn.up.left.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                        })
                
                Spacer()
                
                // edit icon button
                Button(
                    action:
                        {
                            self.editIsShown = true
                        },
                    label:
                        {
                            Image(systemName: "square.and.pencil")
                        })
                    .fullScreenCover(isPresented: $editIsShown) {
                        EditMyListView(editIsShown: self.$editIsShown)
                    }
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
            
            // all medicines list
            CustomMedicineItemView()
                .padding()
                .background(EmptyView()
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                                //.background(Color.gray)
                                .background(LinearGradient(gradient:
                                                            Gradient(
                                                                colors: [Color(hex: 0xD9B300), .white, Color(hex: 0xD9B300)]),
                                                           startPoint: .topLeading,
                                                           endPoint: .bottomTrailing))
                                .cornerRadius(50)
                                .opacity(0.3))
                
                
                 
        }
    }
}

private struct CustomMedicineItemRow: View {
    let medicineItem: MedicineItem
    
    var body: some View {
        if(medicineItem.isSelected == true)
        {
            HStack
            {
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
    init()
    {
        UITableView
            .appearance()
            .backgroundColor = UIColor(red: 219/255,green: 179/255, blue: 0, alpha: 0.3)
    }
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
                    .listRowBackground(LinearGradient(gradient:
                                                        Gradient(
                                                            colors: [Color(hex: 0xD9B300), .white, Color(hex: 0xD9B300)]),
                                                       startPoint: .topLeading,
                                                       endPoint: .bottomTrailing)
                                        .opacity(0.3))
                    
            }
            // customs
            ForEach(0..<medicineItems.custom.count)
            {
                index in
                CustomMedicineItemRow(medicineItem: medicineItems.custom[index])
                    .listRowBackground(LinearGradient(gradient:
                                                        Gradient(
                                                            colors: [Color(hex: 0xD9B300), .white, Color(hex: 0xD9B300)]),
                                                       startPoint: .topLeading,
                                                       endPoint: .bottomTrailing)
                                        .opacity(0.3))
            }
        }
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView(myListIsShown: .constant(true))
    }
}
