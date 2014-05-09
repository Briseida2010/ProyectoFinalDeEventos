/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Presentacion;
import Entidad.*;
import Negocio.*;
import java.awt.Component;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;



/**
 *
 * @author BEPIS
 */
public class FrmConsultaPonente extends javax.swing.JInternalFrame {

    
    ArrayList<clsEntidadPonente> listaPonentes;  
    clsEntidadPonente _objPonente;
    
    
    static ResultSet rs = null;
    DefaultTableModel dtm = new DefaultTableModel();
    
    /**
     * Creates new form FrmConsulOperaciones
     */
    public FrmConsultaPonente() {
        initComponents();
        
      
    }
   
   
    
    public void cargarTabla(String busqueda){
        listaPonentes = clsPonente.listarPonentes(busqueda);
        DefaultTableModel dtm = (DefaultTableModel)tblPonente.getModel();
        FrmMaster.limpiarTabla(tblPonente);
        for(clsEntidadPonente objPonente : listaPonentes){
            Object[] fila = new Object[6];
            fila[0] = objPonente.getIdPersona();
            fila[1] = objPonente.getNombres();
            fila[2] = objPonente.getApellidos();
            fila[3] = objPonente.getEmail();
            fila[4] = objPonente.getCelular();
            fila[5] = objPonente.getGradoAcademico();
            
            dtm.addRow(fila);
        }
        tblPonente.setModel(dtm);
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        btnGenerar = new javax.swing.JButton();
        btnCerrar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblPonente = new javax.swing.JTable();

        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setText("Consultar Ponente");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(302, 11, -1, -1));

        btnGenerar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/application_add.png"))); // NOI18N
        btnGenerar.setText("Generar");
        btnGenerar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGenerarActionPerformed(evt);
            }
        });
        getContentPane().add(btnGenerar, new org.netbeans.lib.awtextra.AbsoluteConstraints(251, 43, -1, -1));

        btnCerrar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/remove.png"))); // NOI18N
        btnCerrar.setText("Cerrar");
        btnCerrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCerrarActionPerformed(evt);
            }
        });
        getContentPane().add(btnCerrar, new org.netbeans.lib.awtextra.AbsoluteConstraints(368, 43, -1, -1));

        tblPonente.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "id", "Nombres", "Apellidos", "Email", "Celular", "Grado Academico"
            }
        ));
        jScrollPane1.setViewportView(tblPonente);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 104, 672, 110));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCerrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCerrarActionPerformed
       this.dispose();
    }//GEN-LAST:event_btnCerrarActionPerformed

    private void btnGenerarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGenerarActionPerformed
    cargarTabla("");
    }//GEN-LAST:event_btnGenerarActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCerrar;
    private javax.swing.JButton btnGenerar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblPonente;
    // End of variables declaration//GEN-END:variables
}
