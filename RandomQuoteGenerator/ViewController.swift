//
//  ViewController.swift
//  RandomQuoteGenerator
//
//  Created by Varun Kumar Singh on 07/07/24.
//

import UIKit
import Social
import SwiftUI

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Quote", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300)
        
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomQuote()
        button.addTarget(self, action: #selector(didTapButton),for: .touchUpInside)
        
        
    }
    
    @objc func didTapButton() {
        getRandomQuote()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-200-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55)
    }
    
    func getRandomQuote(){
        let urlString = "https://zenquotes.io/api/image"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data:data)
    }

    
    
    
    @IBAction func sharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.imageView.image as Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present (activityVC, animated: true, completion: nil)
    }
    
    
    
}

