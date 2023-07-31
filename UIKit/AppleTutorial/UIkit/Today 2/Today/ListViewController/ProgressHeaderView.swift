//
//  ProgressHeaderView.swift
//  Today
//
//  Created by Kim Yewon on 2023/07/07.
//

import UIKit


// Instead of deleting view when a user scrolls them out of the visible bounds,
// the UICollectionReusableView class keeps views in the reuse queue.
// You can use UICollectionReusableView to create supplementary views.
// Supplementary views are separate from the individual collection view cells, so they are ideal for creating headers ro footers.

class ProgressHeaderView: UICollectionReusableView {
    // The element kind specifies a type of supplementary view that the collection view can present.
    static var elementKind: String { UICollectionView.elementKindSectionHeader }
    
    var progress: CGFloat = 0 {
        didSet {
            setNeedsLayout() // Calling setNeedsLayout() invalidates the current layout and triggers an update.
            heightConstraint?.constant = progress * bounds.height
            UIView.animate(withDuration: 0.2) { [weak self] in
                // layoutIfNeeded() method forces the view to update its layout immediately by animating the hieght changes of the upper and lower views.
                self?.layoutIfNeeded()
            }
        }
    }
    
    private let upperView = UIView(frame: .zero)
    private let lowerView = UIView (frame: .zero)
    private let containerView = UIView(frame: .zero)
    private var heightConstraint: NSLayoutConstraint?
    private var valueFormat: String {
        NSLocalizedString("%d present", comment: "progress percentage value format")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubviews()
        
        
        // Recall from Examining accessibility in Today that isAccessibilityElement indicates whether the element is an accessibility element that an assistive technology can access. Standard UIKit controls enable this value by default.
        isAccessibilityElement = true
        accessibilityLabel = NSLocalizedString("Progress", comment: "Progress view accessibility label")
        
        // You can describe how accessibility elements behave using UIAccessibilityTraits. VoiceOver reads that the progress view updates frequently to signal to users that they may want to return to this view.
        accessibilityTraits.update(with: .updatesFrequently)
    }
    
    // You don't need init(coder:) because you're not loading this view from a storyboard.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    
    // Your views uses its corner radius to create the appearance of a circle.
    // You'll customize the view's layout behavior so that you can adjust the corner radius whenever the size changes.
    override func layoutSubviews() {
        super.layoutSubviews()
        accessibilityValue = String(format: valueFormat, Int(progress * 100.0))
        heightConstraint?.constant = progress * bounds.height
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 0.5 * containerView.bounds.width
    }
    
    private func prepareSubviews() {
        containerView.addSubview(upperView)
        containerView.addSubview(lowerView)
        addSubview(containerView)
        
        upperView.translatesAutoresizingMaskIntoConstraints = false
        lowerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
        
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        
        upperView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        upperView.bottomAnchor.constraint(equalTo: lowerView.topAnchor).isActive = true
        lowerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        upperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        upperView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lowerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lowerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        heightConstraint = lowerView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true
        
        backgroundColor = .clear
        containerView.backgroundColor = .clear
        upperView.backgroundColor = .todayProgressUpperBackground
        lowerView.backgroundColor = .todayProgressLowerBackground
    }
    
}
