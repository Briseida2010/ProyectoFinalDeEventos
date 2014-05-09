/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Presentacion;

import java.awt.Component;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;



public class FrmMaster {
    public static void LimpiarCampos(JPanel pnlForm){
        for(Component c : pnlForm.getComponents()){
            if(c instanceof JTextField){
                JTextField txt = (JTextField)c;
                txt.setText("");
            }
            else if(c instanceof JCheckBox){
                JCheckBox chk = (JCheckBox)c;
                chk.setSelected(false);
            }
        }
    }
    
    public static void BloquearBotones(JPanel pnlForm,String evento){
        switch(evento){
            case "Nuevo" : EventoNuevo(pnlForm);break;
            case "Guardar" : EventoGuardar(pnlForm);break;
            case "Modificar" : EventoModificar(pnlForm);break;
            case "Cancelar" : EventoCancelar(pnlForm);break;
        }
    }
    
    private static void EventoNuevo(JPanel pnlForm){
        for(Component c : pnlForm.getComponents()){
            if(c instanceof JButton){
                JButton btn = (JButton)c;
                if(btn.getText().equals("Nuevo")){
                    btn.setEnabled(false);
                }
                else if(btn.getText().equals("Guardar")){
                    btn.setEnabled(true);
                }
                else if(btn.getText().equals("Cancelar")){
                    btn.setEnabled(true);
                }
                else if(btn.getText().equals("Modificar")){
                    btn.setEnabled(false);
                }                
            }           
        }
    }
    
    private static void EventoGuardar(JPanel pnlForm){
        for(Component c : pnlForm.getComponents()){
            if(c instanceof JButton){
                JButton btn = (JButton)c;
                if(btn.getText().equals("Nuevo")){
                    btn.setEnabled(true);
                }
                else if(btn.getText().equals("Guardar")){
                    btn.setEnabled(false);
                }
                else if(btn.getText().equals("Cancelar")){
                    btn.setEnabled(false);
                }
                else if(btn.getText().equals("Modificar")){
                    btn.setEnabled(true);
                }                
            }           
        }
    }
    
    private static void EventoModificar(JPanel pnlForm){
        for(Component c : pnlForm.getComponents()){
            if(c instanceof JButton){
                JButton btn = (JButton)c;
                if(btn.getText().equals("Nuevo")){
                    btn.setEnabled(false);
                }
                else if(btn.getText().equals("Guardar")){
                    btn.setEnabled(true);
                }
                else if(btn.getText().equals("Cancelar")){
                    btn.setEnabled(true);
                }
                else if(btn.getText().equals("Modificar")){
                    btn.setEnabled(false);
                }                
            }                 
        }
    }
    
    private static void EventoCancelar(JPanel pnlForm){
        for(Component c : pnlForm.getComponents()){
            if(c instanceof JButton){
                JButton btn = (JButton)c;
                if(btn.getText().equals("Nuevo")){
                    btn.setEnabled(true);
                }
                else if(btn.getText().equals("Guardar")){
                    btn.setEnabled(false);
                }
                else if(btn.getText().equals("Cancelar")){
                    btn.setEnabled(false);
                }
                else if(btn.getText().equals("Modificar")){
                    btn.setEnabled(true);
                }                
            }                 
        }
    }
    
    public static void cambiarEstadoCheckBox(JCheckBox chkbox,String condicion){
        if(condicion.equals("S")){
            chkbox.setSelected(true);
        }else{
            chkbox.setSelected(false);
        }
    }
    
    public static String getIndicadorCheckBox(JCheckBox chkbox){
        if(chkbox.isSelected()){
            return "S";
        }
        return "N";
    }
    
    public static void limpiarTabla(JTable tabla){
        DefaultTableModel dtm = (DefaultTableModel)tabla.getModel();
        while(dtm.getRowCount()>0){
            dtm.removeRow(0);
        }
    }
    
    public static void BloquearControles(JPanel pnlControles){
        for(Component c : pnlControles.getComponents()){
            if(c instanceof JTextField){
                JTextField txt = (JTextField)c;
                txt.setEnabled(false);
            }
            else if(c instanceof JCheckBox){
                JCheckBox chk = (JCheckBox)c;
                chk.setEnabled(false);
            }
        }
    }
    
    public static void HabilitarControles(JPanel pnlControles){
        for(Component c : pnlControles.getComponents()){
            if(c instanceof JTextField){
                JTextField txt = (JTextField)c;
                txt.setEnabled(true);
            }
            else if(c instanceof JCheckBox){
                JCheckBox chk = (JCheckBox)c;
                chk.setEnabled(true);
            }
        }
    }
}
