import UIKit
import SnapKit


class viewHome: UIViewController {

    //Variables
    
    let userName : String = "Harsha!"
    
    let exerciseImages : [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!,
        UIImage(named: "9")!,
        UIImage(named: "10")!,
        
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
    
    let labelTitleOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        //label.textColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        label.text = "Let's thrive"
        label.textAlignment = .center
        return label
    }()
    
    let labelTitleTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        label.text = "It’s our leg day"
        label.textAlignment = .center
        return label
    }()
    
    let imageProfile: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "man"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
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
//        table.layer.borderWidth = 1
//        table.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        table.layer.cornerRadius = 8
        //table.backgroundColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1.0)
        //table.showsVerticalScrollIndicator = true

        return table
    }()
    
    
//    let image: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "home"))
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
    
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
        view.addSubview(labelTitleOne)
        view.addSubview(labelTitleTwo)
        view.addSubview(imageProfile)
        view.addSubview(exerciseTable)
        //view.addSubview(image)
        
//        labelName.text = userName
//
//        view.addSubview(labelName)
//        view.addSubview(imageProfile)
//        view.addSubview(labelTitle)
//        view.addSubview(exerciseTable)
        
        //Constraints
        
        labelTitleOne.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(25)
        }
        
        labelTitleTwo.snp.makeConstraints { make in
            make.top.equalTo(labelTitleOne.snp.bottom).offset(5)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(25)
        }
        
        imageProfile.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(60)
            //make.left.equalTo(labelTitleOne.snp.right).offset(25)
            make.right.equalTo(view.snp.right).offset(-25)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        exerciseTable.snp.makeConstraints { make in
            make.top.equalTo(labelTitleTwo.snp.bottom).offset(40)
            //make.bottom.equalTo(view.snp.bottom).offset(-10)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 340, height: 600))
        }
        
        
//        image.snp.makeConstraints { make in
//            make.top.equalTo(exerciseTable.snp.bottom).offset(20)
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(-20)
//            //make.centerX.equalTo(view)
//            make.size.equalTo(CGSize(width: 350, height: 350))
        }
        
        
//        labelName.snp.makeConstraints { make in
//            make.top.equalTo(view.snp.top).offset(70)
//            make.left.equalTo(labelHello.snp.right).offset(10)
//        }
//
//        imageProfile.snp.makeConstraints { make in
//            make.top.equalTo(view.snp.top).offset(50)
//            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-25)
//            make.size.equalTo(CGSize(width: 60, height: 60))
//        }
//
//        labelTitle.snp.makeConstraints { make in
//            make.top.equalTo(view.snp.top).offset(120)
//            //make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-25)
//            make.centerX.equalTo(view)
//            make.size.equalTo(CGSize(width: 340, height: 50))
//        }
//
//        exerciseTable.snp.makeConstraints { make in
//            make.top.equalTo(labelTitle.snp.bottom).offset(20)
//            make.bottom.equalTo(view.snp.bottom).offset(-10)
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.right).offset(20)
//            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
//            make.centerX.equalTo(view)
//            make.size.equalTo(CGSize(width: 340, height: 50))
//        }
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
        
        cell.contentView.backgroundColor = .white
        
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
