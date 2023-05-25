import UIKit

class viewHeight: UIViewController {

    //Var
    
    var heightNumber : String = ""
    var type : String     = ""
    var finalHeight : String  = ""
    
    //UI Comps
    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(4/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 4/6"
        label.textAlignment = .center
        return label
    }()
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "What's"
        label.textAlignment = .center
        return label
    }()
    
    let labelThree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "your height?"
        label.textAlignment = .center
        return label
    }()
    
    let imageAge: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "height"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelFour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "I"
        label.textAlignment = .center
        return label
    }()
    
    let labelFive : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Am"
        label.textAlignment = .center
        return label
    }()
    
    let textField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "178"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 36, weight: .semibold)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        return textField
    }()
    
    let buttonCm : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("cm", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
//    let buttonLbs : UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("ft", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
//        button.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
//        button.titleLabel?.textColor = .white
//        button.layer.cornerRadius = 10
//        return button
//    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
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
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        setupNavigationBar()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        
        btnCm()
        
        view.addSubview(progressView)
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(labelThree)
        view.addSubview(imageAge)
        view.addSubview(labelFour)
        view.addSubview(labelFive)
        view.addSubview(textField)
        
        hStack.addArrangedSubview(buttonCm)
   //     hStack.addArrangedSubview(buttonLbs)
        
        view.addSubview(hStack)
        view.addSubview(buttonCont)
        
        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)
        
        //Button actions
        
        buttonCm.addTarget(self, action: #selector(btnCm), for: .touchUpInside)
      //  buttonLbs.addTarget(self, action: #selector(btnLbs), for: .touchUpInside)
        buttonCont.addTarget(self, action: #selector(getNext), for: .touchUpInside)
        
        //Constraints

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
            
            imageAge.topAnchor.constraint(equalTo: labelThree.bottomAnchor, constant: 20),
            imageAge.heightAnchor.constraint(equalToConstant: 240),
            imageAge.widthAnchor.constraint(equalToConstant: 240),
            imageAge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelFour.topAnchor.constraint(equalTo: imageAge.bottomAnchor, constant: 20),
            labelFour.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFour.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelFour.heightAnchor.constraint(equalToConstant: 40),
            
            labelFive.topAnchor.constraint(equalTo: labelFour.bottomAnchor, constant: 10),
            labelFive.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFive.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelFive.heightAnchor.constraint(equalToConstant: 40),
            
            textField.topAnchor.constraint(equalTo: imageAge.bottomAnchor, constant: 27),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 180),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            textField.heightAnchor.constraint(equalToConstant: 75),
            textField.widthAnchor.constraint(equalToConstant: 103),
            
            hStack.topAnchor.constraint(equalTo: labelFive.bottomAnchor, constant: 20),
            hStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCm.heightAnchor.constraint(equalToConstant: 56),
            buttonCm.widthAnchor.constraint(equalToConstant: 70),

            buttonCont.topAnchor.constraint(equalTo: buttonCm.bottomAnchor, constant: 20),
            buttonCont.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCont.heightAnchor.constraint(equalToConstant: 50),
            buttonCont.widthAnchor.constraint(equalToConstant: 227),
        ])
    }
    
    @objc func btnCm(){
        buttonCm.backgroundColor = UIColor(red: 182/255, green: 162/255, blue: 245/255, alpha: 1.0)
        //buttonLbs.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        
        type = "cm"
    }
    
    
    @objc func getNext(){
        let data = UserDefaults.standard

        guard let heightString = textField.text, let height = Int(heightString), height >= 0 && !(heightString.isEmpty) else {
            let alert = UIAlertController(title: "Invalid Height", message: "Please enter a valid height.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        data.set(heightString, forKey: "Height")
        
        
        let vc = viewLevel()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func didTapToDismiss() {
            view.endEditing(true)
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
