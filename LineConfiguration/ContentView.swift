//
//  ContentView.swift
//  LineConfiguration
//
//  Created by Sumit on 08/11/24.
//

import SwiftUI

struct ContentView: View {

    @State var count:Int = 0

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    count += 1
                }) {
                  Text("Tracking status points")
                    .padding()
                    .foregroundColor(.black)
                    .background(.orange)
                    .cornerRadius(10)
                    .font(.system(size: 22, weight: .bold, design: .default))
                }
                HStack {
                    VStack {
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 200,height:580)
                            .overlay(content: {
                                VStack(spacing:0) {
                                    Spacer()
                                    Text("Succussful Done")
                                        .foregroundStyle(.red)
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                        .padding(.bottom,100)
                                    Text("Location Phase")
                                        .foregroundStyle(.red)
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                        .padding(.bottom,100)
                                    Text("Packing Phase")
                                        .foregroundStyle(.red)
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                        .padding(.bottom,100)
                                    Text("Ongoing Phase")
                                        .foregroundStyle(.red)
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                        .padding(.bottom,100)
                                    Text("Shipping Start")
                                        .foregroundStyle(.red)
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                }
                                .padding(.bottom,14)
                            })
                    }
                    
                    VStack {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 200,height:600)
                            .overlay(content: {
                            if count == 1 {
                                LineView(fillCountStateOne: true, fillCountStateTwo: false, fillCountStateThree: false, fillCountStateFour: false)
                                
                               } else if count == 2 {
                                  LineView(fillCountStateOne: true, fillCountStateTwo: true, fillCountStateThree: false, fillCountStateFour: false)
                              } else if count == 3 {
                                 LineView(fillCountStateOne: true, fillCountStateTwo: true, fillCountStateThree: true, fillCountStateFour: false)
                              }
                                else if count == 4 {
                                   LineView(fillCountStateOne: true, fillCountStateTwo: true, fillCountStateThree: true, fillCountStateFour: true)
                            }
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
