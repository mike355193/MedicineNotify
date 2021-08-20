//
//  BurgerListView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/19.
//

import SwiftUI

struct BurgerListView: View {
    @Binding var burgerView: Bool
    let screenX = UIScreen.main.bounds.width
    let screenY = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading)
        {
            Text("我的藥單")
                .padding(.top, 450)
            Text("異常用藥紀錄")
                .padding(.top)
        }
        .frame(width: screenX, height: screenY, alignment: .trailing)
        .overlay(
            EmptyView()
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                //.background(Color.gray)
                .background(LinearGradient(gradient:
                                            Gradient(
                                                colors: [Color(hex: 0x2828FF), .white, Color(hex: 0x2828FF)]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                .cornerRadius(20)
                .opacity(0.3)
                )
        .padding(.horizontal)
        .offset(x: burgerView ? screenX * -1/1.5 : screenX, y: burgerView ? screenY * -1/1.2 : screenY)
    }
}

struct BurgerListView_Previews: PreviewProvider {
    //@State var burgerView = true
    static var previews: some View {
        BurgerListView(burgerView: .constant(true))
    }
}
