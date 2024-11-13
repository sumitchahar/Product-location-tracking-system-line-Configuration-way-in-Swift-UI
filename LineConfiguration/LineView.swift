//
//  LineView.swift
//  LineConfiguration
//
//  Created by Sumit on 08/11/24.

 import SwiftUI

struct LineView: View {
    
    @State var fillCountStateOne:Bool
    @State var fillCountStateTwo:Bool 
    @State var fillCountStateThree:Bool
    @State var fillCountStateFour:Bool
    @State  var startAnimation:Bool = false
    @State  var duration:CGFloat = 0.8
    @State  var animationAmount:CGFloat = 1.0
    @State  var offset: CGFloat = 0.0
    @State  var animating:Bool = false

    
    let transition = AnyTransition.asymmetric(insertion: .scale, removal: .scale).combined(with: .opacity)

    @State private var lineStateBool = false
    
    var body: some View {
        HStack {
            VStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 224, height:600)
                    .overlay(content: {
                        VStack(spacing:0) {
                            Spacer()
                            if fillCountStateFour {
                                HStack {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(.brown, lineWidth: 3)
                                            .cornerRadius(40/2)
                                            .frame(width:40,height:30)
                                            .shadow(color:.yellow,radius: 5)
                                            .overlay(content: {
                                                Circle()
                                                    .fill(.red)
                                                    .frame(width:20,height:20)
                                            })
                                            .scaleEffect(animationAmount)
                                            .animation(.easeInOut(duration: 1.2), value: animationAmount)
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 4, height: 4, alignment: .center)
                                            .cornerRadius(6/2)
                                            .offset(x: -14)
                                            .rotationEffect(.degrees(startAnimation ? 360 : 0))
                                            .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false),
                                                       value: startAnimation
                                            )
                                    }
                                    HStack {
                                        Text("Ending point")
                                            .foregroundStyle(.black)
                                            .font(.system(size: 22, weight: .bold, design: .default))
                                            .padding(.bottom , 6)
                                    }
                                }
                                .padding(.bottom,-2)
                                .padding(.leading,-5)

                                ZStack {
                                    Rectangle()
                                        .fill(.yellow)
                                        .frame(width: 3, height: 106)
                                        .transition(transition)
                                        .animation(.default.speed(0.5), value: lineStateBool)
                                        .padding(.leading,-74)
                                        .padding(.bottom,-3)
                                }
                                
                                HStack {
                                    Rectangle()
                                        .fill(.orange)
                                        .frame(width: 20, height: 20)
                                        .cornerRadius(10)
                                    Text("Four Steps")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                }
                                 .padding(.bottom,-3)
                                 .padding(.leading,-24)

                            }
                            if fillCountStateThree {
                                Rectangle()
                                    .fill(.green)
                                    .frame(width: 3, height: 106)
                                    .padding(.leading,-74)
                                    .padding(.bottom,-3)

                                HStack {
                                    Rectangle()
                                        .fill(.blue)
                                        .frame(width: 20, height: 20)
                                        .cornerRadius(10)
                                    Text("Third Steps")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                }
                                 .padding(.bottom,-3)
                                 .padding(.leading,-18)
                            }
                            
                            if fillCountStateTwo {
                                
                                Rectangle()
                                    .fill(.red)
                                    .frame(width: 3, height: 106)
                                    .padding(.leading,-74)
                                    .padding(.bottom,-3)
                                HStack {
                                    Rectangle()
                                        .fill(.yellow)
                                        .frame(width: 20, height: 20)
                                        .cornerRadius(10)
                                    Text("Second Steps")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                       // .padding(.bottom , 16)
                                }.padding(.bottom,-3)
                                 .padding(.leading,4)

                            }
                            
                            if fillCountStateOne {
                                Rectangle()
                                    .fill(.green)
                                    .frame(width: 3, height: 106)
                                    .transition(.move(edge: .bottom).combined(with: .move(edge: .top)))
                                    .padding(.leading,-74)
                                HStack {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(.brown, lineWidth: 3)
                                            .cornerRadius(40/2)
                                            .frame(width:40,height:30)
                                            .shadow(color:.yellow,radius: 5)
                                            .overlay(content: {
                                                Circle()
                                                    .fill(.red)
                                                    .frame(width:20,height:20)
                                            })
                                            .scaleEffect(animationAmount)
                                            .animation(.easeInOut(duration: 1.2), value: animationAmount)
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 4, height: 4, alignment: .center)
                                            .cornerRadius(6/2)
                                            .offset(x: -14)
                                            .rotationEffect(.degrees(startAnimation ? 360 : 0))
                                            .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false),
                                                       value: startAnimation
                                            )
                                        
                                        
                                    }.padding(.bottom)
                                    
                                    HStack {
                                        Text("Staring point")
                                            .foregroundStyle(.black)
                                            .font(.system(size: 22, weight: .bold, design: .default))
                                            .padding(.bottom , 16)
                                        
                                    }
                                }.onAppear(){
                                    if fillCountStateOne {
                                        withAnimation {
                                            self.startAnimation.toggle()
                                        }
                                        animationAmount += 0.1
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                            animationAmount  = 1.0
                                        }
                                        
                                        offset = offset == 0 ? 60 : 0
                                        animating = true
                                    }

                                }
                            }
                        }
                    })
            }
        }
        .padding()
    }
}

#Preview {
LineView(fillCountStateOne: true, fillCountStateTwo: true, fillCountStateThree: true, fillCountStateFour: true)
}
