//
//  CalculatorButtonView.swift
//  CalculatorSwiftUI
//
//  Created by Peyton Shetler on 10/9/20.
//

import SwiftUI

struct CalculatorButtonView: View {
    
    var button: CalculatorButton
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        Button(action: {
            
            self.env.recieveInput(calcButton: self.button)
            
        }, label: {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: self.buttonWidth(button: button),
                       height: self.buttonHeight()
                )
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(self.buttonWidth(button: button))
        })
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView(button: .one)
            .environmentObject(GlobalEnvironment())
    }
}
