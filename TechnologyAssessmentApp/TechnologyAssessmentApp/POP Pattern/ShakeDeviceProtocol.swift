//
//  ShakeDeviceProtocol.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 25/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import Foundation
import UIKit

protocol ShakeDeviceProtocol { }

extension ShakeDeviceProtocol where Self: UIViewController {
    // MARK: - Alert
    func presentAlertPrompt() {
        let preferredStyle: UIAlertControllerStyle
        preferredStyle = .alert
        let alertController = UIAlertController(
            title: "Shake detected!",
            message: "",
            preferredStyle: preferredStyle
        )
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
