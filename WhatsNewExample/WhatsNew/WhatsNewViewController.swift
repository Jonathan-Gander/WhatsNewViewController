//
//  WhatsNewViewController.swift
//
//  Created by Jonathan Gander on 07.10.21.
//

import UIKit

// MARK: - Protocol implmented by delegate
protocol WhatsNewViewControllerDelegate {
    func whatsNewViewControllerDidTapContinueButton(_ whatsNewViewController: WhatsNewViewController)
    func whatsNewViewControllerDidTapMoreInfoButton(_ whatsNewViewController: WhatsNewViewController)
    func whatsNewViewController(_ whatsNewViewController: WhatsNewViewController, didTapFeature feature: WhatsNewFeature, atIndex index: Int)
}

// MARK: - Feature
struct WhatsNewFeature {
    
    let image: UIImage?
    let title: NSString
    let text: NSString
    
    init(title: NSString, text: NSString, image: UIImage?) {
        self.title = title
        self.text = text
        if let image = image {
            self.image = image
        }
        else {
            // Default fallback image
            self.image = UIImage(systemName: "circle.hexagongrid.fill")
        }
    }
}

// MARK: - WhatsNewViewController
class WhatsNewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Parameters (with default values)
    var mainColor: UIColor = .systemBlue
    var titleText: String = "What's New"
    var subtitleText: String = "In this version"
    var continueText: String? = "Continue" // Set to nil to hide this button
    var moreInfoText: String? = "More info" // Set to nil to hide this button
    var allowCopy: Bool = false // Set to true to let user copy feature cells
    
    private var delegate: WhatsNewViewControllerDelegate?
    private var features: [WhatsNewFeature] = [WhatsNewFeature]()
    
    // UI objects
    @IBOutlet private weak var mainStackView: UIStackView!
    
    @IBOutlet private weak var tblView: UITableView!
    
    @IBOutlet private weak var btnContinue: UIButton!
    @IBOutlet private weak var btnMoreInfo: UIButton!
    
    // UI constraints
    @IBOutlet private weak var topConstraint: NSLayoutConstraint!
    
    // MARK: - Creation helper
    static func create(withFeatures features: [WhatsNewFeature], delegate: WhatsNewViewControllerDelegate?) -> WhatsNewViewController {
        let vc = WhatsNewViewController(nibName: "WhatsNewViewController", bundle: nil)
        
        vc.features = features
        vc.delegate = delegate
        
        return vc
    }
    
    // MARK: - Loading
    override func viewDidLoad() {
        super.viewDidLoad()

        // Tableview settings
        let headerTableViewCell = UINib(nibName: "WhatsNewHeaderTableViewCell", bundle: nil)
        self.tblView.register(headerTableViewCell, forCellReuseIdentifier: WhatsNewHeaderTableViewCell.reuseIdentifier)
        
        let newFeatureTableViewCell = UINib(nibName: "WhatsNewFeatureTableViewCell", bundle: nil)
        self.tblView.register(newFeatureTableViewCell, forCellReuseIdentifier: WhatsNewFeatureTableViewCell.reuseIdentifier)
        
        // Continue button
        if let continueText = continueText {
            btnContinue.backgroundColor = mainColor
            btnContinue.setTitle(continueText, for: .normal)
            btnContinue.setTitleColor(.white, for: .normal)
        }
        else {
            btnContinue.isHidden = true
        }
        
        // Learn more button
        if let moreInfoText = moreInfoText {
            btnMoreInfo.setTitleColor(mainColor, for: .normal)
            btnMoreInfo.setTitle(moreInfoText, for: .normal)
        }
        else {
            btnMoreInfo.isHidden = true
        }
        
        // Notification for orientation changes
        #if !os(tvOS)
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        #endif
    }
    
    // MARK: - Actions on buttons
    @IBAction func continueAction(_ sender: Any) {
        delegate?.whatsNewViewControllerDidTapContinueButton(self)
    }
    @IBAction func moreInfoAction(_ sender: Any) {
        delegate?.whatsNewViewControllerDidTapMoreInfoButton(self)
    }
    
    // MARK: - TableView methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Header cell
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WhatsNewHeaderTableViewCell.reuseIdentifier) as? WhatsNewHeaderTableViewCell else {
                return .init()
            }
            
            cell.headerTitleLabel?.text = titleText
            cell.headerSubtitleLabel?.text = subtitleText
            
            cell.selectionStyle = .none
            
            return cell;
        }
        
        // Feature cells
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WhatsNewFeatureTableViewCell.reuseIdentifier) as? WhatsNewFeatureTableViewCell else {
            return .init()
        }
        
        let feature = features[indexPath.row - 1]
        
        cell.featureTitleLabel?.text = feature.title as String
        cell.featureDetailsLabel?.text = feature.text as String
        
        if let image = feature.image {
            cell.featureImageView?.image = image.withRenderingMode(.alwaysTemplate)
            cell.featureImageView?.tintColor = mainColor
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
        
        guard indexPath.row > 0 else { return }
        
        let index = indexPath.row - 1
        delegate?.whatsNewViewController(self, didTapFeature: features[index], atIndex: index)
    }
    
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return action.description == "copy:"
    }

    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if (action.description == "copy:") {
            
            guard indexPath.row > 0 else { return }
            
            let feature = features[indexPath.row - 1]
            
            let pasteBoard = UIPasteboard.general
            pasteBoard.string = "\(feature.title)\n\(feature.text)"
        }
    }

    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return allowCopy && indexPath.row > 0
    }
    
    // MARK: - Orientation
    @objc private func orientationDidChange(_ sender: Any) {
        
        let orientation = view.window?.windowScene?.interfaceOrientation
        
        // Adjust constraints and spaces in landscape / portrait
        if orientation == .portrait {
            topConstraint.constant = 20
            mainStackView.spacing = 20
        } else if orientation == .landscapeRight || orientation == .landscapeLeft{
            topConstraint.constant = 10
            mainStackView.spacing = 10
        }
    }
}
