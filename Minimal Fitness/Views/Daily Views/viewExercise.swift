import UIKit

class viewExercise: UIViewController {

    //components
    
    let image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pushup-real"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelWorkout : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        label.text = "Push Up"
        label.textAlignment = .center
        return label
    }()
    
    let labelDesc : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Strength-building exercise that targets the chest, shoulders, and arms."
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(image)
        view.addSubview(labelWorkout)
        view.addSubview(labelDesc)
//        view.addSubview(appNameTwo)
//        view.addSubview(image)
//        view.addSubview(startButton)
        
        image.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(30)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 360, height: 200))
        }
        
        labelWorkout.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        labelDesc.snp.makeConstraints { make in
            make.top.equalTo(labelWorkout.snp.bottom).offset(5)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.centerX.equalTo(view)
        }
//
//        image.snp.makeConstraints { make in
//            make.top.equalTo(labelTwo).offset(50)
//            make.centerX.equalTo(view)
//            make.size.equalTo(CGSize(width: 240, height: 180))
//        }
//
//        hStackMid.snp.makeConstraints { make in
//            make.top.equalTo(image.snp.bottom).offset(40)
//            make.centerX.equalTo(view)
//        }
//
//        labelFive.snp.makeConstraints { make in
//            make.size.equalTo(CGSize(width: 200, height: 100))
//        }
//
//        hStack.snp.makeConstraints { make in
//            make.top.equalTo(hStackMid.snp.bottom).offset(50)
//            //make.centerX.equalTo(view)
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(60)
//        }
//
//        labelSeven.snp.makeConstraints { make in
//            make.size.equalTo(CGSize(width: 200, height: 50))
//        }
//
//        buttonStart.snp.makeConstraints { make in
//            make.top.equalTo(hStack.snp.bottom).offset(60)
//            //make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
//            make.centerX.equalTo(view)
//            make.size.equalTo(CGSize(width: 227, height: 50))
//        }
        
    }
    

}
