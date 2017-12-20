//
//  SettingViewController.swift
//  HYPNOSIS
//
//  Created by Mobile Developer on 10/23/17.
//  Copyright © 2017 Mobile Developer. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func preDepartureBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Pre-Departure"
        let playerViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: View_PlayerVC) as! PlayerViewController
        navigationController?.pushViewController(playerViewController, animated: true)
    }
    
    @IBAction func takeOffBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Take Off"
        let playerViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: View_PlayerVC) as! PlayerViewController
        navigationController?.pushViewController(playerViewController, animated: true)
    }
    
    @IBAction func sleepBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Sleep"
        let playerViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: View_PlayerVC) as! PlayerViewController
        navigationController?.pushViewController(playerViewController, animated: true)
    }
    
    @IBAction func turbulenceBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Turbulence"
        let playerViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: View_PlayerVC) as! PlayerViewController
        navigationController?.pushViewController(playerViewController, animated: true)
    }
    
    @IBAction func landingBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Landing"
        let playerViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: View_PlayerVC) as! PlayerViewController
        navigationController?.pushViewController(playerViewController, animated: true)
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
