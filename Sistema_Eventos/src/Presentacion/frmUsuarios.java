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

public class frmUsuarios extends javax.swing.JInternalFrame implements IMantenimiento {

    ArrayList<clsEntidadUsuario> listaUsuarios;  
    clsEntidadUsuario _objUsuario;
    boolean isNuevoActivo;
    
    public frmUsuarios() {
        initComponents();
        cargarTabla("");
        FrmMaster.BloquearControles(pnlForm);
        FrmMaster.BloquearBotones(pnlForm, "Cancelar");
    }
            
    @Override
    public void cargarTabla(String busqueda){
        listaUsuarios = clsUsuario.listarUsuarios(busqueda);
        DefaultTableModel dtm = (DefaultTableModel)tblUsuario.getModel();
        FrmMaster.limpiarTabla(tblUsuario);
        for(clsEntidadUsuario objUsuario : listaUsuarios){
            Object[] fila = new Object[15];
            fila[0] = objUsuario.getIdPersona();
            fila[1] = objUsuario.getNombres();
            fila[2] = objUsuario.getApellidos();
            fila[3] = objUsuario.getEmail();
            fila[4] = objUsuario.getUsuario();
            fila[5] = objUsuario.getPassword();
            fila[6] = objUsuario.getIndicadorInscripcion();
            fila[7] = objUsuario.getIndicadorEvento();
            fila[8] = objUsuario.getIndicadorGasto();
            fila[9] = objUsuario.getIndicadorPrograma();
            fila[10] = objUsuario.getIndicadorUsuario();
            fila[11] = objUsuario.getIndicadorActivo();
            dtm.addRow(fila);
        }
        tblUsuario.setModel(dtm);
    }
    
    @Override
    public void seleccionarTabla(){
        int fila = tblUsuario.getSelectedRow();
        if (fila==-1){
            JOptionPane.showMessageDialog(null, "Debes seleccionar una fila");
        }else{
            _objUsuario = listaUsuarios.get(fila);
            txtUsuario.setText(_objUsuario.getUsuario());
            txtPassword.setText(_objUsuario.getPassword());
            txtNombre.setText(_objUsuario.getNombres());
            txtApellidos.setText(_objUsuario.getApellidos());
            FrmMaster.cambiarEstadoCheckBox(chkActivo, _objUsuario.getIndicadorActivo());
            FrmMaster.cambiarEstadoCheckBox(chkEvento, _objUsuario.getIndicadorEvento());
            FrmMaster.cambiarEstadoCheckBox(chkInscripcion, _objUsuario.getIndicadorInscripcion());
            FrmMaster.cambiarEstadoCheckBox(chkGasto, _objUsuario.getIndicadorGasto());
            FrmMaster.cambiarEstadoCheckBox(chkPrograma, _objUsuario.getIndicadorPrograma());
            FrmMaster.cambiarEstadoCheckBox(chkComision, _objUsuario.getIndicadorComision());
            FrmMaster.cambiarEstadoCheckBox(chkUsuario, _objUsuario.getUsuario());
        }
    }
    
    @Override
    public void guardar(){
        clsEntidadUsuario objUsuario = new clsEntidadUsuario();
        objUsuario.setNombres(txtNombre.getText());
        objUsuario.setApellidos(txtApellidos.getText());
        objUsuario.setUsuario(txtUsuario.getText());
        objUsuario.setPassword(txtPassword.getText());
        objUsuario.setIndicadorActivo(FrmMaster.getIndicadorCheckBox(chkActivo));
        objUsuario.setIndicadorComision(FrmMaster.getIndicadorCheckBox(chkComision));
        objUsuario.setIndicadorEvento(FrmMaster.getIndicadorCheckBox(chkEvento));
        objUsuario.setIndicadorGasto(FrmMaster.getIndicadorCheckBox(chkGasto));
        objUsuario.setIndicadorInscripcion(FrmMaster.getIndicadorCheckBox(chkInscripcion));
        objUsuario.setIndicadorPrograma(FrmMaster.getIndicadorCheckBox(chkPrograma));
        objUsuario.setIndicadorUsuario(FrmMaster.getIndicadorCheckBox(chkUsuario));
        clsUsuario.agregarUsuario(objUsuario);
        cargarTabla("");
    }
    
    @Override
    public void modificar() {
        clsEntidadUsuario objUsuario = new clsEntidadUsuario();
        objUsuario.setIdPersona(_objUsuario.getIdPersona());
        objUsuario.setNombres(txtNombre.getText());
        objUsuario.setApellidos(txtApellidos.getText());
        objUsuario.setUsuario(txtUsuario.getText());
        objUsuario.setPassword(txtPassword.getText());
        objUsuario.setIndicadorActivo(FrmMaster.getIndicadorCheckBox(chkActivo));
        objUsuario.setIndicadorComision(FrmMaster.getIndicadorCheckBox(chkComision));
        objUsuario.setIndicadorEvento(FrmMaster.getIndicadorCheckBox(chkEvento));
        objUsuario.setIndicadorGasto(FrmMaster.getIndicadorCheckBox(chkGasto));
        objUsuario.setIndicadorInscripcion(FrmMaster.getIndicadorCheckBox(chkInscripcion));
        objUsuario.setIndicadorPrograma(FrmMaster.getIndicadorCheckBox(chkPrograma));
        objUsuario.setIndicadorUsuario(FrmMaster.getIndicadorCheckBox(chkUsuario));
        clsUsuario.modificarUsuario(objUsuario);
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

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblUsuario = new javax.swing.JTable();
        pnlForm = new javax.swing.JPanel();
        jLabel11 = new javax.swing.JLabel();
        txtUsuario = new javax.swing.JTextField();
        txtPassword = new javax.swing.JPasswordField();
        jLabel4 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txtNombre = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        chkActivo = new javax.swing.JCheckBox();
        chkGasto = new javax.swing.JCheckBox();
        chkInscripcion = new javax.swing.JCheckBox();
        chkEvento = new javax.swing.JCheckBox();
        jLabel7 = new javax.swing.JLabel();
        chkPrograma = new javax.swing.JCheckBox();
        chkComision = new javax.swing.JCheckBox();
        chkUsuario = new javax.swing.JCheckBox();
        txtApellidos = new javax.swing.JTextField();
        pnlBotones = new javax.swing.JPanel();
        btnModificar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnNuevo = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();

        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel1.setText("Mantenimiento de Usuarios");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 10, -1, -1));

        tblUsuario.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "idPersona", "Nombre", "Apellidos", "Email", "Usuario", "Password", "Inscripcion", "Evento", "Gasto", "Programa", "Usuario", "Activo"
            }
        ));
        tblUsuario.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        tblUsuario.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblUsuarioMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblUsuario);
        tblUsuario.getColumnModel().getSelectionModel().setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        if (tblUsuario.getColumnModel().getColumnCount() > 0) {
            tblUsuario.getColumnModel().getColumn(0).setMinWidth(0);
            tblUsuario.getColumnModel().getColumn(0).setMaxWidth(0);
            tblUsuario.getColumnModel().getColumn(5).setMinWidth(0);
            tblUsuario.getColumnModel().getColumn(5).setMaxWidth(0);
            tblUsuario.getColumnModel().getColumn(6).setMinWidth(0);
            tblUsuario.getColumnModel().getColumn(6).setMaxWidth(0);
            tblUsuario.getColumnModel().getColumn(7).setMinWidth(0);
            tblUsuario.getColumnModel().getColumn(7).setMaxWidth(0);
            tblUsuario.getColumnModel().getColumn(8).setMinWidth(0);
            tblUsuario.getColumnModel().getColumn(8).setMaxWidth(0);
            tblUsuario.getColumnModel().getColumn(9).setMinWidth(0);
            tblUsuario.getColumnModel().getColumn(9).setMaxWidth(0);
            tblUsuario.getColumnModel().getColumn(10).setMinWidth(0);
            tblUsuario.getColumnModel().getColumn(10).setMaxWidth(0);
            tblUsuario.getColumnModel().getColumn(11).setMinWidth(0);
            tblUsuario.getColumnModel().getColumn(11).setMaxWidth(0);
        }

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 300, 500, 180));

        pnlForm.setBackground(new java.awt.Color(255, 255, 255));
        pnlForm.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel11.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel11.setText("Usuario:");
        pnlForm.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 10, -1, -1));
        pnlForm.add(txtUsuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 10, 100, -1));
        pnlForm.add(txtPassword, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 50, 100, -1));

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel4.setText("Password:");
        pnlForm.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 50, -1, -1));

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel9.setText("Nombre:");
        pnlForm.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 90, -1, -1));
        pnlForm.add(txtNombre, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 90, 100, -1));

        jLabel10.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel10.setText("Apellidos:");
        pnlForm.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 120, -1, -1));

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel8.setText("Estado:");
        pnlForm.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 170, -1, -1));

        chkActivo.setText("Activo");
        pnlForm.add(chkActivo, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 170, -1, -1));

        chkGasto.setText("Gasto");
        pnlForm.add(chkGasto, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 100, 80, -1));

        chkInscripcion.setText("Inscripcion");
        pnlForm.add(chkInscripcion, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 70, 80, -1));

        chkEvento.setText("Evento");
        pnlForm.add(chkEvento, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 40, 80, -1));

        jLabel7.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel7.setText("Permisos:");
        pnlForm.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 10, -1, -1));

        chkPrograma.setText("Programa");
        pnlForm.add(chkPrograma, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 130, 80, -1));

        chkComision.setText("Comision");
        pnlForm.add(chkComision, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 160, 80, -1));

        chkUsuario.setText("Usuario");
        pnlForm.add(chkUsuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 190, 80, -1));
        pnlForm.add(txtApellidos, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 130, 100, -1));

        getContentPane().add(pnlForm, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 330, 220));

        pnlBotones.setBackground(new java.awt.Color(255, 255, 255));
        pnlBotones.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnModificar.setText("Modificar");
        btnModificar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnModificarActionPerformed(evt);
            }
        });
        pnlBotones.add(btnModificar, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 100, 90, -1));

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });
        pnlBotones.add(btnGuardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 60, 90, -1));

        btnNuevo.setText("Nuevo");
        btnNuevo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNuevoActionPerformed(evt);
            }
        });
        pnlBotones.add(btnNuevo, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 24, 90, -1));

        btnCancelar.setText("Cancelar");
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });
        pnlBotones.add(btnCancelar, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 130, 90, -1));

        jButton6.setText("Salir");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });
        pnlBotones.add(jButton6, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 169, 90, -1));

        getContentPane().add(pnlBotones, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 60, 110, 210));

        jLabel2.setIcon(new javax.swing.ImageIcon("F:\\ProyectoFinal_EventoV4\\Sistema_Eventos\\src\\img\\fondobriseida.png")); // NOI18N
        jLabel2.setText("jLabel2");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 610, 500));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tblUsuarioMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblUsuarioMouseClicked
        seleccionarTabla();
    }//GEN-LAST:event_tblUsuarioMouseClicked

    private void btnNuevoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNuevoActionPerformed
      isNuevoActivo=true;
      FrmMaster.HabilitarControles(pnlForm);
      FrmMaster.LimpiarCampos(pnlForm);
      FrmMaster.BloquearBotones(pnlBotones, "Nuevo");
    }//GEN-LAST:event_btnNuevoActionPerformed

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

    private void btnModificarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnModificarActionPerformed
        if(tblUsuario.getSelectedRow()>0){
           isNuevoActivo=false;
            FrmMaster.HabilitarControles(pnlForm);
            FrmMaster.BloquearBotones(pnlBotones, "Modificar"); 
        }else{
            JOptionPane.showMessageDialog(null, "Seleccione un registro!");
        }
        
    }//GEN-LAST:event_btnModificarActionPerformed

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        FrmMaster.BloquearBotones(pnlBotones, "Cancelar");
        FrmMaster.LimpiarCampos(pnlForm);
        FrmMaster.BloquearControles(pnlForm);
    }//GEN-LAST:event_btnCancelarActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        this.dispose();
    }//GEN-LAST:event_jButton6ActionPerformed



    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnModificar;
    private javax.swing.JButton btnNuevo;
    private javax.swing.JCheckBox chkActivo;
    private javax.swing.JCheckBox chkComision;
    private javax.swing.JCheckBox chkEvento;
    private javax.swing.JCheckBox chkGasto;
    private javax.swing.JCheckBox chkInscripcion;
    private javax.swing.JCheckBox chkPrograma;
    private javax.swing.JCheckBox chkUsuario;
    private javax.swing.JButton jButton6;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JPanel pnlBotones;
    private javax.swing.JPanel pnlForm;
    private javax.swing.JTable tblUsuario;
    private javax.swing.JTextField txtApellidos;
    private javax.swing.JTextField txtNombre;
    private javax.swing.JPasswordField txtPassword;
    private javax.swing.JTextField txtUsuario;
    // End of variables declaration//GEN-END:variables

    

    

    


}
