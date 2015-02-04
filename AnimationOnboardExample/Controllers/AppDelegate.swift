import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = OnboardViewController(nibName: nil, bundle: nil)
        window?.backgroundColor = UIColor.whiteColor()
        window?.makeKeyAndVisible()
        
        return true
    }
}
