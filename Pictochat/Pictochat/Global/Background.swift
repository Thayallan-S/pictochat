//
//  Background.swift
//  Pictochat
//
//  Created by Thayallan Srinathan on 2018-12-14.
//  Copyright © 2018 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class Background: UIView {
    
    private let backgroundImage = UIImageView().then {
        $0.image = UIImage(named: "background")
        
    }
    
    init() {
        super.init(frame: .zero)
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Background {
    func layoutViews() {
        addSubview(backgroundImage)
        backgroundImage.easy.layout(Edges())
    }
}
