/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.prac1progra2.Restricciones;

import java.io.InputStream;

/**
 *
 * @author Mariano
 */
public class ConstructorLlamados {
    private InputStream fileConten;

    public ConstructorLlamados(InputStream fileConten) {
        this.fileConten = fileConten;
    }

    public InputStream getFileConten() {
        return this.fileConten;
    }

    public void setFileConten(InputStream fileConten) {
        this.fileConten = fileConten;
    }

    
    
}
