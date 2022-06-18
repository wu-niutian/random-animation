//
//  ContentView.swift
//  RandomAnimation
//
//  Created by    wuniutian on 16/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    @State var appleMovementTop = -1000
    @State var appleLeft = -1000 //value of x or y in offset to use later on
    @State var appleMovementBottom = 1000
    @State var appleRight = 1000
    @State var isShrekSheetPresented = false
    @State var isDeadShrekPresented = false
    @State var numOfShrekKilled = 1
    @State var pawPatrolHelpers = false
    @State var pawPatrolMovement = 1000
    @State var pawPatrolRotation: Angle = .zero
    
    func whenDeadShrekIsPresented(){
        withAnimation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 2)){
            if counter == 13 {
                isDeadShrekPresented = true
            }
        }
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .black ]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            
            ZStack{
                VStack{
                    Text("🔪🔪🔪🔪🔪")
                        .font(.system(size:50))
                        .offset(x: 0, y: CGFloat(appleMovementTop))
                    
                    Text("🔪🔪🔪🔪🔪")
                        .font(.system(size:50))
                        .offset(x: 0, y: CGFloat(appleMovementTop))
                    
                    Text("🔪🔪🔪🔪🔪")
                        .font(.system(size:50))
                        .offset(x: 0, y: CGFloat(appleMovementTop))
                    
                    
                    Text("🔪🔪🔪🔪🔪")
                        .font(.system(size:50))
                        .offset(x: 0, y: CGFloat(appleMovementBottom))
                    
                    Text("🔪🔪🔪🔪🔪")
                        .font(.system(size:50))
                        .offset(x: 0, y: CGFloat(appleMovementBottom))
                    
                    Text("🔪🔪🔪🔪🔪")
                        .font(.system(size:50))
                        .offset(x: 0, y: CGFloat(appleMovementBottom))
                    
                    HStack(alignment: .center){
                        VStack{
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:60))
                                .offset(x: CGFloat(appleLeft), y: 0 )
                            
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:60))
                                .offset(x: CGFloat(appleLeft), y: 0 )
                            
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:60))
                                .offset(x: CGFloat(appleLeft), y: 0 )
                            
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:60))
                                .offset(x: CGFloat(appleLeft), y: 0 )
                            
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:60))
                                .offset(x: CGFloat(appleLeft), y: 0 )
                        }
                        
                        HStack{
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:60))
                                .transition(.move(edge: .leading))
                                .offset(x: CGFloat(appleRight), y: 0 )
                            
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:70))
                                .transition(.move(edge: .leading))
                                .offset(x: CGFloat(appleRight), y: 0 )
                            
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:60))
                                .transition(.move(edge: .leading))
                                .offset(x: CGFloat(appleRight), y: 0 )
                            
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:70))
                                .transition(.move(edge: .leading))
                                .offset(x: CGFloat(appleRight), y: 0 )
                            
                            Text("🍎🍎🍎🍎🍎")
                                .font(.system(size:70))
                                .transition(.move(edge: .leading))
                                .offset(x: CGFloat(appleRight), y: 0 )
                        }
                    }
                }
                
                Image("KoolShrek")
                    .cornerRadius(.infinity)
                    .frame(width: 200, height: 200)
                    .offset(y: -50)
                
                
                VStack{
                    if pawPatrolHelpers{
                        VStack{
                            Text("RING RING PAW PATROL IS HERE TO SAVE YOU!")
                                .foregroundColor(.white)
                                .bold()
                            Image("PawPatrolSavers")
                            Image("PawPatrolSavers")
                            Image("PawPatrolSavers")
                            Image("PawPatrolSavers")
                            
                        }
                        .rotation3DEffect(pawPatrolRotation, axis:( 0, 2, 1))
                        .offset(y: -25)
                        .transition(.move(edge: .bottom))
                        .onAppear{
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 2)){
                                pawPatrolRotation = .degrees (720)
                            }
                        }
                    }
                    if isDeadShrekPresented{
                        withAnimation(.easeIn(duration: 20)){
                            VStack {
                                Text("OH NO! You are hacked by Shreks!!")
                                    .font(.system(size:20))
                                    .bold()
                                    .foregroundColor(.white)
                                Image("FunnyShrek")
                                Image("FunnyShrek")
                                Image("FunnyShrek")
                                Image("FunnyShrek")
                            }
                            .offset(y: -400)
                            .onAppear{
                                withAnimation(.easeIn(duration:20)){
                                }
                            }
                        }
                    }
                }
                Button{
                    withAnimation {
                        counter += 1
                        
                        appleMovementTop = 1000
                        appleLeft = -1000
                        appleMovementBottom = -1000
                        appleRight = -1000
                        
                        if counter % 6 == 0 {
                            isShrekSheetPresented = true
                        }
                        if counter > 12 {
                            pawPatrolMovement = -1000
                            appleMovementTop = -1000
                            appleLeft = 1000
                            appleMovementBottom = 1000
                            appleRight = 1000
                        }
                        
                        if counter == 13  {
                            whenDeadShrekIsPresented()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation{
                                appleMovementTop = -1000
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                            withAnimation{
                                appleMovementBottom = 1000
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                            withAnimation{
                                appleLeft = 1000
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                            withAnimation{
                                appleRight = 1000
                            }
                        }
                    }
                } label: {
                    Text("Tap to start")
                        .font(.system(size: 30))
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                    
                }
                .offset(y: 370)
            }
            
        }
        .onTapGesture {
            counter +=  1
        }
        
        .sheet(isPresented: $isShrekSheetPresented, onDismiss: {
            if counter == 12 {
                pawPatrolHelpers = true 
            }
        }) {
            ShrekSheet(isTrue: true, numOfShrekKilled: (counter / 6))
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

