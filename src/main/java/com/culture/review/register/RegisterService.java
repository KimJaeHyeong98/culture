package com.culture.review.register;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.review.vo.ReviewVO;

@Service
public class RegisterService {
    
    @Autowired
    private RegisterMapper registerMapper;

      public void addregister(RegisterVO registerVO) {
        if (registerMapper.insertRegister(registerVO) == 1) {
            System.out.println("add register success");
        }

    }

}
