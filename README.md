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

// Customize it
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

![Simulator Screen Shot - iPhone 12 - 2021-10-08 at 17 16 13](https://user-images.githubusercontent.com/1695222/136581708-8d322a98-5256-4957-929f-b09555f7025c.png)
![Simulator Screen Shot - iPhone 12 - 2021-10-08 at 17 17 02](https://user-images.githubusercontent.com/1695222/136581884-91c3c782-b582-4a6e-aa4d-9d8d32bd4c0f.png)

![Simulator Screen Shot - iPhone 12 - 2021-10-08 at 17 26 01](https://user-images.githubusercontent.com/1695222/136583280-c2382023-cbc2-4761-bc60-8737db20488d.png)
![Simulator Screen Shot - iPhone 12 - 2021-10-08 at 17 26 07](https://user-images.githubusercontent.com/1695222/136583292-cd7ab474-70cd-4dba-a5b5-64c7782059e2.png)

![Simulator Screen Shot - iPhone 12 - 2021-10-08 at 17 28 30](https://user-images.githubusercontent.com/1695222/136583613-420809eb-0694-433f-b996-e13fce3cd735.png)
![Simulator Screen Shot - iPhone 12 - 2021-10-08 at 17 29 47](https://user-images.githubusercontent.com/1695222/136583745-7705854e-cacb-4e9c-90c5-11deb302e0c3.png)

## Licence

Be free to use this `WhatsNewViewController` in your app. Licence is available [here](https://github.com/Jonathan-Gander/WhatsNewExample/blob/main/LICENSE). Please only add a copyright and licence notice.

Please also see [WhatsNew](https://github.com/illescasDaniel/WhatsNew) from developer Daniel Illescas Romero. I've built my own implementation but first idea was based on his work.

