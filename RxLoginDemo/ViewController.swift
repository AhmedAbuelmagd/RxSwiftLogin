//
//  ViewController.swift
//  RxLoginDemo
//
//  Created by Ahmed Abuelmagd on 7/14/20.
//  Copyright © 2020 Ahmed Abuelmagd. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var statusLbl: UILabel!
    
    var loginVM = LoginVM()
    let desposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = emailTxtField.rx.text.map{$0 ?? ""}.bind(to: loginVM.emailTxt)
        _ = passwordTxtField.rx.text.map{$0 ?? ""}.bind(to: loginVM.passwordTxt)
        _ = loginVM.isValid.bind(to: loginBtn.rx.isEnabled)
        loginVM.isValid.subscribe(onNext: { [weak self] isValid in
            self?.statusLbl.text = isValid ? "Enabled" : "Not Enabled"
            self?.statusLbl.textColor = isValid ? .green : .red
            }).disposed(by: desposeBag)
    }
    
    
}

