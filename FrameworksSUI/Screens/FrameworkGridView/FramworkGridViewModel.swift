//
//  FramworkGridViewModel.swift
//  FrameworksSUI
//
//  Created by Dmitry Kononov on 5.01.24.
//

import SwiftUI

final class FramworkGridViewModel: ObservableObject {
    @Published var isShowingDetailsView = false
    
    var selectedFramwork: Framework? {
        didSet { isShowingDetailsView = true }
    }
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
}
