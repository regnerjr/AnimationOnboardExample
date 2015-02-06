# AnimationOnboardExample #

I wanted to be able to build a modern iOS App using only code. This app is a
single view app which uses Swift and Auto Layout as well as some Core Animation.
Currently this is just one view controller with some simple text and an
animation.

The Application Delegate Creates a window and configures it as the key window
with `OnboardViewController` as the Root View Controller.

`OnboardViewController.swift` creates its own view by overriding `loadView()`
since there is no view supplied by a storyboard or nib. Then in `viewDidLoad()`
we add 2 subviews with Autolayout Constraints. Finally we add some animations to
the smaller red view.

Helper functions for Core Animation are defined in
`Extensions/CoreAnimationHelperFunctions.swift` and helper functions for Auto
Layout are similarly stored in `Extenstions/AutoLayoutHelperFunctions.swift`

