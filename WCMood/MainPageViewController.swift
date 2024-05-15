//
//  MainPageViewController.swift
//  WCMood
//
//  Created by mix on 13.5.24..
//

import UIKit

class MainPageViewController: UIViewController {

    
    let stopButton = UIButton()
    let infoButton = UIButton()
    var timer: Timer!
    var isImageChangerActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
//        if UIDevice.current.orientation.isLandscape {
//        }
        }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupImageButton()
        turnOnImageChanger()
        setupInfoButton()
    }
    
    private func turnOnImageChanger() {
        timer = .scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCard() {
        let randomInt = Int.random(in: 1...1000)
        let image = UIImage(named: String(randomInt))
        stopButton.configuration?.image = image
    }
    
    @objc func toggleImageChanger() {
        timer.invalidate()
        if !isImageChangerActive { turnOnImageChanger() }
        isImageChangerActive.toggle()
    }
    
    private func setupImageButton() {
        view.addSubview(stopButton)

        stopButton.addTarget(self, action: #selector(toggleImageChanger), for: .touchUpInside)
        
        stopButton.configuration = .borderedProminent()
        stopButton.configuration?.cornerStyle = .capsule
        
        stopButton.configuration?.baseBackgroundColor = .systemRed

        stopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 300),
            stopButton.heightAnchor.constraint(equalToConstant: 300),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupInfoButton() {
        view.addSubview(infoButton)

        infoButton.addTarget(self, action: #selector(toggleImageChanger), for: .touchUpInside)
        
        infoButton.configuration = .bordered()
        infoButton.configuration?.cornerStyle = .capsule
        infoButton.configuration?.baseForegroundColor = .systemGray2
        infoButton.configuration?.image = UIImage(systemName: "info.circle")
        
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.widthAnchor.constraint(equalToConstant: 50),
            infoButton.heightAnchor.constraint(equalToConstant: 50),
            infoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            infoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
}
