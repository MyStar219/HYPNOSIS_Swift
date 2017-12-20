//
//  StartViewController.swift
//  HYPNOSIS
//
//  Created by Mobile Developer on 10/23/17.
//  Copyright © 2017 Mobile Developer. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startBtnClicked(_ sender: UIButton) {
        
        let settingViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: View_SettingVC) as! SettingViewController
        navigationController?.pushViewController(settingViewController, animated: true)
        
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
