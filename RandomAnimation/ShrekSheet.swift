//
//  ShrekSheet.swift
//  RandomAnimation
//
//  Created by    wuniutian on 16/6/22.
//

import SwiftUI


struct ShrekSheet: View {
    var isTrue: Bool
    var numOfShrekKilled: Int
    
    var body: some View {
        VStack{
            Image("ShrekAfterDeath")
                .frame(width: 500, height: 500)
                .padding()
            Text("Congrats!                                        You have killed \(numOfShrekKilled) Shrek!")
                .font(.system(size:30))
                .bold()
        }
    }
}

struct ShrekSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShrekSheet(isTrue: true, numOfShrekKilled: 0)
    }
}
