//
//  FrameworkGreedView.swift
//  FrameworksSUI
//
//  Created by Dmitry Kononov on 18.12.23.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FramworkGridViewModel()

    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramwork = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailsView) {
                if let framework = viewModel.selectedFramwork {
                    FrameworkDetailView(
                        framework: framework,
                        isShowingDetailsView: $viewModel.isShowingDetailsView)
                }
            }
        }

    }
}

struct FrameworkGreedView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
