//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Peyton Shetler on 10/5/20.
//

import SwiftUI


class GlobalEnvironment: ObservableObject {
    
    @Published var display = ""
    
    func recieveInput(calcButton: CalculatorButton) {
        self.display = calcButton.title
        
        // if AC, set display to 0
        
        // if operator, add to expression
        
        // if number, not sure yet haha
    }
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                
                HStack(spacing: 12) {
                    Spacer()
                    Text(env.display).foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            
                            CalculatorButtonView(button: button)
                            
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
            .environmentObject(GlobalEnvironment())
    }
}
