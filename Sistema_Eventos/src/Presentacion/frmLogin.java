
package Presentacion;
import Negocio.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.sql.*;
/**
 *
 * @author BEPIS
 */
public class frmLogin extends javax.swing.JFrame {
    public String codigo, usu, pass;
    static Connection cnx = null;
    static ResultSet rs = null;
    DefaultTableModel dtm = new DefaultTableModel();
    /**
     * Creates new form frmLogin
     */
    public frmLogin() {
        this.setUndecorated(true);
        initComponents();
        this.setLocationRelativeTo(null);
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
        txtUsuario = new javax.swing.JTextField();
        txtPasword = new javax.swing.JPasswordField();
        btnAceptar = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        pnlForm.setBackground(new java.awt.Color(255, 255, 255));
        pnlForm.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        pnlForm.add(txtUsuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 50, 190, 40));
        pnlForm.add(txtPasword, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 100, 190, 40));

        getContentPane().add(pnlForm, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 90, 300, 180));

        btnAceptar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/button.png"))); // NOI18N
        btnAceptar.setText("Aceptar");
        btnAceptar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAceptarActionPerformed(evt);
            }
        });
        getContentPane().add(btnAceptar, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 310, 150, 50));

        btnCancelar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Iconos/minus-sign.png"))); // NOI18N
        btnCancelar.setText("Cancelar");
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });
        getContentPane().add(btnCancelar, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 310, 160, 50));

        jLabel3.setText("jLabel3");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 340, 370));

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void btnAceptarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAceptarActionPerformed
/*        usu  = txtUsuario.getText();
        pass = txtPasword.getText();
        
        clsUsuario usuario = new clsUsuario();
        try{
            rs = usuario.LoginUsuario(usu, pass);
            boolean existe = false;
            int f,i;
            f= dtm.getRowCount();
            if (f>0)
   pnlForm      for(i=0;i<f;i++); 
                       dtm.removeRow(0); 
                while(rs.next()){
                    if(usu.equals(rs.getString(2))&& pass.equals(rs.getString(3))){
                       if("Activo".equals(rs.getString(5))){
                        JOptionPane.showMessageDialog(null, "Bienvenido: "+
                                rs.getString(2)+" "+
                                "Nivel: "+ rs.getString(4));
                        
                        MDIPrincipal MDI = new MDIPrincipal();
                        MDI.show();
                        this.dispose();
                        MDI.usuario= rs.getString(2);
                        MDI.nivel = rs.getString(4);
                        MDI.estado = 1;
                    }else {
                       JOptionPane.showMessageDialog(null, "Usuario "+  rs.getString(2) +" DESACTIVADO, "
                               + "ponte en contacto con el Administrador");
                       txtUsuario.setText("");
                       txtPasword.setText("");
                       txtUsuario.getCursor();
                       }
                }
                    existe = true;
                    break;
                }
        
        
        }catch(Exception ex){
            ex.printStackTrace();
        }*/
         MDIPrincipal MDI = new MDIPrincipal();
                        MDI.show();
                        this.dispose();
    }//GEN-LAST:event_btnAceptarActionPerformed

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
         /*JOptionPane.showMessageDialog(this, mensaje, "Advertencia",JOptionPane.WARNING_MESSAGE);    
        
            if(JOptionPane.showConfirmDialog(this, mensaje, "Confirmar",JOptionPane.YES_NO_OPTION) == 0);
           */ this.dispose();
    }//GEN-LAST:event_btnCancelarActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(frmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frmLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new frmLogin().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAceptar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel pnlForm;
    private javax.swing.JPasswordField txtPasword;
    private javax.swing.JTextField txtUsuario;
    // End of variables declaration//GEN-END:variables
}
