import UIKit

/**
    Returns an autorepeating fade in-out from 0.5 to 1.0 and back, using EaseInEaseOut timing

    :returns: A simple repeating opacity animation.
*/
func getFadeAnimation() -> CABasicAnimation {
    let fader = CABasicAnimation(keyPath: "opacity")
    fader.fromValue = 0.5
    fader.toValue = 1.0
    fader.autoreverses = true
    fader.repeatCount = MAXFLOAT
    fader.duration = 0.5
    fader.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    return fader
}

/**
    Returns an autorepeating fade in-out opacity change. This is a key Frame animation
    using values of 0.0, 1.0, 1.0, 1.0, 0.0.

    :returns: A simple repeating opacity animation.
*/
func getFadeKeyFrameAnimation() -> CAKeyframeAnimation {
    let fader = CAKeyframeAnimation(keyPath: "opacity")
    fader.values = [
        0.0, 1.0, 1.0, 1.0, 0.0
    ]
//    fader.autoreverses = true
    fader.repeatCount = MAXFLOAT
    fader.duration = 2.0
    return fader
}
/**
    Returns an autorepeating animation moving the layer it is applied to off screen to the left

    :returns: A simple repeating opacity animation.
*/
func getZoomOffScreenLeftToRight() -> CAKeyframeAnimation{
    let translateX = CAKeyframeAnimation(keyPath: "transform")
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let translation = CATransform3DMakeTranslation(screenWidth + 100, 1, 1) // + 100 to scroll all the way off the screen
    translateX.values = [
        NSValue(CATransform3D: CATransform3DIdentity),
        NSValue(CATransform3D: translation),
    ]
    translateX.repeatCount = MAXFLOAT
    translateX.duration = 2.0
    return translateX
}