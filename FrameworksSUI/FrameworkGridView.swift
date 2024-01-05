//
//  FrameworkGreedView.swift
//  FrameworksSUI
//
//  Created by Dmitry Kononov on 18.12.23.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FramworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramwork = framework
                            }
                    }
                }
            }
            .navigationTitle("🤔 Frameworks")
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


struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

struct FrameworkGreedView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
