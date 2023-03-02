//
//  CardCollectionVC.swift
//  Card Exercise
//
//  Created by Paurakh Vikram Saud on 31/01/2023.
//

import UIKit

class CardCollectionVC: UIViewController {
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttonCollections: [UIButton]!
    var cards:[UIImage?] = Card.allValues
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttonCollections{
            button.layer.cornerRadius = 8
        }

    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
