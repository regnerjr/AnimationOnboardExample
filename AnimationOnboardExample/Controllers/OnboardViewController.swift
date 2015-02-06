import UIKit

class OnboardViewController: UIViewController {

    let screenBounds = UIScreen.mainScreen().bounds
    
    let centerTextView: UITextView = {
        let view = UITextView(frame: CGRectZero, textContainer: nil)
        view.backgroundColor = UIColor.clearColor()
        view.text = "Welcoming to the onboarding screen\nSwipe Left to Right to continue."
        view.editable = false
        view.allowsEditingTextAttributes = false
        view.textAlignment = NSTextAlignment.Center
        view.selectable = false
        view.font = UIFont.italicSystemFontOfSize(20.0)
        
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }()

    let redView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.redColor()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }()

    override func loadView() {
        view = UIView(frame: screenBounds)
        view.backgroundColor = UIColor.greenColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(centerTextView)
        view.addSubview(redView)

        let centered = getCenterXandYConstraintsfor(view, centerTextView)
        view.addConstraints(centered)
        let widthHeight = getWidthHeight(centerTextView, Int(screenBounds.width / 2), Int(screenBounds.width / 2) )
        centerTextView.addConstraints(widthHeight)

        let oneThirdFromBottom = getScreenFractionFromBottom(view, redView, 1.0/8.0)
        let space = standardSizeFromSide(redView, Side.Left)
        view.addConstraints(oneThirdFromBottom + space)
        
        let redSquareSize = 60
        redView.layer.cornerRadius = CGFloat(redSquareSize / 2 )
        let redWidthHeight = getWidthHeight(redView, redSquareSize, redSquareSize)
        redView.addConstraints(redWidthHeight)
       
        //add animations to the red circle
//        redView.layer.addAnimation(getFadeAnimation(), forKey: "BigFade")
        redView.layer.addAnimation(getFadeKeyFrameAnimation(), forKey: "BigFade")
        redView.layer.addAnimation(getZoomOffScreenLeftToRight(), forKey: "translateX")
    }
}