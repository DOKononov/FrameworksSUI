//
//  FrameworkDetailView.swift
//  FrameworksSUI
//
//  Created by Dmitry Kononov on 5.01.24.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @Binding var isShowingDetailsView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button {
                    isShowingDetailsView = false
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
  
            
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            Button {
                 isShowingSafariView = true
            } label: {
                FramworksButton(title: "Learn more")
            }
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString)!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.frameworks.first!,
                            isShowingDetailsView: .constant(false))
    }
}
