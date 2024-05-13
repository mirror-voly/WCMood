//
//  MainPageViewController.swift
//  WCMood
//
//  Created by mix on 13.5.24..
//

import UIKit

class MainPageViewController: UIViewController {

    
    let moodImageView = UIImageView()
    let stopButton = UIButton()
    let repiteButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupUI()
    }
    

    private func setupUI() {
        setupMoodImageView()
        setupStopButton()
    }

    
    private func setupMoodImageView() {
        view.addSubview(moodImageView)
        let image = UIImage(named: "1")
        moodImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodImageView.widthAnchor.constraint(equalToConstant: 250),
            moodImageView.heightAnchor.constraint(equalToConstant: 250),
            moodImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moodImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80)
        ])
        moodImageView.image = image
    }
    
    
    
    private func setupStopButton() {
//        view.addSubview(stopButton)
//        stopButton.translatesAutoresizingMaskIntoConstraints = false
//        stopButton.tintColor = .systemRed
//        NSLayoutConstraint.activate([
//            stopButton.topAnchor.constraint(equalTo: moodImageView.bottomAnchor, constant: 60),
//            stopButton.leftAnchor.constraint(equalTo: moodImageView.leadingAnchor)
//            stopButton.trailingAnchor.constraint(equalTo: moodImageView.centerXAnchor, constant: -20)
//            
//        ])
    }
}
