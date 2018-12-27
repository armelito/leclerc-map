//
//  SliderHomeController.swift
//  IOS-EQ04
//
//  Created by Quentin on 12/11/2018.
//  Copyright © 2018 EQ4. All rights reserved.
//

import UIKit
import FirebaseAuth

class SliderHomeController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    let titlelabel: UILabel = {
        var lbl = UILabel()
        lbl.frame = (CGRect(x: 0, y: 0, width: 150, height: 50))
        lbl.text = "MyLeclerc"
        lbl.font = UIFont(name: "Poppins-Medium", size: 23.0)
        lbl.textColor = UIColor(hex: "0B70B5")
        
        return lbl
    }()
    

    let getStartedButton: UIButton = {
        var btn = UIButton()
        
        btn.frame = (CGRect(x: 0, y: 0, width: 100, height: 0))
        btn.setTitle("Choisir mon magasin", for: .normal)
        btn.titleLabel?.font = UIFont(name: "SF-Pro-Text-Medium", size: 19.0)
        btn.backgroundColor = UIColor(hex: "0B70B5")
        btn.layer.cornerRadius = 15
        
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 2)
        btn.layer.shadowRadius = 2
        btn.layer.shadowOpacity = 0.2
        
        btn.addTarget(self, action: #selector(buttonLocation), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titlelabel)
        view.addSubview(getStartedButton)
        
        setupButton()
        setupTitleLabel()
        setupPageControl()
        
       
        
        struct Slide {
            var img: String
            var title: String
            var text: String
        }
        let slide0 = Slide(img: "logo-producteur-ios", title: "Rencontre producteur", text: "Grâce à notre mode évènement, prenez plaisir à suivre, découvrir, rencontrer nos meilleurs producteurs")
        
        let slide1 = Slide(img: "dollar-symbol-ios", title: "Scan intelligent", text: "Grâce à notre mode scan, vous pouvez maintenant générer votre code barre")
        
        let slide2 = Slide(img: "piggy-bank-ios", title: "Profil", text: "Grâce à notre mode profile, vous pouvez vous connecter aux kiosques en magasin et accéder à toutes vos informations")
        
        var slides: [Slide] = [slide0,slide1,slide2]
        
        var frame = CGRect(x:0, y:0, width: scrollView.frame.size.width * 0.6, height:180)
        
        var titleFrame = CGRect(x:0, y:0, width: scrollView.frame.size.width * 0.6, height:180)
        var textFrame = CGRect(x:0, y:0, width: scrollView.frame.size.width * 0.8, height:180)
        
        pageControl.numberOfPages = slides.count
        
        for index in 0..<slides.count {
            
            frame.origin.x = scrollView.frame.size.width * (CGFloat(index) + 0.20)
            frame.origin.y = 50
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: slides[index].img)
            
            titleFrame.origin.x = scrollView.frame.size.width * (CGFloat(index) + 0.20)
            titleFrame.origin.y = imgView.frame.size.height + 15
            
            textFrame.origin.x = scrollView.frame.size.width * (CGFloat(index) + 0.10)
            textFrame.origin.y = imgView.frame.size.height + 75
            
            let label: UILabel = {
                let lbl = UILabel()
                lbl.frame = titleFrame
                lbl.font = UIFont(name: "Poppins-Medium", size: 23.0)
                lbl.text = slides[index].title
                lbl.textColor = UIColor(hex: "0B70B5")
                lbl.textAlignment = .center
                lbl.numberOfLines = 0
                return lbl
            }()
            
            let textlabel: UILabel = {
                let lbl = UILabel()
                lbl.frame = textFrame
                lbl.font = UIFont(name: "SF-Pro-Text-Regular", size: 16.0)
                lbl.text = slides[index].text
                lbl.textColor = UIColor(hex: "000000")
                lbl.textAlignment = .center
                lbl.numberOfLines = 0
                return lbl
            }()
            
            scrollView.addSubview(imgView)
            scrollView.addSubview(label)
            scrollView.addSubview(textlabel)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(slides.count)), height: (scrollView.frame.size.height))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
    }
    
    @objc func buttonLocation(sender: UIButton!) {
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LocationViewController = myStoryboard.instantiateViewController(withIdentifier: "LocationViewController")
        self.present(LocationViewController, animated: true, completion: nil)
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
   
    func setupPageControl() {
        pageControl.pageIndicatorTintColor = UIColor(hex: "D5D5D5")
        pageControl.currentPageIndicatorTintColor = UIColor(hex: "0B70B5")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    private func setupTitleLabel() {
        
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        //Centre le label dans l'ecran et on donne 100*100
        titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titlelabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        
    }

    
    private func setupButton() {
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
        getStartedButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        getStartedButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
  
    
    
}
