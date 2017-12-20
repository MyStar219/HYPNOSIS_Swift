//
//  PlayerViewController.swift
//  HYPNOSIS
//
//  Created by Mobile Developer on 10/23/17.
//  Copyright © 2017 Mobile Developer. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class PlayerViewController: UIViewController {
    
    private var audioPlayer: AVAudioPlayer?
    var audioName: String?
    var mpVolumeSlider = UISlider()
    var playBtnCheck = "play"
    var scrubbing = false
    var updateTimer: Timer?
    var sliderTimer: Timer?
    
    @IBOutlet weak var preDepartureBtn: UIButton!
    @IBOutlet weak var takeOffBtn: UIButton!
    @IBOutlet weak var sleepBtn: UIButton!
    @IBOutlet weak var truebulenceBtn: UIButton!
    @IBOutlet weak var landingBtn: UIButton!
    @IBOutlet weak var startTimeLbl: UILabel!
    @IBOutlet weak var endTimeLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var statusDetailLbl: UILabel!
    @IBOutlet weak var volumeLowImg: UIImageView!
    @IBOutlet weak var volumeImg: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var volumeParentView: UIView!
    @IBOutlet weak var audioSlider: UISlider!
    @IBOutlet weak var audioParentView: UIView!
    @IBOutlet weak var playBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (GlobalData.audioSelectionCheck == "Pre-Departure") {
            statusLbl.text = "PRE-DEPARTURE"
            statusDetailLbl.text = "Take it easy and pre-departure"
            audioName = "pre-departure"
            preDepartureBtn.isEnabled = false
            takeOffBtn.isEnabled = false
            sleepBtn.isEnabled = false
            truebulenceBtn.isEnabled = false
            landingBtn.isEnabled = false
            startTimeLbl.text = "0:00"
        } else if (GlobalData.audioSelectionCheck == "Take Off") {
            statusLbl.text = "TAKE OFF"
            statusDetailLbl.text = "Take it easy and take off"
            audioName = "takeoff"
            preDepartureBtn.isEnabled = false
            takeOffBtn.isEnabled = false
            sleepBtn.isEnabled = false
            truebulenceBtn.isEnabled = false
            landingBtn.isEnabled = false
            startTimeLbl.text = "0:00"
        } else if (GlobalData.audioSelectionCheck == "Sleep") {
            statusLbl.text = "SLEEP"
            statusDetailLbl.text = "Take it easy and sleep"
            audioName = "sleep"
            preDepartureBtn.isEnabled = false
            takeOffBtn.isEnabled = false
            sleepBtn.isEnabled = false
            truebulenceBtn.isEnabled = false
            landingBtn.isEnabled = false
            startTimeLbl.text = "0:00"
        } else if (GlobalData.audioSelectionCheck == "Turbulence") {
            statusLbl.text = "TURBULENCE"
            statusDetailLbl.text = "Take it easy and turbulence"
            audioName = "turbulence"
            preDepartureBtn.isEnabled = false
            takeOffBtn.isEnabled = false
            sleepBtn.isEnabled = false
            truebulenceBtn.isEnabled = false
            landingBtn.isEnabled = false
            startTimeLbl.text = "0:00"
        } else if (GlobalData.audioSelectionCheck == "Landing") {
            statusLbl.text = "LANDING"
            statusDetailLbl.text = "Take it easy and landing"
            audioName = "landing"
            preDepartureBtn.isEnabled = false
            takeOffBtn.isEnabled = false
            sleepBtn.isEnabled = false
            truebulenceBtn.isEnabled = false
            landingBtn.isEnabled = false
            startTimeLbl.text = "0:00"
        }
        
        slider.value = AVAudioSession.sharedInstance().outputVolume
        audioSlider.value = 0
        volumeLowImg.image = UIImage(named: "vol")
        playBtn.setBackgroundImage(UIImage(named: "stop.PNG"), for: UIControlState.normal)
        
        setupAudioSlider()
        setupVolumeSlider()
        
        playSound()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        audioPlayer?.stop()
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func preDepartureBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Pre-Departure"
        statusLbl.text = "PREDEPARTURE"
        statusDetailLbl.text = "Get prepped for a smooth departure."
        audioName = "pre-departure"
        playBtnCheck = "play"
        playBtn.setBackgroundImage(UIImage(named: "stop.PNG"), for: UIControlState.normal)
        preDepartureBtn.isEnabled = false
        takeOffBtn.isEnabled = false
        sleepBtn.isEnabled = false
        truebulenceBtn.isEnabled = false
        landingBtn.isEnabled = false
        playSound()
    }
    
    @IBAction func takeOffBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Take Off"
        statusLbl.text = "TAKE OFF"
        statusDetailLbl.text = "Let's get comfortable and let's get flying."
        audioName = "takeoff"
        playBtnCheck = "play"
        playBtn.setBackgroundImage(UIImage(named: "stop.PNG"), for: UIControlState.normal)
        preDepartureBtn.isEnabled = false
        takeOffBtn.isEnabled = false
        sleepBtn.isEnabled = false
        truebulenceBtn.isEnabled = false
        landingBtn.isEnabled = false
        playSound()
    }
    
    @IBAction func sleepBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Sleep"
        statusLbl.text = "SLEEP"
        statusDetailLbl.text = "Take it easy and sleep."
        audioName = "sleep"
        playBtnCheck = "play"
        playBtn.setBackgroundImage(UIImage(named: "stop.PNG"), for: UIControlState.normal)
        preDepartureBtn.isEnabled = false
        takeOffBtn.isEnabled = false
        sleepBtn.isEnabled = false
        truebulenceBtn.isEnabled = false
        landingBtn.isEnabled = false
        playSound()
    }
    
    @IBAction func trubulenceBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Turbulence"
        statusLbl.text = "TURBULENCE"
        statusDetailLbl.text = "It's not so rough. Relax."
        audioName = "turbulence"
        playBtnCheck = "play"
        playBtn.setBackgroundImage(UIImage(named: "stop.PNG"), for: UIControlState.normal)
        preDepartureBtn.isEnabled = false
        takeOffBtn.isEnabled = false
        sleepBtn.isEnabled = false
        truebulenceBtn.isEnabled = false
        landingBtn.isEnabled = false
        playSound()
    }
    
    @IBAction func landingBtnClicked(_ sender: UIButton) {
        GlobalData.audioSelectionCheck = "Landing"
        statusLbl.text = "LANDING"
        statusDetailLbl.text = "Prepare for that safe landing."
        audioName = "landing"
        playBtnCheck = "play"
        playBtn.setBackgroundImage(UIImage(named: "stop.PNG"), for: UIControlState.normal)
        preDepartureBtn.isEnabled = false
        takeOffBtn.isEnabled = false
        sleepBtn.isEnabled = false
        truebulenceBtn.isEnabled = false
        landingBtn.isEnabled = false
        playSound()
    }
    
    @IBAction func playBtnClicked(_ sender: UIButton) {
        if (playBtnCheck == "play") {
            playBtnCheck = "stop"
            playBtn.setBackgroundImage(UIImage(named: "play.PNG"), for: UIControlState.normal)
            preDepartureBtn.isEnabled = true
            takeOffBtn.isEnabled = true
            sleepBtn.isEnabled = true
            truebulenceBtn.isEnabled = true
            landingBtn.isEnabled = true
            audioPlayer?.stop()
        } else if (playBtnCheck == "stop") {
            playBtnCheck = "play"
            playBtn.setBackgroundImage(UIImage(named: "stop.PNG"), for: UIControlState.normal)
            preDepartureBtn.isEnabled = false
            takeOffBtn.isEnabled = false
            sleepBtn.isEnabled = false
            truebulenceBtn.isEnabled = false
            landingBtn.isEnabled = false
            audioPlayer?.play()
        }
    }
    
    @IBAction func previousBtnClicked(_ sender: UIButton) {
        
        audioPlayer?.stop()
        audioPlayer?.currentTime = (audioPlayer?.currentTime)! - 5
        audioPlayer?.play()
        
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = (audioPlayer?.currentTime)! + 5
        audioPlayer?.play()
    }
    
    @IBAction func volumeSliderChanged(_ sender: UISlider) {
        
        mpVolumeSlider.value = sender.value
        
        if (sender.value == 0) {
            volumeLowImg.image = UIImage(named: "vol-min")
        } else {
            volumeLowImg.image = UIImage(named: "vol")
        }
    }
    
    @IBAction func audioSliderChanged(_ sender: UISlider) {
    }
    
    func setupAudioSlider() {
        let thumbImageNormal = UIImage(named: "slider-audio-ball")
        audioSlider?.setThumbImage(thumbImageNormal, for: .normal)
    }
    
    func playSound() {
        if updateTimer != nil {
            updateTimer!.invalidate()
        }
        if sliderTimer != nil {
            sliderTimer!.invalidate()
        }
        
        updateTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(PlayerViewController.updateTime), userInfo: nil, repeats: true)
        sliderTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(PlayerViewController.updateSlider), userInfo: nil, repeats: true)
        guard let audioURL = Bundle.main.url(forResource: audioName, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let audioPlayer = audioPlayer else { return }
            
            audioPlayer.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func updateTime() {
        let currentTime = Float(audioPlayer!.currentTime)
        let duration = Float(audioPlayer!.duration)
        audioSlider.maximumValue = duration
        let total = duration - currentTime
        endTimeLbl.text = "-" + timeFormat(value: total)
        startTimeLbl.text = timeFormat(value: currentTime)
        if (startTimeLbl.text == timeFormat(value: duration)) {
            playBtnCheck = "stop"
            playBtn.setBackgroundImage(UIImage(named: "play.PNG"), for: UIControlState.normal)
            audioPlayer?.currentTime = 0
            preDepartureBtn.isEnabled = true
            takeOffBtn.isEnabled = true
            sleepBtn.isEnabled = true
            truebulenceBtn.isEnabled = true
            landingBtn.isEnabled = true
            audioPlayer?.stop()
        }
    }
    
    @objc func updateSlider() {
        audioSlider.value = Float(audioPlayer!.currentTime)
        
    }
    
    func timeFormat(value: Float) -> String {
        let minutes = Int(floor(value/60))
        let seconds = Int(floor(value.truncatingRemainder(dividingBy: 60)))
        let timeString = String(format:"%0.2d:%0.2d", minutes, seconds)
        return timeString
    }
    
    func setupVolumeSlider() {
        // Note: This slider implementation uses a MPVolumeView
        // The volume slider only works in devices, not the simulator.
        volumeParentView.backgroundColor = UIColor.clear
        let volumeView = MPVolumeView(frame: volumeParentView.bounds)
        for view in volumeView.subviews {
            let uiview: UIView = view as UIView
            if (uiview.description as NSString).range(of: "MPVolumeSlider").location != NSNotFound {
                mpVolumeSlider = (uiview as! UISlider)
            }
        }
        
        let thumbImageNormal = UIImage(named: "slider-volume-ball")
        slider?.setThumbImage(thumbImageNormal, for: .normal)
        
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
