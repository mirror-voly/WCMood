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
    let infoButton = UIButton()
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.deactivate([
                moodImageView.widthAnchor.constraint(equalToConstant: 300),
                moodImageView.heightAnchor.constraint(equalToConstant: 300),
                moodImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                moodImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
                stopButton.topAnchor.constraint(equalTo: moodImageView.bottomAnchor, constant: 20),
                stopButton.leadingAnchor.constraint(equalTo: moodImageView.leadingAnchor),
                stopButton.trailingAnchor.constraint(equalTo: moodImageView.trailingAnchor),
                stopButton.heightAnchor.constraint(equalToConstant: 200),
                repiteButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10),
                repiteButton.leadingAnchor.constraint(equalTo: moodImageView.leadingAnchor),
                repiteButton.trailingAnchor.constraint(equalTo: moodImageView.trailingAnchor)
            ])
            NSLayoutConstraint.activate([
                moodImageView.widthAnchor.constraint(equalToConstant: 100),
                moodImageView.heightAnchor.constraint(equalToConstant: 100),
                moodImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                moodImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                
                stopButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
                stopButton.leadingAnchor.constraint(equalTo: moodImageView.trailingAnchor, constant: 10),
                stopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                
                repiteButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10),
                repiteButton.leadingAnchor.constraint(equalTo: moodImageView.leadingAnchor, constant: 10),
                repiteButton.trailingAnchor.constraint(equalTo: moodImageView.trailingAnchor)
            ])
        }
        
    }

    private func setupUI() {
        setupMoodImageView()
        setupStopButton()
        setupRepiteButton()
        autoImageChanger()
    }
    
    private func autoImageChanger() {
        timer = .scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCard() {
        let randomInt = Int.random(in: 1...1000)
        let image = UIImage(named: String(randomInt))
        moodImageView.image = image
    }
    
    @objc func stopRandomCardTimer() {
        timer.invalidate()
    }
    
    @objc func restarTimer() {
        timer.invalidate()
        autoImageChanger()
    }
    
    private func setupMoodImageView() {
        view.addSubview(moodImageView)
        let image = UIImage(named: "1")
        moodImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodImageView.widthAnchor.constraint(equalToConstant: 300),
            moodImageView.heightAnchor.constraint(equalToConstant: 300),
            moodImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moodImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150)
        ])
        moodImageView.image = image
    }
    
    private func setupStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopRandomCardTimer), for: .touchUpInside)
        
        
        stopButton.configuration = .tinted()
        stopButton.setTitle("Stop", for: .normal)
        stopButton.configuration?.cornerStyle = .large
        stopButton.configuration?.baseBackgroundColor = .systemRed
        stopButton.configuration?.baseForegroundColor = .red
        stopButton.configuration?.image = UIImage(systemName: "stop.fill")

        stopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stopButton.topAnchor.constraint(equalTo: moodImageView.bottomAnchor, constant: 20),
            stopButton.leadingAnchor.constraint(equalTo: moodImageView.leadingAnchor),
            stopButton.trailingAnchor.constraint(equalTo: moodImageView.trailingAnchor),
            stopButton.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupRepiteButton() {
        view.addSubview(repiteButton)
        repiteButton.addTarget(self, action: #selector(restarTimer), for: .touchUpInside)
        repiteButton.configuration = .tinted()
        repiteButton.setTitle("Play", for: .normal)
        repiteButton.configuration?.cornerStyle = .medium
        repiteButton.configuration?.baseBackgroundColor = .systemGray2
        repiteButton.configuration?.baseForegroundColor = .green
        repiteButton.configuration?.image = UIImage(systemName: "play.square.fill")

        repiteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            repiteButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10),
            repiteButton.leadingAnchor.constraint(equalTo: moodImageView.leadingAnchor),
            repiteButton.trailingAnchor.constraint(equalTo: moodImageView.trailingAnchor)
            
        ])
    }
    
    
}
