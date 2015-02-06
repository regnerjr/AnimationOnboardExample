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
    let widthConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[view(>=\(width))]",
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    let heightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[view(>=\(height))]",
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    return widthConstraint + heightConstraint
}

func getScreenFractionFromBottom(superview: UIView, subView: UIView, fraction: Double) -> [NSLayoutConstraint]{
    let viewsDict: [NSObject: AnyObject] = ["superView": superview, "subView": subView]
    let sizeFromBottom = UIScreen.mainScreen().bounds.height * CGFloat(fraction)
    let heightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[subView]-\(sizeFromBottom)-|",
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    return heightConstraint
}

enum Side {
    case Top
    case Right
    case Left
    case Bottom
}

func standardSizeFromSide(view: UIView, side: Side) -> [NSLayoutConstraint]{
    let viewsDict = ["view": view]
    let constraint: String = {
        switch side {
            case .Top: return "V:|-[view]"
            case .Right: return "H:[view]-|"
            case .Left: return "H:|-[view]"
            case .Bottom: return "V:[view]-|"
        }
    }()

    let sideConstraint = NSLayoutConstraint.constraintsWithVisualFormat(constraint,
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    return sideConstraint
}