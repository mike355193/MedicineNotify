//
//  CustomMedicinesView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/4.
//

import SwiftUI

struct CustomMedicinesView: View {
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
            // load file MedicineInCustom.json
            //let medicines: [MedicineInCustom] = JsonParserInRoot("MedicineInCustom.json")
            
            // fake data
            let medicines = [CustomMedicineItem(imgUrl: "pills.fill", name: "aaa", info: "aaa's info", timing: "beforeEat"),
                                         CustomMedicineItem(imgUrl: "pills", name: "bbb", info: "bbb's info", timing: "beforeSleep"),
                                         CustomMedicineItem(imgUrl: "pills.fill", name: "aaa", info: "aaa's info", timing: "beforeEat"),
                                         CustomMedicineItem(imgUrl: "pills", name: "bbb", info: "bbb's info", timing: "beforeSleep"),
                                         CustomMedicineItem(imgUrl: "pills.fill", name: "aaa", info: "aaa's info", timing: "beforeEat"),
                                         CustomMedicineItem(imgUrl: "pills", name: "bbb", info: "bbb's info", timing: "beforeSleep"),
                                         CustomMedicineItem(imgUrl: "pills.fill", name: "aaa", info: "aaa's info", timing: "beforeEat"),
                                         CustomMedicineItem(imgUrl: "pills", name: "bbb", info: "bbb's info", timing: "beforeSleep"),
                                         CustomMedicineItem(imgUrl: "pills.fill", name: "aaa", info: "aaa's info", timing: "beforeEat"),
                                         CustomMedicineItem(imgUrl: "pills", name: "bbb", info: "bbb's info", timing: "beforeSleep"),
                                         CustomMedicineItem(imgUrl: "pills.fill", name: "aaa", info: "aaa's info", timing: "beforeEat"),
                                         CustomMedicineItem(imgUrl: "pills", name: "bbb", info: "bbb's info", timing: "beforeSleep"),
                                         CustomMedicineItem(imgUrl: "pills.fill", name: "aaa", info: "aaa's info", timing: "beforeEat"),
                                         CustomMedicineItem(imgUrl: "cross.case", name: "zzzzzzzz", info: "zzzzzzz's info", timing: "AfterEat")]
                        
               
                        List(0..<medicines.count)
                        {
                            index in
                            CustomMedicineItemRow(medicine: medicines[index])
                        }
            
            /*
            NavigationView
            {
                List
                {
                    ForEach(0..<medicines.count)
                    {
                        index in
                        NavigationLink(
                            destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/)
                            {
                                 CustomMedicineItemRow(medicine: medicines[index])
                            }
                            .navigationBarBackButtonHidden(true)
                    }
                }
            }
 */
            
        }
    }
}

struct CustomMedicineItemRow: View {
    var medicine: CustomMedicineItem
    
    var body: some View {
        HStack {
            Image(systemName: medicine.imgUrl)
                        Text(medicine.name)
                        Text(medicine.info)
                        Spacer()
                        Text(medicine.timing)
            
        }
    }
}

struct CustomMedicinesView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMedicinesView()
    }
}
