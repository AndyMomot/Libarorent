//
//  PreloaderViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 06.10.2024.
//

import Foundation

extension PreloaderView {
    final class PreloaderViewModel: ObservableObject {
        @Published var progress: Float = 0.0
        @Published var timer: Timer?
        
        func startLoading() {
            timer?.invalidate()
            timer = nil
            
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
                guard let self else { return }
                let value: Float = 0.005
                
                if (self.progress + value) > 1 {
                    self.progress = 1
                } else {
                    self.progress += value
                }
                
                if self.progress >= 1 {
                    timer.invalidate()
                    self.onDidLoad()
                }
            })
        }
        
        func onDidLoad() {
            
        }
    }
}
