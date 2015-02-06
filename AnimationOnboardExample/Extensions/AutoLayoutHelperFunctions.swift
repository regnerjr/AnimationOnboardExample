import UIKit

/**
    A simple function for gettting Auto Layout constraints for centering a subview in a superview.

    The returned constraints should be applied to the superview. 

    :param: superview The view to be centered in
    :param: subview The view which should be centered
    :returns: [NSLayoutConstriant] Array of NSLayoutConstraint describing the centering of subview in superview
*/
func getCenterXandYConstraintsfor(#superview: UIView, #subview: UIView)-> [NSLayoutConstraint]{

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

/**
    A simple function for gettting Auto Layout constraints for setting an explicit height and width for a view

    The returned constraints should be applied to the view.

    :param: view The view to be explicitly sized
    :param: width The explicit width of the view
    :param: height The explicit height of the view
    :returns: [NSLayoutConstriant] Array of NSLayoutConstraint describing height and width of the view
*/
func getWidthHeight(#view: UIView, #width: Int, #height: Int) -> [NSLayoutConstraint]{
    let viewsDict = ["view": view]
    let widthConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[view(>=\(width))]",
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    let heightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[view(>=\(height))]",
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    return widthConstraint + heightConstraint
}

//TODO: Fix this so it can take a size parameter and do a fraction of the with or height from top, bottom, left, right
/**
    Returns Autolaytout Constraints for setting an view fraction the superviews size from the Bottom

    The returned constraints should be applied to the superview.

    :param: superview The views superview
    :param: view The view to be constrained
    :param: fraction The fraction of the superview to use for the constraint
    :returns: [NSLayoutConstriant] Array of NSLayoutConstraint describing spacing between the view and superview
*/
func getScreenFractionFromBottom(#superview: UIView, #subview: UIView, #fraction: Double) -> [NSLayoutConstraint]{
    let viewsDict: [NSObject: AnyObject] = ["superview": superview, "subview": subview]
    let sizeFromBottom = UIScreen.mainScreen().bounds.height * CGFloat(fraction)
    let heightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[subview]-\(sizeFromBottom)-|",
        options: NSLayoutFormatOptions.allZeros,
        metrics: nil, views: viewsDict) as [NSLayoutConstraint]
    return heightConstraint
}

/**
    Describes where constraints can be placed on the side of an item
*/
enum Side {
    case Top
    case Right
    case Left
    case Bottom
}

/**
    Returns Autolaytout Constraints for setting the system standard space from a side of the superview

    The returned constraints should be applied to the superview.

    :param: view The view to be constrained
    :param: side A Side (.Top, .Right, .Left, .Bottom)
    :returns: [NSLayoutConstriant] A standard spacing between view and superview
*/
func standardSizeFromSide(view: UIView, #side: Side) -> [NSLayoutConstraint]{
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