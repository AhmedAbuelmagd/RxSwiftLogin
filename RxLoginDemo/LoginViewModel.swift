//
//  LoginViewModel.swift
//  RxLoginDemo
//
//  Created by Ahmed Abuelmagd on 7/14/20.
//  Copyright © 2020 Ahmed Abuelmagd. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct LoginVM {
    var emailTxt =  BehaviorRelay<String>(value: "")
    var passwordTxt = BehaviorRelay<String>(value: "")
    var isValid: Observable<Bool>{
        return Observable.combineLatest(emailTxt.asObservable(), passwordTxt.asObservable()){ email, password in
            email.count >= 3  && password.count >= 3
        }
    }
}
