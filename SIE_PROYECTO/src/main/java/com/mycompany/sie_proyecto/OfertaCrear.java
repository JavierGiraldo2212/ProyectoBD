package com.mycompany.sie_proyecto;

import java.awt.Color;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JTextField;

import Functions.UsersSesions;

import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import java.sql.CallableStatement;
import java.sql.Connection;

import Functions.UsersSesions;


public class OfertaCrear extends JPanel {


        private UsersSesions userF;

    /**
     * Create the panel.
     */
    public OfertaCrear(UsersSesions userSession) {
        this.userF = userSession; // Asignar la conexión pasada
  
        setBackground(Color.WHITE);

        JPanel panelAux = new JPanel();
        panelAux.setBackground(Color.WHITE);
        GroupLayout groupLayout = new GroupLayout(this);
        JLabel Titulo = new JLabel("");
        Titulo.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/ofertaLaboral.png")));
        Titulo.setBackground(Color.WHITE);

        // Create the form components
        JLabel lblEstado = new JLabel("Estado:");
        lblEstado.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtEstado = new JTextField();
        txtEstado.setColumns(20);

        JLabel lblSalario = new JLabel("Salario:");
        lblSalario.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtSalario = new JTextField();
        txtSalario.setColumns(20);

        JLabel lblExpRequerida = new JLabel("ExpRequerida:");
        lblExpRequerida.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtExpRequerida = new JTextField();
        txtExpRequerida.setColumns(20);

        JLabel lblArea = new JLabel("Area:");
        lblArea.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtArea = new JTextField();
        txtArea.setColumns(20);

        JLabel lblTipoContrato = new JLabel("TipoContrato:");
        lblTipoContrato.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtTipoContrato = new JTextField();
        txtTipoContrato.setColumns(20);

        JButton btnCreateOffer = new JButton("");
        btnCreateOffer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // CREAR OFERTA
                System.out.println("CREANDO OFERTA");
          

                // Obtener los valores de los campos de texto
                String NIT = userF.name;
                String estado = txtEstado.getText();
                String salario = txtSalario.getText();
                String expRequerida = txtExpRequerida.getText();
                String area = txtArea.getText();
                String tipoContrato = txtTipoContrato.getText();

                CallableStatement callableStatement = null;

                try {
                    // Preparar la llamada al procedimiento almacenado
                    String sql = "{CALL sp_ingresar_oferta(f_encontrar_NIT(?), ?, ?, ?, ?, ?)}";
                    callableStatement = userF.getConnection().prepareCall(sql);

                    // Establecer los parámetros del procedimiento
                    callableStatement.setString(1, NIT); // Reemplaza con el valor real de EMPRESA_NIT
                    callableStatement.setString(2, estado);
                    callableStatement.setInt(3, Integer.parseInt(salario));
                    callableStatement.setInt(4, Integer.parseInt(expRequerida));
                    callableStatement.setString(5, area);
                    callableStatement.setString(6, tipoContrato);

                    // Ejecutar el procedimiento almacenado
                    callableStatement.execute();

                    System.out.println("Oferta creada exitosamente.");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                } finally {
                    // Cerrar CallableStatement
                    try {
                        if (callableStatement != null) callableStatement.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
            }
        });
        btnCreateOffer.setIcon(new ImageIcon(OfertaCrear.class.getResource("/images/CREATE.png")));
        btnCreateOffer.setBackground(Color.WHITE);

        GroupLayout gl_panelAux = new GroupLayout(panelAux);
        gl_panelAux.setHorizontalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap(267, Short.MAX_VALUE)
                                .addComponent(Titulo, GroupLayout.PREFERRED_SIZE, 518, GroupLayout.PREFERRED_SIZE)
                                .addGap(258))
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addGap(237)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addComponent(lblEstado)
                                        .addComponent(lblSalario)
                                        .addComponent(lblExpRequerida)
                                        .addComponent(lblArea)
                                        .addComponent(lblTipoContrato))
                                .addGap(53)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addComponent(txtEstado, GroupLayout.DEFAULT_SIZE, 301, Short.MAX_VALUE)
                                        .addComponent(txtSalario)
                                        .addComponent(txtExpRequerida)
                                        .addComponent(txtArea)
                                        .addComponent(txtTipoContrato))
                                .addGap(319))
                        .addGroup(Alignment.TRAILING, gl_panelAux.createSequentialGroup()
                                .addContainerGap(947, Short.MAX_VALUE)
                                .addComponent(btnCreateOffer, GroupLayout.PREFERRED_SIZE, 164, GroupLayout.PREFERRED_SIZE)
                                .addGap(62)));
        gl_panelAux.setVerticalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(Titulo)
                                .addGap(42)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblEstado)
                                        .addComponent(txtEstado, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblSalario)
                                        .addComponent(txtSalario, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblExpRequerida)
                                        .addComponent(txtExpRequerida, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblArea)
                                        .addComponent(txtArea, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblTipoContrato)
                                        .addComponent(txtTipoContrato, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(184)
                                .addComponent(btnCreateOffer)
                                .addContainerGap(51, Short.MAX_VALUE)));
        panelAux.setLayout(gl_panelAux);

        GroupLayout layout = new GroupLayout(this);
        layout.setHorizontalGroup(
                layout.createParallelGroup(Alignment.LEADING)
                        .addComponent(panelAux, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE,
                                Short.MAX_VALUE));
        layout.setVerticalGroup(
                layout.createParallelGroup(Alignment.LEADING)
                        .addComponent(panelAux, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE,
                                Short.MAX_VALUE));
        this.setLayout(layout);
    }
}
