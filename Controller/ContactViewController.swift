import UIKit
import SnapKit

class ContactViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let labelProfile = UILabel()
        labelProfile.text = "YourProfile"
        labelProfile.textColor = .black
        labelProfile.font = UIFont.systemFont(ofSize: 16)
        
        let labelProfileButton = UIBarButtonItem(customView: labelProfile)
        
        if let existingItems = navigationItem.leftBarButtonItems {
            navigationItem.leftBarButtonItems = existingItems + [labelProfileButton]
        } else {
            navigationItem.leftBarButtonItems = [labelProfileButton]
        }
        
        navigationItem.leftItemsSupplementBackButton = true
        
        let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(120)
        }
        
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        
        let firstNameTextField = UITextField()
        firstNameTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        firstNameTextField.textAlignment = .center
        firstNameTextField.placeholder = "First Name (Required)"
        view.addSubview(firstNameTextField)
        
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        let lastNameTextField = UITextField()
        lastNameTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        lastNameTextField.textAlignment = .center
        lastNameTextField.placeholder = "Last Name (Optional)"
        view.addSubview(lastNameTextField)
        
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(10)
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        
        let buttonSave = UIButton()
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.backgroundColor = .blue
        buttonSave.layer.cornerRadius = 26
        buttonSave.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(buttonSave)
        
        buttonSave.snp.makeConstraints { make in
            make.width.equalTo(328)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    @objc func saveButtonTapped() {
        let allContactsVC = AllContactsViewController()
        navigationController?.pushViewController(allContactsVC, animated: true)
    }
}
