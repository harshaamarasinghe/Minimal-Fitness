import UIKit

class viewLevel: UIViewController {

    //Var
    
    var level : String = ""
    
    //UI Comps
    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(5/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 5/6"
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
        label.text = "your level"
        label.textAlignment = .center
        return label
    }()
    
    let labelFour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "of exercise?"
        label.textAlignment = .center
        return label
    }()
    
    let image : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "exercise"))
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
    
    let buttonBeginner : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Beginner", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonInter : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Intermediate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
   
    let buttonAdv : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Advanced", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let vStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
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
        setupNavigationBar()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(progressView)
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(labelThree)
        view.addSubview(image)
        view.addSubview(labelFour)
        view.addSubview(labelFive)
        view.addSubview(labelSix)
        
        vStack.addArrangedSubview(buttonBeginner)
        vStack.addArrangedSubview(buttonInter)
        vStack.addArrangedSubview(buttonAdv)
        
        view.addSubview(vStack)
        view.addSubview(buttonCont)
        
        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)
        
        //Button actions
        
        buttonBeginner.addTarget(self, action: #selector(btnB), for: .touchUpInside)
        buttonInter.addTarget(self, action: #selector(btnI), for: .touchUpInside)
        buttonAdv.addTarget(self, action: #selector(btnA), for: .touchUpInside)
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
            
            labelFour.topAnchor.constraint(equalTo: labelThree.bottomAnchor),
            labelFour.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelFour.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelFour.heightAnchor.constraint(equalToConstant: 40),
            
            image.topAnchor.constraint(equalTo: labelFour.bottomAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: 240),
            image.widthAnchor.constraint(equalToConstant: 240),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelFive.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            labelFive.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFive.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelFive.heightAnchor.constraint(equalToConstant: 40),
            
            labelSix.topAnchor.constraint(equalTo: labelFive.bottomAnchor, constant: 10),
            labelSix.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelSix.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelSix.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            vStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: -20),
            vStack.leadingAnchor.constraint(equalTo: labelFive.trailingAnchor, constant: -20),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            buttonCont.topAnchor.constraint(equalTo: labelSix.bottomAnchor, constant: 50),
            buttonCont.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCont.heightAnchor.constraint(equalToConstant: 50),
            buttonCont.widthAnchor.constraint(equalToConstant: 227),
        ])
    }
    
    @objc func btnB(){
        buttonBeginner.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        buttonInter.backgroundColor = .white
        buttonAdv.backgroundColor = .white
        
        buttonBeginner.setTitleColor(.white, for: .normal)
        buttonInter.setTitleColor(.black, for: .normal)
        buttonAdv.setTitleColor(.black, for: .normal)
        
        buttonBeginner.layer.borderWidth = 0
        buttonInter.layer.borderWidth = 1
        buttonAdv.layer.borderWidth = 1
        
        level = "Beginner"
    }

    @objc func btnI(){
        buttonBeginner.backgroundColor = .white
        buttonInter.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        buttonAdv.backgroundColor = .white

        buttonBeginner.setTitleColor(.black, for: .normal)
        buttonInter.setTitleColor(.white, for: .normal)
        buttonAdv.setTitleColor(.black, for: .normal)
        
        buttonBeginner.layer.borderWidth = 1
        buttonInter.layer.borderWidth = 0
        buttonAdv.layer.borderWidth = 1
        
        level = "Intermediate"
    }
    
    @objc func btnA(){
        buttonBeginner.backgroundColor = .white
        buttonInter.backgroundColor = .white
        buttonAdv.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)

        buttonBeginner.setTitleColor(.black, for: .normal)
        buttonInter.setTitleColor(.black, for: .normal)
        buttonAdv.setTitleColor(.white, for: .normal)
        
        buttonBeginner.layer.borderWidth = 1
        buttonInter.layer.borderWidth = 1
        buttonAdv.layer.borderWidth = 0
        
        level = "Advanced"
    }
    
    //button action
    
    @objc func getNext(){
        
        let data = UserDefaults.standard
        
        if(level.isEmpty){
            let alert = UIAlertController(title: "Missing Level", message: "Please choose your level.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            
            data.set(level, forKey: "Level")
            
            let vc = viewGoal()
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
