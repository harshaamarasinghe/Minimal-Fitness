import UIKit

class viewGender: UIViewController {
    
    //Mark:- Variables
    
    var gender : String = ""
    
    //Mark:- UI Comps
    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(1/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 1/6"
        label.textAlignment = .center
        return label
    }()
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Let’s get to"
        label.textAlignment = .center
        return label
    }()
    
    let labelThree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "know you"
        label.textAlignment = .center
        return label
    }()
    
    let labelFour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "better"
        label.textAlignment = .center
        return label
    }()
    
    let imageGender: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gender"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelFive : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "I"
        label.textAlignment = .center
        return label
    }()
    
    let labelSix : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Am"
        label.textAlignment = .center
        return label
    }()
    
    let buttonMale : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Male", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32, weight: .semibold)
        button.backgroundColor = UIColor(red: 157/255, green: 202/255, blue: 239/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonFemale : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Female", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32, weight: .semibold)
        button.backgroundColor =  UIColor(red: 253/255, green: 187/255, blue: 211/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonCont : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupNavigationBar()
        setupUI()
    }
    
    //Mark:- Functions
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(progressView)
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(labelThree)
        view.addSubview(labelFour)
        view.addSubview(imageGender)
        view.addSubview(labelFive)
        view.addSubview(labelSix)
        view.addSubview(buttonMale)
        view.addSubview(buttonFemale)
        view.addSubview(buttonCont)
        
        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)
        
        //Mark:- Button Actions
        
        buttonMale.addTarget(self, action: #selector(propMale), for: .touchUpInside)
        buttonFemale.addTarget(self, action: #selector(propFemale), for: .touchUpInside)
        buttonCont.addTarget(self, action: #selector(getNext), for: .touchUpInside)
        
        //Mark:- Constraints
        
        NSLayoutConstraint.activate([
            labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 20),
            labelTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelTwo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelTwo.heightAnchor.constraint(equalToConstant: 40),
            
            labelThree.topAnchor.constraint(equalTo: labelTwo.bottomAnchor),
            labelThree.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelThree.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelThree.heightAnchor.constraint(equalToConstant: 40),
            
            labelFour.topAnchor.constraint(equalTo: labelThree.bottomAnchor),
            labelFour.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelFour.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelFour.heightAnchor.constraint(equalToConstant: 40),
            
            imageGender.topAnchor.constraint(equalTo: labelFour.bottomAnchor),
            imageGender.heightAnchor.constraint(equalToConstant: 180),
            imageGender.widthAnchor.constraint(equalToConstant: 180),
            imageGender.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelFive.topAnchor.constraint(equalTo: imageGender.bottomAnchor, constant: 20),
            labelFive.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFive.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelFive.heightAnchor.constraint(equalToConstant: 40),
            
            labelSix.topAnchor.constraint(equalTo: labelFive.bottomAnchor, constant: 10),
            labelSix.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelSix.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelSix.heightAnchor.constraint(equalToConstant: 40),
            
            buttonMale.topAnchor.constraint(equalTo: imageGender.bottomAnchor, constant: 35),
            buttonMale.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 160),
            buttonMale.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            buttonMale.heightAnchor.constraint(equalToConstant: 65),
            buttonMale.widthAnchor.constraint(equalToConstant: 123),
            
            buttonFemale.topAnchor.constraint(equalTo: buttonMale.bottomAnchor, constant: 30),
            buttonFemale.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            buttonFemale.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            buttonFemale.heightAnchor.constraint(equalToConstant: 65),
            buttonFemale.widthAnchor.constraint(equalToConstant: 161),
            
            buttonCont.topAnchor.constraint(equalTo: buttonFemale.bottomAnchor, constant: 40),
            buttonCont.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCont.heightAnchor.constraint(equalToConstant: 50),
            buttonCont.widthAnchor.constraint(equalToConstant: 227),
        ])
    }
    
    //Button action functions
    
    @objc func propMale(){
        buttonMale.backgroundColor = UIColor(red: 60/255, green: 148/255, blue: 223/255, alpha: 1.0)
        buttonFemale.backgroundColor = UIColor(red: 253/255, green: 187/255, blue: 211/255, alpha: 1.0)
        
        gender = "Male"
    }
    
    @objc func propFemale(){
        buttonFemale.backgroundColor = UIColor(red: 250/255, green: 119/255, blue: 168/255, alpha: 1.0)
        buttonMale.backgroundColor = UIColor(red: 157/255, green: 202/255, blue: 239/255, alpha: 1.0)
        
        gender = "Female"
    }
    
    //Mark:- Save data to defaults and go to next
    
    @objc func getNext(){
        let data = UserDefaults.standard
        
        if gender.isEmpty {
            let alert = UIAlertController(title: "Missing Gender", message: "Please choose your gender.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            data.set(gender, forKey: "Gender")
            
            let vc = viewAge()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    // MARK: - Navigation Bar Setup
    
    func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
