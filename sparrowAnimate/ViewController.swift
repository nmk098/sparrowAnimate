//
//  ViewController.swift
//  sparrowAnimate
//
//  Created by Никита Курюмов on 17.03.23.
//

import UIKit

class ViewController: UIViewController {

    lazy var animView: UIView = UIView()
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    var attachment: UIAttachmentBehavior!
    var collision: UICollisionBehavior!
    var snapBehavior: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "AccentColor")
        view.addSubview(animView)
        animView.frame = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 100, height: 100)
        animView.backgroundColor = UIColor(named: "viewColor")
        animView.layer.cornerRadius = 20
        animView.translatesAutoresizingMaskIntoConstraints = false
        animView.layer.borderWidth = 2
        animView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        
        animator = UIDynamicAnimator(referenceView: self.view)

        collision = UICollisionBehavior(items: [animView])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
        animator.addBehavior(collision)


    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.view)
        let snapBehavior = UISnapBehavior(item: animView, snapTo: location)
            snapBehavior.damping = 1
            animator.removeAllBehaviors()
        animator.addBehavior(collision)
            animator.addBehavior(snapBehavior)
        }
    }


