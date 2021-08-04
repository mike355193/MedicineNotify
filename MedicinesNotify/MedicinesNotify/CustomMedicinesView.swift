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
            let medicines = [CustomMedicineItem(name: "aaa", number: 1),
                             CustomMedicineItem(name: "bbbb", number: 2),
                             CustomMedicineItem(name: "aaa", number: 1),
                             CustomMedicineItem(name: "bbbb", number: 2),
                             CustomMedicineItem(name: "aaa", number: 1),
                             CustomMedicineItem(name: "bbbb", number: 2),
                             CustomMedicineItem(name: "aaa", number: 1),
                             CustomMedicineItem(name: "bbbb", number: 2),
                             CustomMedicineItem(name: "aaa", number: 1),
                             CustomMedicineItem(name: "bbbb", number: 2),
                             CustomMedicineItem(name: "aaa", number: 1),
                             CustomMedicineItem(name: "bbbb", number: 2),
                             CustomMedicineItem(name: "aaa", number: 1),
                             CustomMedicineItem(name: "zzz", number: 3)]
            
            
            List(0..<medicines.count)
            {
                index in
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/)
                    {
                        CustomMedicineItemRow(medicine: medicines[index])
                    }
                    .navigationBarBackButtonHidden(true)
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
            Text(medicine.name)
            Text(String(medicine.number))
        }
    }
}

struct CustomMedicinesView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMedicinesView()
    }
}
