package com.dk.bootwebapp.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public interface PasswordService {

    String hashPassword(String in);
    String bytesToHex(byte[] bytes);

}
