package com.mycompany.sie_proyecto;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JScrollPane;
import javax.swing.SwingConstants;

import Functions.UsersSesions;

import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JTextField;
import java.awt.Choice;
import java.awt.List;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import javax.swing.JPasswordField;
import java.sql.CallableStatement;

public class RegistroEgresados extends JPanel {

    private JTextField cedulaField;
    private JTextField facultadField;
    private JTextField fechaNacimientoField;
    private JTextField nombreField;
    private JTextField primerApellidoField;
    private JTextField segundoApellidoField;
    private JTextField direccionField;
    private JTextField ciudadField;
    private JTextField paisField;
    private JTextField correoElectronicoField;
    private JTextField generoField;
    private JTextField grupoEtnicoField;
    private JTextField textField;
    private JPasswordField passwordField;
    private UsersSesions userF;

    /**
     * Create the panel.
     */
    public RegistroEgresados(UsersSesions userSession) {
        this.userF = userSession;
        setBackground(Color.WHITE);

        JPanel panelIzq = new JPanel();
        panelIzq.setBackground(new Color(202, 254, 194));

        JPanel panelDer = new JPanel();
        panelDer.setBackground(new Color(223, 230, 255));

        JPanel panel = new JPanel();
        panel.setBackground(new Color(255, 204, 204));

        JPanel panel_Titulo = new JPanel();
        panel_Titulo.setBackground(Color.WHITE);

        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.TRAILING)
                        .addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
                                .addGap(67)
                                .addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
                                        .addGroup(groupLayout.createSequentialGroup()
                                                .addComponent(panel, GroupLayout.DEFAULT_SIZE, 893, Short.MAX_VALUE)
                                                .addContainerGap())
                                        .addGroup(groupLayout.createSequentialGroup()
                                                .addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
                                                        .addComponent(panel_Titulo, Alignment.LEADING,
                                                                GroupLayout.DEFAULT_SIZE, 893, Short.MAX_VALUE)
                                                        .addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
                                                                .addComponent(panelIzq, GroupLayout.PREFERRED_SIZE, 450,
                                                                        GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED, 34,
                                                                        Short.MAX_VALUE)
                                                                .addComponent(panelDer, GroupLayout.PREFERRED_SIZE, 409,
                                                                        GroupLayout.PREFERRED_SIZE)))
                                                .addGap(43)))));
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addComponent(panel_Titulo, GroupLayout.PREFERRED_SIZE, 68, GroupLayout.PREFERRED_SIZE)
                                .addGap(15)
                                .addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
                                        .addComponent(panelDer, 0, 0, Short.MAX_VALUE)
                                        .addComponent(panelIzq, GroupLayout.DEFAULT_SIZE, 223, Short.MAX_VALUE))
                                .addGap(45)
                                .addComponent(panel, GroupLayout.PREFERRED_SIZE, 146, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(520, Short.MAX_VALUE)));

        JLabel lblTitulo = new JLabel("REGISTRAR NUEVO EGRESADO");
        lblTitulo.setFont(new Font("Arial Black", Font.BOLD, 34));
        panel_Titulo.add(lblTitulo);

        JButton btnRegEg = new JButton("");
        btnRegEg.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
        // CREAR EGRESADO
        System.out.println("CREANDO EGRESADO");

        // Obtener los valores de los campos de texto
        String cedula = cedulaField.getText();
        String facultadId = facultadField.getText();
        String fechaNacimiento = fechaNacimientoField.getText();
        String nombre = nombreField.getText();
        String primerApellido = primerApellidoField.getText();
        String segundoApellido = segundoApellidoField.getText();
        String direccion = direccionField.getText();
        String ciudad = ciudadField.getText();
        String pais = paisField.getText();
        String correoElectronico = correoElectronicoField.getText();
        String contrasenia = passwordField.getText();// Ajusta esto según tus necesidades
        String genero = generoField.getText();
        String grupoEtnico = grupoEtnicoField.getText();
        String equipoId = null;
        CallableStatement callableStatement = null;   /// Se deja null por que no se incluyo en la interfaz

        try {
            // Preparar la llamada al procedimiento almacenado
            String sql = "{CALL sp_crear_egresado(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            callableStatement = userF.getConnection().prepareCall(sql);

            // Establecer los parámetros del procedimiento
            callableStatement.setLong(1, Long.parseLong(cedula));
            callableStatement.setInt(2, Integer.parseInt(facultadId));
            callableStatement.setDate(3, java.sql.Date.valueOf(fechaNacimiento));
            callableStatement.setString(4, nombre);
            callableStatement.setString(5, primerApellido);
            callableStatement.setString(6, segundoApellido);
            callableStatement.setString(7, direccion);
            callableStatement.setString(8, ciudad);
            callableStatement.setString(9, pais);
            callableStatement.setString(10, correoElectronico);
            callableStatement.setString(11, contrasenia);
            callableStatement.setString(12, genero);
            callableStatement.setString(13, grupoEtnico);
            callableStatement.setNull(14, java.sql.Types.INTEGER);

            // Ejecutar el procedimiento almacenado
            callableStatement.execute();

            System.out.println("Egresado creado exitosamente.");
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
        btnRegEg.setIcon(new ImageIcon(RegistroEgresados.class.getResource("/images/BotonRegEg.png")));

        JLabel UserLabel = new JLabel("Usuario");
        UserLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel lblContrasea = new JLabel("Contraseña");
        lblContrasea.setFont(new Font("Arial", Font.PLAIN, 14));

        textField = new JTextField();
        textField.setColumns(10);

        passwordField = new JPasswordField();
        GroupLayout gl_panel = new GroupLayout(panel);
        gl_panel.setHorizontalGroup(
                gl_panel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(btnRegEg, GroupLayout.PREFERRED_SIZE, 314, GroupLayout.PREFERRED_SIZE)
                                .addGap(38)
                                .addGroup(gl_panel.createParallelGroup(Alignment.LEADING, false)
                                        .addGroup(gl_panel.createSequentialGroup()
                                                .addComponent(UserLabel, GroupLayout.PREFERRED_SIZE, 99,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addGap(36)
                                                .addComponent(textField, GroupLayout.PREFERRED_SIZE, 285,
                                                        GroupLayout.PREFERRED_SIZE))
                                        .addGroup(gl_panel.createSequentialGroup()
                                                .addComponent(lblContrasea, GroupLayout.PREFERRED_SIZE, 115,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addGap(18)
                                                .addComponent(passwordField)))
                                .addContainerGap(144, Short.MAX_VALUE)));
        gl_panel.setVerticalGroup(
                gl_panel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel.createSequentialGroup()
                                .addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
                                        .addGroup(gl_panel.createSequentialGroup()
                                                .addContainerGap()
                                                .addComponent(btnRegEg))
                                        .addGroup(gl_panel.createSequentialGroup()
                                                .addGap(39)
                                                .addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
                                                        .addGroup(gl_panel.createSequentialGroup()
                                                                .addGap(1)
                                                                .addComponent(UserLabel, GroupLayout.PREFERRED_SIZE, 17,
                                                                        GroupLayout.PREFERRED_SIZE))
                                                        .addComponent(textField, GroupLayout.PREFERRED_SIZE,
                                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                                .addGap(15)
                                                .addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
                                                        .addComponent(lblContrasea, GroupLayout.PREFERRED_SIZE, 17,
                                                                GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(passwordField, GroupLayout.PREFERRED_SIZE, 21,
                                                                GroupLayout.PREFERRED_SIZE))))
                                .addContainerGap(14, Short.MAX_VALUE)));
        panel.setLayout(gl_panel);

        JLabel direccionLabel = new JLabel("Dirección:");
        direccionLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel ciudadLabel = new JLabel("Ciudad:");
        ciudadLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel paisLabel = new JLabel("País:");
        paisLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel correoElectronicoLabel = new JLabel("Correo Electrónico:");
        correoElectronicoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel generoLabel = new JLabel("Género:");
        generoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel grupoEtnicoLabel = new JLabel("Grupo Étnico:");
        grupoEtnicoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        grupoEtnicoField = new JTextField();
        grupoEtnicoField.setColumns(10);

        generoField = new JTextField();
        generoField.setColumns(10);

        correoElectronicoField = new JTextField();
        correoElectronicoField.setColumns(10);

        paisField = new JTextField();
        paisField.setColumns(10);

        ciudadField = new JTextField();
        ciudadField.setColumns(10);

        direccionField = new JTextField();
        direccionField.setColumns(10);
        GroupLayout gl_panelDer = new GroupLayout(panelDer);
        gl_panelDer.setHorizontalGroup(
                gl_panelDer.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelDer.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING, false)
                                        .addGroup(gl_panelDer.createSequentialGroup()
                                                .addComponent(paisLabel)
                                                .addGap(100)
                                                .addComponent(paisField))
                                        .addGroup(gl_panelDer.createSequentialGroup()
                                                .addComponent(correoElectronicoLabel)
                                                .addGap(10)
                                                .addComponent(correoElectronicoField))
                                        .addGroup(gl_panelDer.createSequentialGroup()
                                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(generoLabel)
                                                        .addComponent(grupoEtnicoLabel))
                                                .addGap(45)
                                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(grupoEtnicoField, GroupLayout.DEFAULT_SIZE, 242,
                                                                Short.MAX_VALUE)
                                                        .addComponent(generoField)))
                                        .addGroup(gl_panelDer.createSequentialGroup()
                                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(ciudadLabel)
                                                        .addComponent(direccionLabel))
                                                .addGap(67)
                                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(direccionField, GroupLayout.PREFERRED_SIZE, 244,
                                                                GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(ciudadField))))
                                .addContainerGap(25, Short.MAX_VALUE)));
        gl_panelDer.setVerticalGroup(
                gl_panelDer.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelDer.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                        .addComponent(direccionLabel)
                                        .addComponent(direccionField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(11)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                        .addComponent(ciudadLabel)
                                        .addComponent(ciudadField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(11)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                        .addComponent(paisLabel)
                                        .addComponent(paisField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(11)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                        .addComponent(correoElectronicoLabel)
                                        .addComponent(correoElectronicoField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                        .addComponent(generoLabel)
                                        .addComponent(generoField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(11)
                                .addGroup(gl_panelDer.createParallelGroup(Alignment.LEADING)
                                        .addComponent(grupoEtnicoLabel)
                                        .addComponent(grupoEtnicoField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addContainerGap(30, Short.MAX_VALUE)));
        panelDer.setLayout(gl_panelDer);

        JLabel cedulaLabel = new JLabel("Cédula:");
        cedulaLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        cedulaField = new JTextField();
        cedulaField.setColumns(10);

        JLabel facultadLabel = new JLabel("Facultad ID:");
        facultadLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        facultadField = new JTextField();
        facultadField.setColumns(10);

        JLabel fechaNacimientoLabel = new JLabel("Fecha Nacimiento:");
        fechaNacimientoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        fechaNacimientoField = new JTextField();
        fechaNacimientoField.setColumns(10);

        JLabel nombreLabel = new JLabel("Nombre:");
        nombreLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        nombreField = new JTextField();
        nombreField.setColumns(10);

        JLabel primerApellidoLabel = new JLabel("Primer Apellido:");
        primerApellidoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        JLabel segundoApellidoLabel = new JLabel("Segundo Apellido:");
        segundoApellidoLabel.setFont(new Font("Arial", Font.PLAIN, 14));

        primerApellidoField = new JTextField();
        primerApellidoField.setColumns(10);

        segundoApellidoField = new JTextField();
        segundoApellidoField.setColumns(10);
        GroupLayout gl_panelIzq = new GroupLayout(panelIzq);
        gl_panelIzq.setHorizontalGroup(
                gl_panelIzq.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelIzq.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.LEADING)
                                        .addComponent(cedulaLabel)
                                        .addComponent(facultadLabel)
                                        .addGroup(gl_panelIzq.createSequentialGroup()
                                                .addComponent(segundoApellidoLabel)
                                                .addGap(18)
                                                .addComponent(segundoApellidoField, GroupLayout.PREFERRED_SIZE, 285,
                                                        GroupLayout.PREFERRED_SIZE))
                                        .addGroup(gl_panelIzq.createSequentialGroup()
                                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(primerApellidoLabel)
                                                        .addComponent(fechaNacimientoLabel)
                                                        .addComponent(nombreLabel))
                                                .addGap(18)
                                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(primerApellidoField, GroupLayout.PREFERRED_SIZE,
                                                                285, GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(facultadField, GroupLayout.PREFERRED_SIZE, 285,
                                                                GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(fechaNacimientoField, GroupLayout.PREFERRED_SIZE,
                                                                285, GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(cedulaField, GroupLayout.PREFERRED_SIZE, 285,
                                                                GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(nombreField, GroupLayout.PREFERRED_SIZE, 285,
                                                                GroupLayout.PREFERRED_SIZE))))
                                .addContainerGap(20, Short.MAX_VALUE)));
        gl_panelIzq.setVerticalGroup(
                gl_panelIzq.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelIzq.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(cedulaLabel)
                                        .addComponent(cedulaField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.LEADING)
                                        .addComponent(facultadLabel)
                                        .addComponent(facultadField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(11)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(fechaNacimientoLabel)
                                        .addComponent(fechaNacimientoField, GroupLayout.PREFERRED_SIZE,
                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                .addGap(14)
                                .addGroup(gl_panelIzq.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(nombreLabel)
                                        .addComponent(nombreField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.PREFERRED_SIZE))
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
                                .addContainerGap(141, Short.MAX_VALUE)));
        panelIzq.setLayout(gl_panelIzq);
        setLayout(groupLayout);
    }
}
