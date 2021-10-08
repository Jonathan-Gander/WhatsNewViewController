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
        
        let features = [
            WhatsNewFeature(title: "First amazing feature", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam accumsan pretium arcu, sit amet porta lectus ultrices sed.", image: UIImage(systemName: "paintbrush")),
            WhatsNewFeature(title: "Second feature", text: "Sed lacinia tortor nunc, at eleifend mi porta eu.", image: UIImage(systemName: "globe.europe.africa.fill")),
            WhatsNewFeature(title: "Another one", text: "Sed ex risus, vehicula et finibus et, venenatis vitae nisi.", image: UIImage(systemName: "megaphone")),
        ]
        
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
        
        
        // Display WhatsNewViewController
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

