//
//  CustomButton.swift
//  UIKit-maraphone-2
//
//  Created by Surgeont on 06.07.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    private var animator: UIViewPropertyAnimator?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configuration = createConfiguration()
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConfiguration() {
        super.updateConfiguration()
        guard let configuration = configuration else {
            return
        }
        
        var updatedConfiguration = configuration
        
        var background = UIButton.Configuration.plain().background
        
        let foregroundColor: UIColor
        let backgroundColor: UIColor
        let baseColor = updatedConfiguration.baseForegroundColor ?? UIColor.tintColor
        
        switch self.state {
        case .normal:
            foregroundColor = .white
            backgroundColor = baseColor
        case [.highlighted]:
            foregroundColor = .white
            backgroundColor = baseColor
        case .selected:
            foregroundColor = .white
            backgroundColor = baseColor
        case [.selected, .highlighted]:
            foregroundColor = .white
            backgroundColor = .red
        case .disabled:
            foregroundColor = .white
            backgroundColor = .blue
        default:
            foregroundColor = .white
            backgroundColor = .blue
        }
        
        background.backgroundColorTransformer = UIConfigurationColorTransformer { color in
            
            return backgroundColor
        }
        
        updatedConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var container = incoming
            container.foregroundColor = foregroundColor
            return container
        }
        
        updatedConfiguration.background = background
        self.configuration = updatedConfiguration
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let animator {
            animator.stopAnimation(true)
        }
        
        animator = UIViewPropertyAnimator(duration: 0.15, curve: .easeIn) {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        animator?.startAnimation()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if let animator {
            animator.stopAnimation(true)
        }
        animator = UIViewPropertyAnimator(duration: 0.15, curve: .easeIn) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        animator?.startAnimation()
    }
}

private extension CustomButton {
    func createConfiguration() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.buttonSize = .medium
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePadding = 8
        configuration.imagePlacement = .trailing
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        return configuration
    }
}
