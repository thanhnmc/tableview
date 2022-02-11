//
//  ViewController.swift
//  BrushCheck
//
//  Created by nmcthanh on 08/02/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func starButtonTapped(_ sender: UIButton) {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

