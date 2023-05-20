import UIKit
import SnapKit

class viewEditProfile: UIViewController {

    //Mark:- Components
    
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
        textField.placeholder = "25 yrs"
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 26)
        return textField
    }()
    
    let textFieldWeight : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "60 kg"
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 26)
        return textField
    }()
    
    let textFieldHeight : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 26)
        textField.placeholder = "178 cm"
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
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        setupUI()
    }
    
        //Mark:- Functions
    
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
        
        //Mark:- Constraints
        
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

    @objc func didTapToDismiss() {
        view.endEditing(true)
    }
}