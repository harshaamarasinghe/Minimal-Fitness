import UIKit
import FirebaseFirestore

class emailSignupViewController: UIViewController {
    
    //MARK: Variable
    
    let db = Firestore.firestore()
    
    var dataArray: [[String: Any]] = []
    var emailDataArray: [String] = []
    var password: String = ""
    var emailAddr: String = ""
    
    //MARK: UI Components
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Create an Account"
        label.textAlignment = .center
        return label
    }()
    
    let imageSI: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "signup"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirm Password"
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEmailData()
        setupUI()
        setupActions()
        setupNavigationBar()
    }
    
    //MARK: Functions
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(imageSI)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(signupButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            imageSI.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            imageSI.heightAnchor.constraint(equalToConstant: 381),
            imageSI.widthAnchor.constraint(equalToConstant: 381),
            imageSI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: imageSI.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            signupButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 20),
            signupButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            signupButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupActions() {
        signupButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    @objc func signUp() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else {
            displayAlert(message: "Please fill in all fields.")
            return
        }
        
        // Validate email
        guard isValidEmail(email) else {
            // Handle error - Invalid email format
            displayAlert(message: "Please enter a valid email address.")
            return
        }
        
        // Validate password
        guard isValidPassword(password) else {
            displayAlert(message: "Please enter a password with at least 6 characters.")
            return
        }
        
        // Check if passwords match
        guard password == confirmPassword else {
            displayAlert(message: "Passwords do not match.")
            return
        }
        
        self.password = passwordTextField.text!
        self.emailAddr = emailTextField.text ?? "mini@m.com"
        
        compareEmailData(emailData: emailAddr)
        
        // Reset text fields
        emailTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
    
    func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Navigation Bar Setup
    
    func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func getEmailData(){
        db.collection("/users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    self.dataArray.append(data)
                }
                self.saveEmailToArray()
            }
        }
    }
    
    func saveEmailToArray() {
        for data in dataArray {
            self.emailDataArray.append(data["email"] as! String)
        }
    }
    
    func compareEmailData(emailData:String){
        var isMatchFound = false
        
        print("Hello",emailData)
        
        for data in emailDataArray {
            print("This is emails:",data)
            if data == emailData {
                let alertController = UIAlertController(title: emailData, message: "The email address has already been used!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                isMatchFound = true
                break
            }
        }
        
        if !isMatchFound {
            let alertController = UIAlertController(title: "Successfully Registered!", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                        self?.setUserData()
                    }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func setUserData(){
        let userData = UserDefaults.standard
        userData.set(emailAddr, forKey: "email")
        userData.set(password, forKey: "password")
        genderVC()
    }
    
    func genderVC(){
        let vc = viewGender()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
