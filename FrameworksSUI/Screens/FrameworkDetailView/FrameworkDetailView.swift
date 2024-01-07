//
//  FrameworkDetailView.swift
//  FrameworksSUI
//
//  Created by Dmitry Kononov on 5.01.24.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {

            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            Button {
                 isShowingSafariView = true
            } label: {
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString)!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.frameworks.first!)
    }
}
