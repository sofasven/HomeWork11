//
//  ViewController.swift
//  HomeWork11
//
//  Created by Sofa on 9.08.23.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var btn: UIButton!
    
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        textField.text = String(slider.value)
        progressView.progress = slider.value
    }
    
    @IBAction func textFieldChange(_ sender: UITextField) {
        guard let volumeLevel = sender.text else {
            return
        }
            slider.value = Float(volumeLevel) ?? 0
            progressView.progress = Float(volumeLevel) ?? 0
    }
    
    @IBAction func btnSetThisTime(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let selectedTime = formatter.string(from: datePicker.date)
        lblTime.text = selectedTime
    }
    
    @IBAction func switchChange(_ sender: UISwitch) {
        let isOn = sender.isOn
        if isOn {
            lblTime.backgroundColor = .green
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            let selectedTime = formatter.string(from: datePicker.date)
            lblTime.text = selectedTime
        } else {
            lblTime.backgroundColor = .gray
            lblTime.text = "no alarm"
        }
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblTime.text = ""
        switchOutlet.isOn = false
    }
}
   

