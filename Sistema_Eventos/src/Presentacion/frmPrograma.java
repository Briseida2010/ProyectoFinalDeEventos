/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Presentacion;
import Entidad.*;
import Negocio.*;
import java.awt.Component;
import java.util.ArrayList;
import java.util.Iterator;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author Juan
 */
public class frmPrograma extends javax.swing.JInternalFrame implements IMantenimiento{

    ArrayList<clsEntidadPrograma> listaPrograma;  
    clsEntidadPrograma _objPrograma;
    boolean isNuevoActivo;
    
    public frmPrograma() {
        initComponents();
        cargarTabla("");
        FrmMaster.BloquearControles(pnlForm);
        FrmMaster.BloquearBotones(pnlForm, "Cancelar");
    }
    
    @Override
    public void cargarTabla(String busqueda){
        listaPrograma = clsPrograma.listarProgramas(busqueda);
        DefaultTableModel dtm = (DefaultTableModel)tblPrograma.getModel();
        FrmMaster.limpiarTabla(tblPrograma);
        for(clsEntidadPrograma objPrograma : listaPrograma){
            Object[] fila = new Object[15];
            fila[0] = objPrograma.getIdEvento();
            fila[1] = objPrograma.getIdPersona();
            fila[2] = objPrograma.getTema();
            fila[3] = objPrograma.getFechaInicio();
            fila[4] = objPrograma.getFechaFinal();
            dtm.addRow(fila);
        }
        tblPrograma.setModel(dtm);
    }
    
    @Override
    public void seleccionarTabla(){
        int fila = tblPrograma.getSelectedRow();
        if (fila==-1){
            JOptionPane.showMessageDialog(null, "Debes seleccionar una fila");
        }else{
            txtTema.setText(_objPrograma.getTema());
            txtFechainicio.setText(_objPrograma.getFechaInicio());
            txtFechafin.setText(_objPrograma.getFechaFinal());
        }
    }
    
    @Override
    public void guardar(){
        clsEntidadPrograma objPrograma = new clsEntidadPrograma();
        objPrograma.setTema(txtTema.getText());
        objPrograma.setFechaInicio(txtFechainicio.getText());
        objPrograma.setFechaFinal(txtFechafin.getText());
        clsPrograma.agregarPrograma(objPrograma);
        cargarTabla("");
    }
    
    @Override
    public void modificar() {
        clsEntidadPrograma objPrograma = new clsEntidadPrograma();
        objPrograma.setIdEvento(_objPrograma.getIdEvento());
        objPrograma.setIdPersona(_objPrograma.getIdPersona());
        objPrograma.setTema(txtTema.getText());
        objPrograma.setFechaInicio(txtFechainicio.getText());
        objPrograma.setFechaFinal(txtFechafin.getText());
        clsPrograma.modificarPrograma(objPrograma);
        cargarTabla("");
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pnlForm = new javax.swing.JPanel();
        jLabel11 = new javax.swing.JLabel();
        txtEvento = new javax.swing.JTextField();
        txtPersona = new javax.swing.JPasswordField();
        jLabel4 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txtTema = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        txtFechainicio = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        txtFechafin = new javax.swing.JTextField();
        pnlBotones = new javax.swing.JPanel();
        btnModificar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnNuevo = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblPrograma = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();

        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        pnlForm.setBackground(new java.awt.Color(255, 255, 255));
        pnlForm.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel11.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel11.setText("Nombre Evento :");
        pnlForm.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, -1, -1));
        pnlForm.add(txtEvento, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 10, 100, -1));
        pnlForm.add(txtPersona, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 40, 100, -1));

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel4.setText("Nombre Persona :");
        pnlForm.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 40, -1, -1));

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel9.setText("Tema :");
        pnlForm.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 70, -1, -1));
        pnlForm.add(txtTema, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 70, 100, -1));

        jLabel10.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel10.setText("Fecha de Inicio :");
        pnlForm.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 100, -1, -1));
        pnlForm.add(txtFechainicio, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 100, 100, -1));

        jLabel12.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel12.setText("Fecha de Culminacion :");
        pnlForm.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 130, -1, -1));
        pnlForm.add(txtFechafin, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 130, 100, -1));

        getContentPane().add(pnlForm, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 50, 320, 180));

        pnlBotones.setBackground(new java.awt.Color(255, 255, 255));

        btnModificar.setText("Modificar");
        btnModificar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnModificarActionPerformed(evt);
            }
        });

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        btnNuevo.setText("Nuevo");
        btnNuevo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNuevoActionPerformed(evt);
            }
        });

        btnCancelar.setText("Cancelar");
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });

        jButton6.setText("Salir");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout pnlBotonesLayout = new javax.swing.GroupLayout(pnlBotones);
        pnlBotones.setLayout(pnlBotonesLayout);
        pnlBotonesLayout.setHorizontalGroup(
            pnlBotonesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnlBotonesLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pnlBotonesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnModificar, javax.swing.GroupLayout.DEFAULT_SIZE, 90, Short.MAX_VALUE)
                    .addComponent(btnCancelar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnGuardar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnNuevo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        pnlBotonesLayout.setVerticalGroup(
            pnlBotonesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pnlBotonesLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnNuevo)
                .addGap(5, 5, 5)
                .addComponent(btnGuardar)
                .addGap(15, 15, 15)
                .addComponent(btnModificar)
                .addGap(10, 10, 10)
                .addComponent(btnCancelar)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton6)
                .addGap(40, 40, 40))
        );

        getContentPane().add(pnlBotones, new org.netbeans.lib.awtextra.AbsoluteConstraints(400, 60, -1, 190));

        jLabel1.setText("Mantenimiento de Programa");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 10, 189, -1));

        tblPrograma.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "idEvento", "idPersona", "Tema", "Fecha de Inicio", "Fecha de Culminacion"
            }
        ));
        tblPrograma.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblProgramaMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblPrograma);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 280, 500, 180));

        jLabel2.setIcon(new javax.swing.ImageIcon("F:\\ProyectoFinal_EventoV4\\Sistema_Eventos\\src\\img\\fondobriseida.png")); // NOI18N
        jLabel2.setText("jLabel2");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 600, 480));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnModificarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnModificarActionPerformed
        if(tblPrograma.getSelectedRow()>0){
            isNuevoActivo=false;
            FrmMaster.HabilitarControles(pnlForm);
            FrmMaster.BloquearBotones(pnlBotones, "Modificar");
        }else{
            JOptionPane.showMessageDialog(null, "Seleccione un registro!");
        }

    }//GEN-LAST:event_btnModificarActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        if(isNuevoActivo){
            guardar();
        }else{
            modificar();
        }
        FrmMaster.BloquearBotones(pnlBotones, "Guardar");
        FrmMaster.LimpiarCampos(pnlForm);
        FrmMaster.BloquearControles(pnlForm);
    }//GEN-LAST:event_btnGuardarActionPerformed

    private void btnNuevoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNuevoActionPerformed
        isNuevoActivo=true;
        FrmMaster.HabilitarControles(pnlForm);
        FrmMaster.LimpiarCampos(pnlForm);
        FrmMaster.BloquearBotones(pnlBotones, "Nuevo");
    }//GEN-LAST:event_btnNuevoActionPerformed

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        FrmMaster.BloquearBotones(pnlBotones, "Cancelar");
        FrmMaster.LimpiarCampos(pnlForm);
        FrmMaster.BloquearControles(pnlForm);
    }//GEN-LAST:event_btnCancelarActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        this.dispose();
    }//GEN-LAST:event_jButton6ActionPerformed

    private void tblProgramaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblProgramaMouseClicked
        seleccionarTabla();
    }//GEN-LAST:event_tblProgramaMouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnModificar;
    private javax.swing.JButton btnNuevo;
    private javax.swing.JButton jButton6;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JPanel pnlBotones;
    private javax.swing.JPanel pnlForm;
    private javax.swing.JTable tblPrograma;
    private javax.swing.JTextField txtEvento;
    private javax.swing.JTextField txtFechafin;
    private javax.swing.JTextField txtFechainicio;
    private javax.swing.JPasswordField txtPersona;
    private javax.swing.JTextField txtTema;
    // End of variables declaration//GEN-END:variables
}