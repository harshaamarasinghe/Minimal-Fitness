import UIKit
import SnapKit
import FirebaseFirestore

class viewEditProfile: UIViewController {

    //MARK: Variables
    
    let db = Firestore.firestore()
    
    var dataUpdatedCompletion: (() -> Void)?
    //MARK: Components
    
    let labelTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Edit Profile"
        label.textAlignment = .center
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "edit_profile"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelAge : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.textColor = UIColor(red: 72/255, green: 72/255, blue: 72/255, alpha: 1.0)
        label.text = "Age"
        label.textAlignment = .center
        return label
    }()
    
    let labelWeight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.textColor = UIColor(red: 72/255, green: 72/255, blue: 72/255, alpha: 1.0)
        label.text = "Weight"
        label.textAlignment = .center
        return label
    }()
    
    let labelHeight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.textColor = UIColor(red: 72/255, green: 72/255, blue: 72/255, alpha: 1.0)
        label.text = "Height"
        label.textAlignment = .center
        return label
    }()
    
    let textFieldAge : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 26)
        return textField
    }()
    
    let textFieldWeight : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 26)
        return textField
    }()
    
    let textFieldHeight : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 26)
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let buttonUpdate : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .orange
        setupUI()
    }
    
    //MARK: Funcitons
    
    func setupUI(){
        view.backgroundColor = .white
        
        view.addSubview(labelTitle)
        view.addSubview(image)
        view.addSubview(labelAge)
        view.addSubview(textFieldAge)
        view.addSubview(labelWeight)
        view.addSubview(textFieldWeight)
        view.addSubview(labelHeight)
        view.addSubview(textFieldHeight)
        view.addSubview(buttonUpdate)
        
        
        buttonUpdate.addTarget(self, action: #selector(updateProcess), for: .touchUpInside)
        
        //MARK: Constraints
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(view)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(labelTitle).offset(50)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 350, height: 350))
        }
        
        labelAge.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(115)
        }
        
        textFieldAge.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.centerY.equalTo(labelAge.snp.centerY)
            make.left.equalTo(labelAge.snp.right).offset(40)
            make.width.equalTo(100)
        }
        
        labelWeight.snp.makeConstraints { make in
            make.top.equalTo(labelAge.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(115)
        }
        
        textFieldWeight.snp.makeConstraints { make in
            make.top.equalTo(textFieldAge.snp.bottom).offset(10)
            make.centerY.equalTo(labelWeight.snp.centerY)
            make.left.equalTo(labelAge.snp.right).offset(40)
            make.width.equalTo(100)
        }
        
        labelHeight.snp.makeConstraints { make in
            make.top.equalTo(labelWeight.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(115)
        }
        
        textFieldHeight.snp.makeConstraints { make in
            make.top.equalTo(textFieldWeight.snp.bottom).offset(10)
            make.centerY.equalTo(labelHeight.snp.centerY)
            make.left.equalTo(labelAge.snp.right).offset(40)
            make.width.equalTo(100)
        }
        
        buttonUpdate.snp.makeConstraints { make in
            make.top.equalTo(labelHeight.snp.bottom).offset(25)
            make.centerX.equalTo(view)
            make.width.equalTo(100)
        }
        
        
    }

    //viewProfile is updated after the editing data
    @objc func updateProcess() {
        let data = UserDefaults.standard
        let email = data.string(forKey: "email")
        
        guard let age = textFieldAge.text, !age.isEmpty,
              let height = textFieldHeight.text, !height.isEmpty,
              let weight = textFieldWeight.text, !weight.isEmpty else {
            showAlert(message: "Please fill in all fields.")
            return
        }
        
        updateData(email: email!, age: age, height: height, weight: weight) { success in
            if success {
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                    self.dataUpdatedCompletion?()
                }
            } else {
                self.showAlert(message: "Failed to update data.")
            }
        }
    }

    //Update data in the databse
    func updateData(email: String, age: String, height: String, weight: String, completion: @escaping (Bool) -> Void) {
        let docRef = db.collection("users").whereField("email", isEqualTo: email)
        
        docRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(false)
                return
            }
            
            guard let document = querySnapshot?.documents.first else {
                print("Document not found")
                completion(false)
                return
            }
            
            document.reference.updateData([
                "age": age,
                "height": height,
                "weight": weight
            ]) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                    completion(false)
                } else {
                    print("Document updated successfully")
                    completion(true)
                }
            }
        }
        
        //Adding weight data into a seperate collection
        let data: [String: Any] = [
            "email": email,
            "weight": weight
        ]
        
        db.collection("/userweights").addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added")
            }
        }
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
