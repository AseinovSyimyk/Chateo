import UIKit
import SnapKit

class PhoneNumberViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.text = "Enter Your Phone Number"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        let labelConfirm = UILabel()
        labelConfirm.text = "Please confirm your country code and enter your phone number"
        labelConfirm.textColor = .gray
        labelConfirm.font = UIFont.systemFont(ofSize: 16)
        labelConfirm.textAlignment = .center
        labelConfirm.numberOfLines = 0
        view.addSubview(labelConfirm)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        view.addSubview(stackView)
        
        let countryImageView = UIImageView(image: UIImage(named: "Kyrgyzstan"))
        countryImageView.contentMode = .scaleAspectFit
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageContainerView.addSubview(countryImageView)
        
        let countryCodeLabel = UILabel()
        countryCodeLabel.text = "+996"
        countryCodeLabel.font = UIFont.systemFont(ofSize: 16)
        countryCodeLabel.textColor = .black
        
        let countryCodeContainerView = UIView()
        countryCodeContainerView.addSubview(countryCodeLabel)
        countryCodeContainerView.addSubview(imageContainerView)
        countryCodeContainerView.layer.cornerRadius = 5
        countryCodeContainerView.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
        countryCodeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageContainerView.snp.trailing).offset(5)
        }
        imageContainerView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        countryImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.addArrangedSubview(countryCodeContainerView)
        
        let phoneNumberTextField = UITextField()
        phoneNumberTextField.placeholder = "Phone Number"
        phoneNumberTextField.borderStyle = .roundedRect
        phoneNumberTextField.delegate = self
        stackView.addArrangedSubview(phoneNumberTextField)
        
        let buttonNext = UIButton()
        buttonNext.setTitle("Continue", for: .normal)
        buttonNext.backgroundColor = .blue
        buttonNext.layer.cornerRadius = 26
        buttonNext.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.addSubview(buttonNext)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        labelConfirm.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(labelConfirm.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        buttonNext.snp.makeConstraints { make in
            make.width.equalTo(328)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    @objc func nextButtonTapped() {
        let messageVC = MessageViewController()
        navigationController?.pushViewController(messageVC, animated: true)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
