package com.mycompany.sie_proyecto;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JTextField;

import java.awt.CardLayout;
import java.awt.Color;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.LayoutStyle.ComponentPlacement;

import Functions.UsersSesions;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;

public class UseEmpresa extends JPanel {
    private JTextField txtNombre;
    private JTextField txtDescripcion;
    private JTextField txtCampo;
    private JTextField txtTelefono;
    private JTextField txtDireccion;
    private JTextField txtCorreoElectronico;
    private JTextField txtPaginaWeb;

    /**
     * Create the panel.
     */
    public UseEmpresa(JPanel cardPanel, UsersSesions userF) {
        setBackground(Color.WHITE);

        JPanel panelLateral = new JPanel();
        panelLateral.setBackground(Color.WHITE);

        JPanel panelAux = new JPanel();
        panelAux.setBackground(Color.WHITE);
        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(panelLateral, GroupLayout.PREFERRED_SIZE, 214, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(panelAux, GroupLayout.DEFAULT_SIZE, 1035, Short.MAX_VALUE)
                                .addContainerGap()));
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(Alignment.TRAILING, groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(panelAux, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 698,
                                                Short.MAX_VALUE)
                                        .addComponent(panelLateral, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 698,
                                                Short.MAX_VALUE))
                                .addContainerGap()));

        JLabel Titulo = new JLabel("");
        Titulo.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/DatosEmpresa.png")));
        Titulo.setBackground(Color.WHITE);

        JLabel lblNombre = new JLabel("Nombre:");
        lblNombre.setFont(new Font("Arial Black", Font.PLAIN, 17));
        txtNombre = new JTextField();
        txtNombre.setColumns(10);

        JLabel lblDescripcion = new JLabel("Descripcion:");
        lblDescripcion.setFont(new Font("Arial Black", Font.PLAIN, 17));
        txtDescripcion = new JTextField();
        txtDescripcion.setColumns(10);

        JLabel lblCampo = new JLabel("Campo:");
        lblCampo.setFont(new Font("Arial Black", Font.PLAIN, 17));
        txtCampo = new JTextField();
        txtCampo.setColumns(10);

        JLabel lblTelefono = new JLabel("Telefono:");
        lblTelefono.setFont(new Font("Arial Black", Font.PLAIN, 17));
        txtTelefono = new JTextField();
        txtTelefono.setColumns(10);

        JLabel lblDireccion = new JLabel("Direccion:");
        lblDireccion.setFont(new Font("Arial Black", Font.PLAIN, 17));
        txtDireccion = new JTextField();
        txtDireccion.setColumns(10);

        JLabel lblCorreoElectronico = new JLabel("CorreoElectronico:");
        lblCorreoElectronico.setFont(new Font("Arial Black", Font.PLAIN, 17));
        txtCorreoElectronico = new JTextField();
        txtCorreoElectronico.setColumns(10);

        JLabel lblPaginaWeb = new JLabel("PaginaWeb:");
        lblPaginaWeb.setFont(new Font("Arial Black", Font.PLAIN, 17));
        txtPaginaWeb = new JTextField();
        txtPaginaWeb.setColumns(10);

        JButton btnNewButton_1 = new JButton("");
        btnNewButton_1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // UPDATE

            }
        });
        btnNewButton_1.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/Update.png")));
        btnNewButton_1.setBackground(Color.WHITE);

        GroupLayout gl_panelAux = new GroupLayout(panelAux);
        gl_panelAux.setHorizontalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap(259, Short.MAX_VALUE)
                                .addComponent(Titulo, GroupLayout.PREFERRED_SIZE, 518, GroupLayout.PREFERRED_SIZE)
                                .addGap(258))
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addGap(233)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addComponent(lblNombre)
                                        .addComponent(lblDescripcion)
                                        .addComponent(lblCampo)
                                        .addComponent(lblTelefono)
                                        .addComponent(lblDireccion)
                                        .addComponent(lblCorreoElectronico)
                                        .addComponent(lblPaginaWeb))
                                .addGap(77)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(txtTelefono, GroupLayout.DEFAULT_SIZE, 386,
                                                                Short.MAX_VALUE)
                                                        .addComponent(txtCampo, GroupLayout.DEFAULT_SIZE, 386,
                                                                Short.MAX_VALUE)
                                                        .addComponent(txtDescripcion, GroupLayout.DEFAULT_SIZE, 386,
                                                                Short.MAX_VALUE)
                                                        .addComponent(txtNombre, GroupLayout.DEFAULT_SIZE, 386,
                                                                Short.MAX_VALUE)
                                                        .addComponent(txtDireccion, GroupLayout.DEFAULT_SIZE, 386,
                                                                Short.MAX_VALUE))
                                                .addContainerGap(210, GroupLayout.PREFERRED_SIZE))
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.TRAILING, false)
                                                        .addComponent(txtCorreoElectronico, Alignment.LEADING)
                                                        .addComponent(txtPaginaWeb, Alignment.LEADING,
                                                                GroupLayout.DEFAULT_SIZE, 386, Short.MAX_VALUE))
                                                .addContainerGap())))
                        .addGroup(Alignment.TRAILING, gl_panelAux.createSequentialGroup()
                                .addContainerGap(859, Short.MAX_VALUE)
                                .addComponent(btnNewButton_1, GroupLayout.PREFERRED_SIZE, 166,
                                        GroupLayout.PREFERRED_SIZE)
                                .addContainerGap()));
        gl_panelAux.setVerticalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(Titulo)
                                .addGap(56)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblNombre)
                                        .addComponent(txtNombre, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblDescripcion)
                                        .addComponent(txtDescripcion, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblCampo)
                                        .addComponent(txtCampo, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblTelefono)
                                        .addComponent(txtTelefono, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblDireccion)
                                        .addComponent(txtDireccion, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblCorreoElectronico)
                                        .addComponent(txtCorreoElectronico, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblPaginaWeb)
                                        .addComponent(txtPaginaWeb, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(97)
                                .addComponent(btnNewButton_1)
                                .addContainerGap(19, Short.MAX_VALUE)));
        panelAux.setLayout(gl_panelAux);

        JLabel LogoEgresados = new JLabel("");
        LogoEgresados.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/logo_egresados_unal.png")));
        LogoEgresados.setBackground(Color.WHITE);

        JButton btnBack = new JButton("");
        btnBack.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // goback
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                cl.show(cardPanel, "mainEmpresa");
            }
        });
        btnBack.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/botonBack.png")));
        btnBack.setBackground(Color.WHITE);

        JButton btnNewButton = new JButton("");
        btnNewButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                if (userF.logout())
                    cl.show(cardPanel, "mainPanel");
            }
        });
        btnNewButton.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/logout.png")));
        btnNewButton.setBackground(Color.WHITE);
        GroupLayout gl_panelLateral = new GroupLayout(panelLateral);
        gl_panelLateral.setHorizontalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelLateral.createParallelGroup(Alignment.LEADING)
                                        .addComponent(LogoEgresados)
                                        .addComponent(btnNewButton)
                                        .addComponent(btnBack))
                                .addContainerGap(33, Short.MAX_VALUE)));
        gl_panelLateral.setVerticalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(LogoEgresados)
                                .addGap(245)
                                .addComponent(btnBack)
                                .addPreferredGap(ComponentPlacement.RELATED, 316, Short.MAX_VALUE)
                                .addComponent(btnNewButton)
                                .addContainerGap()));
        panelLateral.setLayout(gl_panelLateral);
        setLayout(groupLayout);
    }
}
