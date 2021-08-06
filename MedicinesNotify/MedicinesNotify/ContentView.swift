//
//  ContentView.swift
//  MedicinesNotify
//
//  Created by USER on 2021/8/4.
//

import SwiftUI

struct ContentView: View {
    @State private var sel: Int? = nil
    @State var counters = ["a","b","c"]
    @State private var action: Int? = nil
    @State var selection: Int? = nil
    
    var body: some View {
        //Text("Hello, world!")
        //    .padding()
        let fakeMedicineItem: MedicineItem = MedicineItem(imgUrl: "photo.fill", name: "medicineName", info:"info", timing: "睡前", timePeriod: MedicineItemTimePeriod(morning: true, noon: true, evening: true), isSelected: false)
        
        ////////////////////////////////////////////
        NavigationView {
                    VStack {
                        Text("Main Content View")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .foregroundColor(Color.blue)
                        Spacer()
                        NavigationLink(destination: AddMedicineFrameView(medicineItem: fakeMedicineItem)) {
                            Text("Awesome Button")
                            .frame(minWidth: 0, maxWidth: 300)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .font(.title)
                    }
                  }
                    .navigationBarTitle("123")
                    //.navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
        }
        
        ////////////////////////////////////////////
        NavigationView {
                List {
                    ForEach(counters, id: \.self) { counter in
                        NavigationLink(destination: ContentView22()
                        
                                        
                        ) {
                            //CounterCell(counter: counter)
                            
                            HStack
                            {
                                Image(systemName: "minus.circle.fill")
                                Text(String(counter))
                            }
                            
                        }
                    }
                }
                .navigationBarTitle("456")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action:
                                                {
                                                    
                                                },
                                               label:
                                                {
                                                    Image(systemName:"chevron.left.circle.fill")
                                                        .font(.largeTitle)
                                                }))
        }
        
        ////////////////////////////////////////////
        NavigationView {
                //List {
                VStack{
                    
                    //ForEach(counters, id: \.self) { counter in
                    ForEach(0..<counters.count) { counter in
                        
                        HStack
                        {
                            NavigationLink(destination: Text(counters[counter]), tag: counter, selection: $sel) {
                                EmptyView()
                            }
                            Image(systemName: "minus.circle.fill")
                                .onTapGesture {
                                    //perform some tasks if needed before opening Destination view
                                    self.sel = counter
                                }
                                .frame(width: 20, height:20)
                            
                            
                            Text("123")
                            //Text(counters[counter])
                            Text(String(counter))
                            //Text(counter)
                            Spacer()
                            Text("789")
                        }
                        
                        
                    }
                    
                //}
                }
        }

        ////////////////////////////////////////////
        NavigationView {
            List
            {
                HStack
                {
                    Text("1111")
                    
                    NavigationLink(destination: Text("Test"), tag: 1, selection: $selection) {
                        
                        Button(action: {
                            print("login tapped")
                            self.selection = 1
                        }) {
                            HStack {
                                Spacer()
                                Text("Login").foregroundColor(Color.white).bold()
                                Spacer()
                            }
                            
                        }
                        .accentColor(Color.black)
                        .padding()
                        .background(Color(UIColor.darkGray))
                        .cornerRadius(4.0)
                        .padding(Edge.Set.vertical, 20)
                    }
                }
                
                HStack
                {
                    Text("2222")
                    
                    NavigationLink(destination: Text("Test222"), tag: 2, selection: $selection) {
                        
                        
                        Button(action: {
                            print("login tapped")
                            self.selection = 2
                        }) {
                            HStack {
                                Spacer()
                                Text("Login").foregroundColor(Color.white).bold()
                                Spacer()
                            }
                            
                        }
                        .accentColor(Color.black)
                        .padding()
                        .background(Color(UIColor.darkGray))
                        .cornerRadius(4.0)
                        .padding(Edge.Set.vertical, 20)
                    }
                }
            }
        }
        ////////////////////////////////////////////
    }
}
    
    struct CounterCell: View {

    @State var counter: String
    @State var inc = 0

    var body: some View {
        HStack {
            Button(action: { self.inc += 1 }) {
                Text("plus")
            }
            Button(action: { self.inc -= 1 }) {
                Text("minus")
            }
            Text(" counter: \(counter) value: \(inc)")
        }
    }
    }

struct ContentView22: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("123123")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            })
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
