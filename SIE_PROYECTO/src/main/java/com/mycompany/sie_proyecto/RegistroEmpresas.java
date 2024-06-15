package com.mycompany.sie_proyecto;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JButton;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.SwingConstants;
import javax.swing.ImageIcon;
import javax.swing.JPasswordField;

public class RegistroEmpresas extends JPanel {

    private JTextField cedulaField;
    private JTextField nombresField;
    private JTextField primerApellidoField;
    private JTextField segundoApellidoField;
    private JTextField cargoField;
    private JTextField correoField;
    private JTextField telefonoField;
    private JTextField nitField;
    private JTextField descripcionField;
    private JTextField campoField;
    private JTextField telefonoEmpresaField;
    private JTextField direccionField;
    private JTextField correoElectronicoField;
    private JTextField paginaWebField;
    private JTextField userField;
    private JPasswordField passwordField;

    public RegistroEmpresas() {
        setBackground(Color.WHITE);

        JPanel panelIzq = new JPanel();
        panelIzq.setBackground(new Color(223, 230, 255));

        JPanel panelDer = new JPanel();
        panelDer.setBackground(new Color(202, 254, 194));

        JPanel panel = new JPanel();
        panel.setBackground(new Color(255, 204, 204));

        JLabel cedulaLabel = new JLabel("Cédula:");
        cedulaLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel nombresLabel = new JLabel("Nombres:");
        nombresLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel primerApellidoLabel = new JLabel("Primer Apellido:");
        primerApellidoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel segundoApellidoLabel = new JLabel("Segundo Apellido:");
        segundoApellidoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel cargoLabel = new JLabel("Cargo:");
        cargoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel correoLabel = new JLabel("Correo:");
        correoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel telefonoLabel = new JLabel("Teléfono:");
        telefonoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        cedulaField = new JTextField();
        cedulaField.setColumns(10);

        nombresField = new JTextField();
        nombresField.setColumns(10);

        primerApellidoField = new JTextField();
        primerApellidoField.setColumns(10);

        segundoApellidoField = new JTextField();
        segundoApellidoField.setColumns(10);

        cargoField = new JTextField();
        cargoField.setColumns(10);

        correoField = new JTextField();
        correoField.setColumns(10);

        telefonoField = new JTextField();
        telefonoField.setColumns(10);

        JLabel lblSub1 = new JLabel("INFORMACIÓN REPRESENTANTE");
        lblSub1.setFont(new Font("Arial", Font.BOLD, 20));
        lblSub1.setHorizontalAlignment(SwingConstants.CENTER);

        GroupLayout gl_panelIzq = new GroupLayout(panelIzq);
        gl_panelIzq.setHorizontalGroup(
                gl_panelIzq.createParallelGroup(Alignment.TRAILING)
                        .addGroup(gl_panelIzq.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.LEADING)
                                        .addComponent(cedulaLabel)
                                        .addComponent(nombresLabel)
                                        .addComponent(primerApellidoLabel)
                                        .addComponent(segundoApellidoLabel)
                                        .addComponent(cargoLabel)
                                        .addComponent(correoLabel)
                                        .addComponent(telefonoLabel))
                                .addGap(18)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.LEADING)
                                        .addComponent(cedulaField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(nombresField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(primerApellidoField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(segundoApellidoField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(cargoField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(correoField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(telefonoField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE))
                                .addContainerGap(32, Short.MAX_VALUE))
                        .addComponent(lblSub1, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 460, Short.MAX_VALUE));
        gl_panelIzq.setVerticalGroup(
                gl_panelIzq.createParallelGroup(Alignment.LEADING)
                        .addGroup(Alignment.TRAILING, gl_panelIzq.createSequentialGroup()
                                .addComponent(lblSub1, GroupLayout.PREFERRED_SIZE, 51, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.RELATED, 18, Short.MAX_VALUE)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(cedulaLabel)
                                        .addComponent(cedulaField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(nombresLabel)
                                        .addComponent(nombresField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(primerApellidoLabel)
                                        .addComponent(primerApellidoField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(segundoApellidoLabel)
                                        .addComponent(segundoApellidoField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(cargoLabel)
                                        .addComponent(cargoField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(correoLabel)
                                        .addComponent(correoField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(telefonoLabel)
                                        .addComponent(telefonoField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(56)));
        panelIzq.setLayout(gl_panelIzq);

        JLabel nitLabel = new JLabel("NIT:");
        nitLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel descripcionLabel = new JLabel("Descripción:");
        descripcionLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel campoLabel = new JLabel("Campo:");
        campoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel telefonoEmpresaLabel = new JLabel("Teléfono:");
        telefonoEmpresaLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel direccionLabel = new JLabel("Dirección:");
        direccionLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel correoElectronicoLabel = new JLabel("Correo Electrónico:");
        correoElectronicoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel paginaWebLabel = new JLabel("Página Web:");
        paginaWebLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        nitField = new JTextField();
        nitField.setColumns(10);

        descripcionField = new JTextField();
        descripcionField.setColumns(10);

        campoField = new JTextField();
        campoField.setColumns(10);

        telefonoEmpresaField = new JTextField();
        telefonoEmpresaField.setColumns(10);

        direccionField = new JTextField();
        direccionField.setColumns(10);

        correoElectronicoField = new JTextField();
        correoElectronicoField.setColumns(10);

        paginaWebField = new JTextField();
        paginaWebField.setColumns(10);

        JLabel lblSub2 = new JLabel("INFORMACIÓN EMPRESA");
        lblSub2.setHorizontalAlignment(SwingConstants.CENTER);
        lblSub2.setFont(new Font("Arial", Font.BOLD, 20));

        GroupLayout gl_panelDer = new GroupLayout(panelDer);
        gl_panelDer.setHorizontalGroup(
                gl_panelDer.createParallelGroup(Alignment.TRAILING)
                        .addGroup(Alignment.LEADING, gl_panelDer.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                        .addComponent(nitLabel)
                                        .addComponent(descripcionLabel)
                                        .addComponent(campoLabel)
                                        .addComponent(telefonoEmpresaLabel)
                                        .addComponent(direccionLabel)
                                        .addComponent(correoElectronicoLabel)
                                        .addComponent(paginaWebLabel))
                                .addGap(18)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                        .addComponent(nitField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(descripcionField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(campoField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(telefonoEmpresaField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(direccionField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(correoElectronicoField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(paginaWebField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE))
                                .addContainerGap(35, Short.MAX_VALUE))
                        .addGroup(gl_panelDer.createSequentialGroup()
                                .addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(lblSub2, GroupLayout.PREFERRED_SIZE, 460, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap()));
        gl_panelDer.setVerticalGroup(
                gl_panelDer.createParallelGroup(Alignment.LEADING)
                        .addGroup(Alignment.TRAILING, gl_panelDer.createSequentialGroup()
                                .addComponent(lblSub2, GroupLayout.PREFERRED_SIZE, 51, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.RELATED, 14, Short.MAX_VALUE)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(nitLabel)
                                        .addComponent(nitField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(descripcionLabel)
                                        .addComponent(descripcionField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(campoLabel)
                                        .addComponent(campoField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(telefonoEmpresaLabel)
                                        .addComponent(telefonoEmpresaField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(direccionLabel)
                                        .addComponent(direccionField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(correoElectronicoLabel)
                                        .addComponent(correoElectronicoField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(paginaWebLabel)
                                        .addComponent(paginaWebField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(60)));
        panelDer.setLayout(gl_panelDer);

        JPanel panel_Titulo = new JPanel();
        panel_Titulo.setBackground(Color.WHITE);
        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addGap(69)
                                .addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(panel, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 964,
                                                Short.MAX_VALUE)
                                        .addGroup(Alignment.LEADING, groupLayout
                                                .createParallelGroup(Alignment.LEADING, false)
                                                .addComponent(panel_Titulo, Alignment.TRAILING,
                                                        GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE,
                                                        Short.MAX_VALUE)
                                                .addGroup(groupLayout.createSequentialGroup()
                                                        .addComponent(panelIzq, GroupLayout.PREFERRED_SIZE,
                                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                                        .addGap(44)
                                                        .addComponent(panelDer, GroupLayout.PREFERRED_SIZE, 470,
                                                                GroupLayout.PREFERRED_SIZE))))
                                .addContainerGap(83, Short.MAX_VALUE)));
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(Alignment.TRAILING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addComponent(panel_Titulo, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                        GroupLayout.PREFERRED_SIZE)
                                .addGap(18)
                                .addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(panelDer, GroupLayout.DEFAULT_SIZE, 349, Short.MAX_VALUE)
                                        .addComponent(panelIzq, GroupLayout.DEFAULT_SIZE, 349, Short.MAX_VALUE))
                                .addGap(40)
                                .addComponent(panel, GroupLayout.PREFERRED_SIZE, 143, GroupLayout.PREFERRED_SIZE)
                                .addGap(24)));

        JButton btnRegEm = new JButton("");
        btnRegEm.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

            }
        });
        btnRegEm.setIcon(new ImageIcon(RegistroEmpresas.class.getResource("/images/BotonRegEm.png")));

        JLabel lblUsuario = new JLabel("Usuario:");
        lblUsuario.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel lblContrasea = new JLabel("Contraseña");
        lblContrasea.setFont(new Font("Arial", Font.PLAIN, 14));

        userField = new JTextField();
        userField.setColumns(10);

        passwordField = new JPasswordField();
        GroupLayout gl_panel = new GroupLayout(panel);
        gl_panel.setHorizontalGroup(
                gl_panel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel.createSequentialGroup()
                                .addGap(21)
                                .addComponent(btnRegEm, GroupLayout.PREFERRED_SIZE, 309, GroupLayout.PREFERRED_SIZE)
                                .addGap(18)
                                .addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
                                        .addComponent(lblUsuario, GroupLayout.PREFERRED_SIZE, 87,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(lblContrasea, GroupLayout.PREFERRED_SIZE, 78,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(53)
                                .addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
                                        .addComponent(passwordField)
                                        .addComponent(userField, GroupLayout.PREFERRED_SIZE, 285,
                                                GroupLayout.PREFERRED_SIZE))
                                .addContainerGap(301, Short.MAX_VALUE)));
        gl_panel.setVerticalGroup(
                gl_panel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(btnRegEm))
                        .addGroup(gl_panel.createSequentialGroup()
                                .addGap(43)
                                .addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
                                        .addComponent(userField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addGroup(gl_panel.createSequentialGroup()
                                                .addGap(1)
                                                .addComponent(lblUsuario, GroupLayout.PREFERRED_SIZE, 17,
                                                        GroupLayout.PREFERRED_SIZE)))
                                .addGroup(gl_panel.createParallelGroup(Alignment.LEADING, false)
                                        .addGroup(gl_panel.createSequentialGroup()
                                                .addGap(15)
                                                .addComponent(lblContrasea, GroupLayout.PREFERRED_SIZE, 17,
                                                        GroupLayout.PREFERRED_SIZE))
                                        .addGroup(gl_panel.createSequentialGroup()
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addComponent(passwordField)))));
        panel.setLayout(gl_panel);

        JLabel lblTitulo = new JLabel("REGISTRAR NUEVA EMPRESA");
        lblTitulo.setFont(new Font("Arial Black", Font.BOLD, 34));
        panel_Titulo.add(lblTitulo);
        setLayout(groupLayout);
    }
}
