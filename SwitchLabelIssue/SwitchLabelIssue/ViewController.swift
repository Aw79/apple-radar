//
//  ViewController.swift
//  SwitchLabelIssue
//
//  Created by Andreas Wörner on 16.05.19.
//  Copyright © 2019 Aw. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let longPlainText = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        let shortPlainText = "Lorem ipsum"

        
        var topAnchor: NSLayoutYAxisAnchor {
            get {
                if #available(iOS 11.0, *) {
                    return view.safeAreaLayoutGuide.topAnchor
                } else {
                    return view.topAnchor
                }
            }
        }

        var bottomAnchor: NSLayoutYAxisAnchor {
            get {
                if #available(iOS 11.0, *) {
                    return view.safeAreaLayoutGuide.bottomAnchor
                } else {
                    return view.bottomAnchor
                }
            }
        }
        
        let width: CGFloat = traitCollection.horizontalSizeClass == .compact ? 300 : 600

        let containerView = UIView()
        view.addSubview(containerView)
        containerView.backgroundColor = .blue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: width),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        let switch1 = UISwitch()
        containerView.addSubview(switch1)
        switch1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switch1.topAnchor.constraint(equalTo: containerView.topAnchor),
            switch1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ])

        let label1 = UILabel()
        containerView.addSubview(label1)
        label1.text = longPlainText
        label1.numberOfLines = 0
        label1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: switch1.topAnchor),
            label1.leadingAnchor.constraint(equalTo: switch1.trailingAnchor),
            label1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])

        let switch2 = UISwitch()
        containerView.addSubview(switch2)
        switch2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switch2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20),
            switch2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ])

        let label2 = UILabel()
        containerView.addSubview(label2)
        label2.text = shortPlainText
        label2.numberOfLines = 0
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.topAnchor.constraint(equalTo: switch2.topAnchor),
            label2.leadingAnchor.constraint(equalTo: switch2.trailingAnchor),
            label2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])

    }

}
