//
//  MainViewController.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 24/08/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit

class FoodImageView: UIImageView, Shakeable {
    // other customization here
}

class MainViewController: UIViewController, ShakeDeviceProtocol {

    @IBOutlet weak var foodImageView: FoodImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func shakeImagePressed(_ sender: UIButton) {
        foodImageView.shake()
    }
    override internal var canBecomeFirstResponder: Bool {
        return true
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        presentAlertPrompt()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
