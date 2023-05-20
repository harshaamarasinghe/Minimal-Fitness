import UIKit
import SnapKit

class viewBMI: UIViewController {
    
    //Var
    
    var BMI = 1.2;
    //    var color = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
    
    //UI Comps
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "According to"
        label.textAlignment = .center
        return label
    }()
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Body Mass Index"
        label.textAlignment = .center
        return label
    }()
    
    let image : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bmi"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelThree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "You"
        label.textAlignment = .left
        return label
    }()
    
    let labelFour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Are"
        label.textAlignment = .center
        //label.layer.borderColor =
        return label
    }()
    
    let vStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    let hStackMid : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    let labelFive : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .regular)
        //label.text = "Underweight"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(red: 1/255, green: 166/255, blue: 170/255, alpha: 1.0)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    let labelSix : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Let's"
        label.textAlignment = .center
        return label
    }()
    
    let labelSeven : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .regular)
        //label.text = "Gain Muscle"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    let buttonStart : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI();
        buttonStart.addTarget(self, action: #selector(getNext), for: .touchUpInside)
    }
    
    func setupUI(){
        view.backgroundColor = .white
        
        calculateBMI()
        
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(image)
        view.addSubview(labelThree)
        view.addSubview(labelFour)
        
        vStack.addArrangedSubview(labelThree)
        vStack.addArrangedSubview(labelFour)
        
        hStackMid.addArrangedSubview(vStack)
        hStackMid.addArrangedSubview(labelFive)
        
        view.addSubview(hStackMid)
        
        hStack.addArrangedSubview(labelSix)
        hStack.addArrangedSubview(labelSeven)
        
        view.addSubview(hStack)
        view.addSubview(buttonStart)
        
        //Button actions
        
        
        
        
        //Constraints
        
        labelOne.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(view)
        }
        
        labelTwo.snp.makeConstraints { make in
            make.top.equalTo(labelOne).offset(40)
            make.centerX.equalTo(view)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(labelTwo).offset(10)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 350, height: 350))
        }
        
        hStackMid.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }
        
        labelFive.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 220, height: 100))
        }
        
        vStack.snp.makeConstraints { make in
            make.top.equalTo(vStack).offset(10)
            //make.top.equalTo(vStack.snp.bottom).offset(50)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
        }
        hStack.snp.makeConstraints { make in
            make.top.equalTo(hStackMid.snp.bottom).offset(20)
            //make.centerX.equalTo(view)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(80)
        }
        
        labelSeven.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 200, height: 50))
        }
        
        buttonStart.snp.makeConstraints { make in
            make.top.equalTo(hStack.snp.bottom).offset(50)
            //make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 227, height: 50))
        }
        
        
    }
    
    func calculateBMI(){
        let data = UserDefaults.standard
        
        let weight = Double(data.integer(forKey: "Weight"))
        let height = Double(data.integer(forKey: "Height"))
        
        let bmi = (weight/height/height)*10000
        
        let bmiDouble = Double(bmi)
        
        print(weight, height, bmi, bmiDouble)
        
        if(bmiDouble<18.5){
            labelFive.text = "Underweight"
            labelSeven.text = "Gain Muscle"
        } else if bmiDouble < 25 {
            labelFive.text = "Normal Weight"
            labelSeven.text = "Gain Muscle"
        } else if bmiDouble < 30 {
            labelFive.text = "Overweight"
            labelSeven.text = "Lose Weight"
        } else {
            labelFive.text = "Obese"
            labelSeven.text = "Lose Weight"
        }
    }
    
    @objc func getNext() {
        
      
        
        let tabBarController = UITabBarController()
        
        
        
        let home = UINavigationController(rootViewController: viewHome())
        let schedule = UINavigationController(rootViewController: viewSchedule())
        let progress = UINavigationController(rootViewController: viewProgress())
        let profile = UINavigationController(rootViewController: viewProfile())
        
        home.title = "Home"
        schedule.title = "Schedule"
        progress.title = "Progress"
        profile.title = "Profile"
        
        tabBarController.setViewControllers([home,schedule,progress,profile], animated: false)
        
        guard let items = tabBarController.tabBar.items else {
            return
        }
        
        let images = ["house","calendar","chart.xyaxis.line","person.crop.circle"]
    
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
            items[x].badgeColor = UIColor.orange
        }
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.tintColor = .orange
        
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: false)
        
    }
    
   
    
}
