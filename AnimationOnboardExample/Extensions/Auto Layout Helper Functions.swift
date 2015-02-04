import UIKit

func getCenterXandYConstraintsfor(superview: UIView, subview: UIView)-> [NSLayoutConstraint]{

    let viewsDict = ["superview":superview, "subview": subview]
    let horizontalconstraints =
        NSLayoutConstraint.constraintsWithVisualFormat("H:[superview]-(<=1)-[subview]",
            options: NSLayoutFormatOptions.AlignAllCenterY,
            metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    let verticalconstraints =
        NSLayoutConstraint.constraintsWithVisualFormat("V:[superview]-(<=1)-[subview]",
            options: NSLayoutFormatOptions.AlignAllCenterX,
            metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    
    return horizontalconstraints + verticalconstraints
}

func getWidthHeight(view: UIView, width: Int, height: Int) -> [NSLayoutConstraint]{
    let viewsDict = ["view": view]
    let widthConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[view(>=200)]",
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    let heightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[view(>=200)]",
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    return widthConstraint + heightConstraint
}