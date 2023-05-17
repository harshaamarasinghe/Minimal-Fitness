import UIKit
import SnapKit


class viewHome: UIViewController {

    //Variables
    
    let userName : String = "Harsha!"
    
    let exerciseImages : [UIImage] = [
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        UIImage(named: "push-up")!,
        
    ]
    
    let desc : [String] = [
        "Push Up",
        "Push Up",
        "Push Up",
        "Push Up",
        "Push Up",
        "Push Up",
        "Push Up",
        "Push Up",
        "Push Up",
        "Push Up",
    ]
    //Components
    
    let labelHello : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        label.text = "Hello"
        label.textAlignment = .center
        return label
    }()
    
    let labelName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        //label.text = "Hello"
        label.textAlignment = .center
        return label
    }()
    
    let imageProfile: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile-man"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "Today's List of Workouts"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    let exerciseTable : UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        table.allowsSelection = true
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return table
    }()
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exerciseTable.delegate = self
        self.exerciseTable.dataSource = self
        
        setupUI()
    }
    
    //Setup UI
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(labelHello)
        
        labelName.text = userName
        
        view.addSubview(labelName)
        view.addSubview(imageProfile)
        view.addSubview(labelTitle)
        view.addSubview(exerciseTable)
        
        //Constraints
        
        labelHello.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(25)
        }
        
        labelName.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.left.equalTo(labelHello.snp.right).offset(10)
        }
        
        imageProfile.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-25)
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(120)
            //make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-25)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 340, height: 50))
        }
        
        exerciseTable.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(20)
            make.bottom.equalTo(view.snp.bottom).offset(-10)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.right).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 340, height: 50))
        }
    }
}

extension viewHome : UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //for now number of image count
        return self.exerciseImages.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = exerciseTable.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else{
            fatalError("Failed Attempt : Table View")
        }
        
        let image = self.exerciseImages[indexPath.row]
        let label = self.desc[indexPath.row]
        
        cell.configure(with: image, and: label)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        getNext()
        
    }
    
    @objc func getNext(){
        let vc = viewExercise()
        navigationController?.pushViewController(vc, animated: true)
    }
}
