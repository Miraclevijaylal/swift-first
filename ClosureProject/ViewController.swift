//
//  ViewController.swift
//  ClosureProject
//
//  Created by Vijay Lal on 06/06/24.
//

import UIKit

//MARK: - Definition
class ViewController: UIViewController {
    let myView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    var translated: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
}
//MARK: - UI
extension ViewController {
    func initViews() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        [myView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
         myView.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
         myView.widthAnchor.constraint(equalToConstant: 100),
         myView.heightAnchor.constraint(equalToConstant: 100)
        ].forEach({ $0.isActive = true })
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapDetected(sender:))))
    }
}
//MARK: - Selectors
extension ViewController {
    @objc func tapDetected(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let unwrappedSelf = self else { return }
            if unwrappedSelf.translated {
                unwrappedSelf.myView.transform = .identity
            } else {
                unwrappedSelf.myView.transform = CGAffineTransform(translationX: 0, y: 160)
            }
            unwrappedSelf.translated.toggle()
        }
    }
}
