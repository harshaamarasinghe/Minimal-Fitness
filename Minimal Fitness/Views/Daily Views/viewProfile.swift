
import UIKit

class viewProfile: UIViewController {
    
    //Mark:- Variables
    
    
    
    //Mark:- Components
    
    let coverimage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "coverimage"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileimage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "man"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()

    let labelName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.text = "Lankesh Kumar"
        label.textAlignment = .center
        return label
    }()
    
    let editProfile : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //Mark:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //Mark:- Functions
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(coverimage)
        view.addSubview(profileimage)
        view.addSubview(labelName)
        view.addSubview(editProfile)
        
        // Constraints
        
        coverimage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 800, height: 280))
        }
        
        profileimage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        
        labelName.snp.makeConstraints { make in
            make.top.equalTo(profileimage.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        editProfile.snp.makeConstraints { make in
            make.top.equalTo(labelName.snp.bottom)
            make.centerX.equalTo(view)
        }

        view.layoutIfNeeded() // Ensure the view layout is complete

        profileimage.layer.cornerRadius = profileimage.frame.width / 2 // Set corner radius
        profileimage.layer.masksToBounds = true
    }

    
    
    
    
    
    
    
    
    
    
    
}
