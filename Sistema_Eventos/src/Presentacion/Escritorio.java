/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Presentacion;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JDesktopPane;
 
/**
 *
 * @author Administrador
 */
public class Escritorio extends JDesktopPane{
 
       private  Image IMG=new ImageIcon(getClass().getResource("/img/semcoplogo.png")).getImage();
 
        public void paintChildren(Graphics g){
            g.drawImage(IMG, 0, 0, getWidth(), getHeight(), this);
            super.paintChildren(g);
        }
    }

