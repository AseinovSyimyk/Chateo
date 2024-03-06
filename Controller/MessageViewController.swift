import UIKit
import SnapKit

class MessageViewController: UIViewController {
    
    var codeTextFields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Enter Code"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        let infoLabel = UILabel()
        infoLabel.text = "We have sent you an SMS with the code to +62 1309 - 1710 - 1920"
        infoLabel.textColor = .black
        infoLabel.font = UIFont.systemFont(ofSize: 16)
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        view.addSubview(infoLabel)
        
        let textFieldContainer = UIView()
        view.addSubview(textFieldContainer)
        
        for _ in 0..<4 {
            let textField = UITextField()
            textField.backgroundColor = .gray
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
            textField.layer.cornerRadius = 15
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.delegate = self
            textFieldContainer.addSubview(textField)
            codeTextFields.append(textField)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.width.equalTo(261)
            make.height.equalTo(48)
            make.left.equalToSuperview().offset(60)
        }
        
        textFieldContainer.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(140)
        }
        
        let textFieldWidth = 30
        let spacing = 10
        let totalWidth = CGFloat(4 * textFieldWidth + 3 * spacing)
        
        let _ = (view.frame.width - totalWidth) / 2 - 40
        
        for (index, textField) in codeTextFields.enumerated() {
            textField.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.width.equalTo(textFieldWidth)
                make.height.equalTo(textFieldWidth)
                let leadingOffset = CGFloat(index) * (CGFloat(textFieldWidth) + CGFloat(spacing))
                make.centerX.equalTo(textFieldContainer.snp.leading).offset(leadingOffset + CGFloat(textFieldWidth) / 2)
            }
        }
        
        let buttonResendCode = UIButton(type: .system)
        buttonResendCode.setTitle("Resend Code", for: .normal)
        buttonResendCode.setTitleColor(.blue, for: .normal)
        buttonResendCode.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonResendCode.addTarget(self, action: #selector(resendCodeButtonTapped), for: .touchUpInside)
        view.addSubview(buttonResendCode)
        
        buttonResendCode.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textFieldContainer.snp.bottom).offset(40)
            make.width.equalTo(99)
            make.height.equalTo(28)
        }
    }
    
    @objc func resendCodeButtonTapped() {
        let contactVC = ContactViewController()
        navigationController?.pushViewController(contactVC, animated: true)
    }
}

extension MessageViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: characterSet)
    }
}
