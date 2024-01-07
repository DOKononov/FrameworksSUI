//
//  FrameworkGreedView.swift
//  FrameworksSUI
//
//  Created by Dmitry Kononov on 18.12.23.
//

import SwiftUI

struct FrameworkGridView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(
                        destination: FrameworkDetailView(
                            framework: framework)) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
        
    }
}

struct FrameworkGreedView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
