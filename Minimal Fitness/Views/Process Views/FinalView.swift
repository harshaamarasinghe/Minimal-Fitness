//
//  FinalView.swift
//  Minimal Fitness
//
//  Created by Harsha Amarasinghe on 2023-05-11.
//

import UIKit

class FinalView: UIViewController {
    
    //Var
    
    var BMI = 1.2;
    
    //UI Comps
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Your BMI is "
        label.textAlignment = .center
        return label
    }()
    
    let labelThree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = String(format: "%.2f", 1.42)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //Calculate BMI
}
