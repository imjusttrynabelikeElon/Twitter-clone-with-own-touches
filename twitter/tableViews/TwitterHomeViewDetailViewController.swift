//
//  TwitterHomeViewDetailViewController.swift
//  twitter
//
//  Created by Karon Bell on 5/7/23.
//

import Foundation
import UIKit

//




class TwitterHomeViewDetailViewController: UIViewController {
   
    @IBOutlet weak var selectedLabel: UILabel!
    
    var selectedTweet: String?
    
    var selectedProfileImage: UIImage?
   
    var nameLabell: String?
    
    var nameUILabel: UILabel!
    
    var userNameLabell: UILabel!
    
    var userNamee: String?
    
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("K")
        
        
        // Set the title of the navigation bar
             self.title = "Tweet"
   
             // Create a back bar button item
             let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
             self.navigationItem.leftBarButtonItem = backButton

        if let label = selectedLabel as UILabel? {
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            
            view.addSubview(label)
            
            if let tweetToLoad = selectedTweet {
                label.text = tweetToLoad
                print(tweetToLoad)
                print("HTGDC")
                label.sizeToFit()
                
                
                
            }
            
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.heightAnchor.constraint(equalToConstant: 580),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             
                label.widthAnchor.constraint(equalToConstant: 280),
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -293),
               
            ])
        }
        
        nameUILabel = UILabel()

        
       userNameLabell = UILabel()
            
            
            if let selectedProfileImage = selectedProfileImage {
                let imageView = UIImageView(image: selectedProfileImage)
                imageView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(imageView)
            
                if let nameToLoad = nameUILabel as UILabel?  {
                    nameToLoad.numberOfLines = 0
                    nameToLoad.lineBreakMode = .byWordWrapping
                    print("UTFC")
                    nameToLoad.textAlignment = .center
                    nameToLoad.translatesAutoresizingMaskIntoConstraints = false
                    
                    view.addSubview(nameToLoad)
                    
                    if let namme = nameLabell {
                        nameToLoad.text = namme
                        print("Hi \(namme)")
                        print("JYCG")
                        nameToLoad.sizeToFit()
                       // nameToLoad.backgroundColor = .white
                    }
                    
                    NSLayoutConstraint.activate([
                        
                        nameToLoad.heightAnchor.constraint(equalToConstant: 400),
                        nameToLoad.widthAnchor.constraint(equalToConstant: 200),
                        nameToLoad.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),
                        nameToLoad.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 200),
                        nameToLoad.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -36)
                        
                    ])
                    
                    //
                    if let userNameToLoad = userNameLabell as UILabel?  {
                        userNameToLoad.numberOfLines = 0
                        userNameToLoad.lineBreakMode = .byWordWrapping
                        
                        userNameToLoad.textAlignment = .center
                        userNameToLoad.translatesAutoresizingMaskIntoConstraints = false
                        
                        view.addSubview(userNameToLoad)
                        
                        if let UserNamee = userNamee {
                            userNameToLoad.text = UserNamee
                            print("Hi \(UserNamee)")
                            print("JYCG")
                            userNameToLoad.sizeToFit()
                        }
                        
                        NSLayoutConstraint.activate([
                            
                            userNameToLoad.heightAnchor.constraint(equalToConstant: 400),
                            userNameToLoad.widthAnchor.constraint(equalToConstant: 200),
                            userNameToLoad.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -478),
                            userNameToLoad.trailingAnchor.constraint(equalTo: nameToLoad.leadingAnchor, constant: 233),
                            userNameToLoad.leadingAnchor.constraint(equalTo: nameToLoad.trailingAnchor, constant: -233)
                            
                        ])
                    }
                    
                }
                
                // Add the tap gesture recognizer to the imageView
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
                imageView.addGestureRecognizer(tapGesture)

                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: 50),
                    imageView.widthAnchor.constraint(equalToConstant: 50),
                    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -150),
                    imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -680),
                    
                
                ])
                
                imageView.layer.cornerRadius = 25 // sets the corner radius to half of the width/height of the view
                imageView.clipsToBounds = true // makes sure the corners are rounded and not visible outside the view

                imageView.isUserInteractionEnabled = true

        }
        
      
        

    }
    
    @objc func imageTapped() {
        let fullScreenImageView = UIImageView(image: selectedProfileImage)
        fullScreenImageView.frame = view.frame
        fullScreenImageView.contentMode = .scaleAspectFit
        
        let fullScreenVC = UIViewController()
        fullScreenVC.view.addSubview(fullScreenImageView)
        fullScreenVC.modalPresentationStyle = .fullScreen
        
        present(fullScreenVC, animated: true) {
            // Add a tap gesture recognizer to dismiss the full screen view controller
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissFullScreen))
            fullScreenVC.view.addGestureRecognizer(tapGesture)
        }
    }

    @objc func dismissFullScreen() {
        dismiss(animated: true, completion: nil)
    }

 
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
           navigationController?.popViewController(animated: true)
        
       }



}
//
