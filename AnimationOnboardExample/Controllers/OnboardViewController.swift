import UIKit

class OnboardViewController: UIViewController {

    let screenBounds = UIScreen.mainScreen().bounds
    let blueSquare: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.blueColor()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }()
    
    override func loadView() {
        view = UIView(frame: screenBounds)
        view.backgroundColor = UIColor.greenColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add a blue square
        view.addSubview(blueSquare)
       
        
        let centered = getCenterXandYConstraintsfor(view, blueSquare)
        view.addConstraints(centered)
        let widthHeight = getWidthHeight(blueSquare, 200, 200)
        blueSquare.addConstraints(widthHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

