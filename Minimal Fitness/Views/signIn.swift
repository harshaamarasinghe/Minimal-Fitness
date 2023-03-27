import UIKit

class signIn: UIViewController {

    //UI Comps
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Welcome back"
        label.textAlignment = .center
        return label
    }()
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 191/255, green: 195/255, blue: 195/255, alpha: 1.0)
        label.text = "Let’s build again!"
        label.textAlignment = .center
        return label
    }()
    
    let imageSI: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "signin"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelThree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .thin)
        label.text = "Sign in"
        label.textAlignment = .center
        return label
    }()
    
    let labelFour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 191/255, green: 195/255, blue: 195/255, alpha: 1.0)
        label.text = "Let’s build again!"
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 191/255, green: 195/255, blue: 195/255, alpha: 1.0)
        label.text = "Already have account?"
        label.textAlignment = .center
        return label
    }()
    
    let imageG: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "google"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let buttonG : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       // button.setImage(UIImage(named: "google"), for: .normal)
        button.setTitle("Continue with Google", for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let hStackG : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    
    let buttonA : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.setTitle("Continue with Apple", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let buttonSU : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(imageSI)
        view.addSubview(labelThree)
        
        hStack.addArrangedSubview(imageG)
        hStack.addArrangedSubview(buttonG)
        
        view.addSubview(hStack)
        
        NSLayoutConstraint.activate([
            labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelOne.heightAnchor.constraint(equalToConstant: 40),

            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor),
            labelTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelTwo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //labelTwo.heightAnchor.constraint(equalToConstant: 40),
            
            imageSI.topAnchor.constraint(equalTo: labelTwo.bottomAnchor),
            imageSI.heightAnchor.constraint(equalToConstant: 381),
            imageSI.widthAnchor.constraint(equalToConstant: 381),
            imageSI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelThree.topAnchor.constraint(equalTo: imageSI.bottomAnchor, constant: -20),
            labelThree.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelThree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            
            hStack.topAnchor.constraint(equalTo: labelThree.bottomAnchor),
            hStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            hStack.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    
}
