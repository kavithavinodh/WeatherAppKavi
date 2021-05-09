//
//  LottieFile.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import SwiftUI
import Lottie
struct LottieView: UIViewRepresentable {
    var name : String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>)  -> some UIView {
        let view = UIView()
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        uiView.subviews.forEach({$0.removeFromSuperview()})
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)
        ])
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
    }
}
