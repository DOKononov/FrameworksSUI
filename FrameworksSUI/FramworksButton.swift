//
//  FramworksButton.swift
//  FrameworksSUI
//
//  Created by Dmitry Kononov on 5.01.24.
//

import SwiftUI

struct FramworksButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .frame(width: 280, height: 50)
            .fontWeight(.semibold)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct FramworksButton_Previews: PreviewProvider {
    static var previews: some View {
        FramworksButton(title: "Test title")
    }
}
