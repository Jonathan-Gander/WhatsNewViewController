//
//  ViewController.swift
//  WhatsNewExample
//
//  Created by Jonathan Gander on 07.10.21.
//

import UIKit

class ViewController: UIViewController, WhatsNewViewControllerDelegate {

    @IBOutlet weak var logLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logLabel.text = ""
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        displayWhatsNewViewController()
    }
    
    // MARK: -
    func displayWhatsNewViewController() {
        
        // *** Set random features (just for fun).
        var availableFeatures = [
            WhatsNewFeature(title: "App loads 42x faster", text: "Specially when you refresh your discussions list in the morning.", image: UIImage(systemName: "speedometer")),
            WhatsNewFeature(title: "Smarter than expected", text: "App can now set an alarm for you according to weather conditions.", image: UIImage(systemName: "alarm")),
            WhatsNewFeature(title: "Bugs fix", text: "Fix a lot of minor issues. Also add UI improvement in several views.", image: UIImage(systemName: "ant")),
            WhatsNewFeature(title: "Add your location", text: "Add your location on map and send it to your friends in one tap.", image: UIImage(systemName: "mappin.and.ellipse")),
            WhatsNewFeature(title: "Sort your files", text: "You can now sort your files by name, size, number of words or date.", image: UIImage(systemName: "arrow.up.arrow.down.square")),
            WhatsNewFeature(title: "Never miss the train", text: "We will alert you when your train is arriving so you don't have to move your eyes from your phone.", image: UIImage(systemName: "tram")),
            WhatsNewFeature(title: "More security", text: "All your messages are now signed so your contacts always know it is you.", image: UIImage(systemName: "signature")),
            WhatsNewFeature(title: "More search results", text: "We have added hotels and B&B in our search results.", image: UIImage(systemName: "bed.double")),
            WhatsNewFeature(title: "Everybody is a king", text: "Premium account are all deleted. All features are free for everybody!", image: UIImage(systemName: "crown")),
            WhatsNewFeature(title: "Developers at work", text: "We are still working on reported issues.", image: UIImage(systemName: "screwdriver")),
            WhatsNewFeature(title: "Want to go hiking?", text: "Download my app GPX viewer from the App Store!", image: UIImage(systemName: "map")),
        ]
        
        var features = [WhatsNewFeature]()
        // Add random features
        for _ in 1...Int.random(in: 2...5) {
            if let index = availableFeatures.indices.randomElement() {
                features.append(availableFeatures.remove(at: index))
            }
        }
        
        // *** Create WhatsNewViewController with selected features and self as delegate
        let vc = WhatsNewViewController .create(withFeatures: features, delegate: self)
        
        // *** Set random parameters (just for fun). Simply change with your own ***
        // Color
        let colors: [UIColor] = [.systemRed, .systemPink, .systemBlue, .systemCyan, .systemMint, .systemTeal, .systemBrown, .systemIndigo, .systemGreen, .systemOrange, .systemPurple, .systemYellow]
        vc.mainColor = colors.randomElement()!
        
        // Title
        vc.titleText = ["What's New", "What's New in the my app", "Always better", "New features available", "Bug fixed"].randomElement()!
        
        // Subtitle
        vc.subtitleText = ["In version 1.0.10", "You will love it!", "and it is still for free!"].randomElement()!
        
        // Continue button (note: You can also set it to nil to hide it)
        vc.continueText = ["Continue", "Start the app", "Got it!", "Let's start"].randomElement()!
        
        // More info button (note: You can also set it to nil to hide it)
        vc.moreInfoText = ["More info...", "Learn more...", "More about privacy...", "See complete features...", "About..."].randomElement()!
        
        
        // *** Display WhatsNewViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - UI actions
    @IBAction func displayAgainButton(_ sender: Any) {
        displayWhatsNewViewController()
    }
    
    // MARK: - WhatsNewViewControllerDelegate methods
    func whatsNewViewControllerDidTapContinueButton(_ whatsNewViewController: WhatsNewViewController) {
        whatsNewViewController.dismiss(animated: true, completion: nil)
        
        logLabel.text = "Continue button tapped"
        print(logLabel.text!)
    }
    
    func whatsNewViewControllerDidTapMoreInfoButton(_ whatsNewViewController: WhatsNewViewController) {
        whatsNewViewController.dismiss(animated: true, completion: nil)
        
        logLabel.text = "More info button tapped"
        print(logLabel.text!)
    }
    
    func whatsNewViewController(_ whatsNewViewController: WhatsNewViewController, didTapFeature feature: WhatsNewFeature, atIndex index: Int) {
        whatsNewViewController.dismiss(animated: true, completion: nil)
        
        logLabel.text = "Feature at index \(index) tapped: \(feature.title)"
        print(logLabel.text!)
    }
}

