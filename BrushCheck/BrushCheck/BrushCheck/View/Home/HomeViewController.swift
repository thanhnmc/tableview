//
//  HomeViewController.swift
//  BrushCheck
//
//  Created by nmcthanh on 08/02/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func settingButtonTapped(_ sender: UIButton) {
        let settingViewController = SettingViewController(nibName: "SettingViewController", bundle: nil)
        settingViewController.modalPresentationStyle = .fullScreen
        settingViewController.getResult = {
            
            
        }
        self.present(settingViewController, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
