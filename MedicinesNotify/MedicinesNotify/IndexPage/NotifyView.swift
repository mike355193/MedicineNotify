//
//  NotifyView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/19.
//

import SwiftUI

struct NotifyView: View {
    @Binding var notifyIsShown: Bool
    var body: some View {
        let forgottenMediceins:[String] = ["medicine1","medicine2","medicine3","medicine1","medicine2","medicine3","medicine1","medicine2","medicine3","medicine1","medicine2","medicine3","medicine1","medicine2","medicine3","medicine1","medicine2","medicine3","medicine1","medicine2","medicine3","medicine1","medicine2","medicine3","medicine1","medicine2","medicine3","medicine1","medicine2","medicine99999999999999999999999999999999999"]
        
        ScrollView
        {
            VStack(alignment: .leading)
            {
                HStack
                {
                    Spacer()
                    Button(
                        action:
                            {
                                self.notifyIsShown = false
                            },
                        label:
                            {
                                Image(systemName: "multiply.circle.fill")
                                    .font(.title)
                                    .padding([.top, .trailing])
                            })
                }
                Text("上個時段\n忘記吃的藥品清單")
                    .font(.system(size: 26, weight: .heavy, design: .rounded))
                    .foregroundColor(.red)
                    .padding([.leading, .bottom, .trailing])
                
                
                ForEach(0..<forgottenMediceins.count)
                {
                    index in
                    if(index < forgottenMediceins.count)
                    {
                        Text(forgottenMediceins[index])
                    }
                }
                .font(.system(size: 20, weight: .heavy, design: .rounded))
                .foregroundColor(Color(hex: 0x2828FF))
                .lineLimit(nil)
                .padding(.horizontal)
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 40, maxHeight: .infinity, alignment: .leading)
            }
            .overlay(
                EmptyView()
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                    .background(LinearGradient(gradient:
                                                Gradient(
                                                    colors: [Color(hex: 0x4DFFFF), .white, Color(hex: 0x4DFFFF)]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                    .cornerRadius(50)
                    .opacity(0.3)
            )
        }
    }
}

struct NotifyView_Previews: PreviewProvider {
    static var previews: some View {
        NotifyView(notifyIsShown: .constant(true))
    }
}
