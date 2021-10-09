# A nice way to present your new app features

`WhatsNewViewController` lets you present to your users your app new features in a pretty way (see screenshots below). For example, when you have released an update and you want to explain what is new.

This project is an example/demo app for this `WhatsNewViewController`. It is built for iOS using Swift and UIKit. It is easy to use and to control, to start using it quickly in your app and concentrate on your own app business core.

This app only provides a button to display `WhatsNewViewController` with random settings. And a text label to display delegate methods results.

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
// You can change title, subtitle and image for each feature.
let features = [
    WhatsNewFeature(title: "First amazing feature", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam accumsan pretium arcu, sit amet porta lectus ultrices sed.", image: UIImage(systemName: "paintbrush")),
    WhatsNewFeature(title: "Second feature", text: "Sed lacinia tortor nunc, at eleifend mi porta eu.", image: UIImage(systemName: "globe.europe.africa.fill")),
    WhatsNewFeature(title: "Another one", text: "Sed ex risus, vehicula et finibus et, venenatis vitae nisi.", image: UIImage(systemName: "megaphone")),
]

// Create your WhatsNewViewController
let vc = WhatsNewViewController .create(withFeatures: features, delegate: self)

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

## Screeshots

Here are few screenshots (with random texts!) of the app:

![Simulator Screen Shot - iPhone 12 - 2021-10-09 at 09 16 36](https://user-images.githubusercontent.com/1695222/136648400-68cb00cc-c3c6-4263-a232-640c9a2f2693.png)
![Simulator Screen Shot - iPhone 12 - 2021-10-09 at 09 17 13](https://user-images.githubusercontent.com/1695222/136648401-4575e66c-52c5-4a4d-9059-c7ed9786a305.png)

![Simulator Screen Shot - iPhone 12 - 2021-10-08 at 22 24 23](https://user-images.githubusercontent.com/1695222/136620805-494411f6-9014-44cc-a81b-2d699cf8697d.png)
![Simulator Screen Shot - iPhone 12 - 2021-10-08 at 22 25 21](https://user-images.githubusercontent.com/1695222/136620892-591204db-9903-4770-b937-7200a710ef23.png)

## Licence

Be free to use this `WhatsNewViewController` in your app. Licence is available [here](https://github.com/Jonathan-Gander/WhatsNewViewController/blob/main/LICENSE). Please only add a copyright and licence notice.

Please also see [WhatsNew](https://github.com/illescasDaniel/WhatsNew) from developer Daniel Illescas Romero. I've built my own implementation but first idea was based on his work.

