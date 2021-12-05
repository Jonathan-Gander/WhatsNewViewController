# A nice way to present your new app features

`WhatsNewViewController` lets you present to your users your app new features in a pretty way (see screenshots below). For example, when you have released an update and you want to explain what is new.

This project is an example/demo app for this `WhatsNewViewController`. It is built for iOS using Swift and UIKit. It is easy to use and to control, to start using it quickly in your app and concentrate on your own app business core.

This app only provides a button to display `WhatsNewViewController` with random settings. And a text label to display delegate methods results.

## 🆕 SwiftUI support

If you're using SwiftUI in your project, have a look on [Jonathan-Gander/WhatsNewView](https://github.com/Jonathan-Gander/WhatsNewView).

## Features

- Title and subtitle
- List of all features with image, title, text
- A Continue button (hiddable)
- A More info button (hiddable)
- Change tint color (with light/dark mode)
- Vertical and horizontal orientation
- Delegate methods to handle user interactions

## Setup

Simply take files in `WhatsNew` folder and add them to your project.

## Usage

```swift
// Create your features (array of WhatsNewFeature)
// You can change title, text and image for each feature.
let features = [
    WhatsNewFeature(title: "First amazing feature", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam accumsan pretium arcu, sit amet porta lectus ultrices sed.", image: UIImage(systemName: "paintbrush")),
    WhatsNewFeature(title: "Second feature", text: "Sed lacinia tortor nunc, at eleifend mi porta eu.", image: UIImage(systemName: "globe.europe.africa.fill")),
    WhatsNewFeature(title: "Another one", text: "Sed ex risus, vehicula et finibus et, venenatis vitae nisi.", image: UIImage(systemName: "megaphone")),
]

// Create your WhatsNewViewController
let vc = WhatsNewViewController.create(withFeatures: features, delegate: self)

// Customize it:
// Color
vc.mainColor = .systemPink
        
// Title
vc.titleText = "What's New"
    
// Subtitle
vc.subtitleText = "In version 1.0.10"
    
// Continue button (note: You can also set it to nil to hide it)
vc.continueText = "Continue"
    
// More info button (note: You can also set it to nil to hide it)
vc.moreInfoText = "More info"

// Allow user to copy cells (default is false)
//vc.allowCopy = true

// Display it as a UIViewController
self.present(vc, animated: true, completion: nil)
```

Delegate methods:

```swift
func whatsNewViewControllerDidTapContinueButton(_ whatsNewViewController: WhatsNewViewController) {
    // When Continue button was tapped
}
    
func whatsNewViewControllerDidTapMoreInfoButton(_ whatsNewViewController: WhatsNewViewController) {
    // When More info button was tapped
}
    
func whatsNewViewController(_ whatsNewViewController: WhatsNewViewController, didTapFeature feature: WhatsNewFeature, atIndex index: Int) {
    // When a feature was tapped. You can get its index (from your inital array).
}
```

## Screenshots

Here are few screenshots (with random texts!) of the app:

![Simulator Screen Shot - iPhone 12 - 2021-10-09 at 09 16 36](https://user-images.githubusercontent.com/1695222/136648400-68cb00cc-c3c6-4263-a232-640c9a2f2693.png)
![Simulator Screen Shot - iPhone 12 - 2021-10-09 at 09 17 13](https://user-images.githubusercontent.com/1695222/136648401-4575e66c-52c5-4a4d-9059-c7ed9786a305.png)

![Simulator Screen Shot - iPhone 12 - 2021-10-09 at 09 54 21](https://user-images.githubusercontent.com/1695222/136649607-463c2549-7d6c-4440-be15-44b63dfd83c8.png)
![Simulator Screen Shot - iPhone 12 - 2021-10-09 at 09 55 37](https://user-images.githubusercontent.com/1695222/136649647-b7588b5c-88d2-419e-a20f-f986d1508464.png)

## Use with Objective-C code

`WhatsNewViewController` and its protocol, struct and class are built in Swift. If you want to use it with your Objective-C project, it is possible.

Follow next steps:

`WhatsNewViewControllerDelegate` protocol:
- Add `@objc` to protocol and each functions
- You can also add `optional` to each functions

`WhatsNewFeature` struct:
- Change it to be a class extending `NSObject`: `@objc class WhatsNewFeature: NSObject`
- Add `@objc` to `init()`

`WhatsNewViewController` class:
- Add `@objc` to `class`
- Add `@objc` to all parameters properties (`mainColor`, `titleText`, etc.)
- Add `@objc` to `create()` static function
- On each delegate methods calls, add `?`, because each delegated functions could be optional

## They're already using it

Following apps are already using `WhatsNewViewController`:

- [GPX viewer](https://apps.apple.com/ch/app/gpx-viewer/id1511582047)

If you use it in your app, please let me know and I will add your link here. You can [contact me here](https://contact.gander.family?locale=en).

## Licence

Be free to use this `WhatsNewViewController` in your app. Licence is available [here](https://github.com/Jonathan-Gander/WhatsNewViewController/blob/main/LICENSE). Please only add a copyright and licence notice.

Please also see [WhatsNew](https://github.com/illescasDaniel/WhatsNew) from developer Daniel Illescas Romero. I've built my own implementation but first idea was based on his work.

