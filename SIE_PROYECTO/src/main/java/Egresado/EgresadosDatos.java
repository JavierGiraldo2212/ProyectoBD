package Egresado;

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

import com.mycompany.sie_proyecto.UseEmpresa;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import java.awt.Panel;
import Functions.UsersSesions;

public class EgresadosDatos extends JPanel {
    private JTextField facultadField;
    private JTextField fechaNacimientoField;
    private JTextField nombreField;
    private JTextField primerApellidoField;
    private JTextField segundoApellidoField;
    private JTextField direccionField;
    private JTextField ciudadField;
    private JTextField paisField;
    private JTextField generoField;
    private JTextField grupoEtnicoField;

    public EgresadosDatos(JPanel cardPanel, UsersSesions userF) {
        
        setBackground(Color.WHITE);

        JPanel panelLateral = new JPanel();
        panelLateral.setBackground(Color.WHITE);

        JPanel panelAux = new JPanel();
        panelAux.setBackground(Color.WHITE);

        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.TRAILING)
                        .addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(panelLateral, GroupLayout.PREFERRED_SIZE, 214, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(panelAux, GroupLayout.DEFAULT_SIZE, 1049, Short.MAX_VALUE)
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

        // Title Label
        JLabel lblTitulo = new JLabel("");
        lblTitulo.setIcon(new ImageIcon(getClass().getResource("/images/Egresados/LogoEgresados.png")));
        lblTitulo.setBackground(Color.WHITE);
        // Field Labels
        JLabel cedulaLabel = new JLabel("Cedula:");
        cedulaLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));

        JLabel facultadLabel = new JLabel("ID Facultad:");
        facultadLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        facultadField = new JTextField();
        facultadField.setBackground(Color.LIGHT_GRAY);
        facultadField.setColumns(10);

        JLabel fechaNacimientoLabel = new JLabel("FechaNacimiento:");
        fechaNacimientoLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        fechaNacimientoField = new JTextField();
        fechaNacimientoField.setBackground(Color.LIGHT_GRAY);
        fechaNacimientoField.setColumns(10);

        JLabel nombreLabel = new JLabel("Nombre:");
        nombreLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        nombreField = new JTextField();
        nombreField.setBackground(Color.LIGHT_GRAY);
        nombreField.setColumns(10);

        JLabel primerApellidoLabel = new JLabel("PrimerApellido:");
        primerApellidoLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        primerApellidoField = new JTextField();
        primerApellidoField.setBackground(Color.LIGHT_GRAY);
        primerApellidoField.setColumns(10);

        JLabel segundoApellidoLabel = new JLabel("SegundoApellido:");
        segundoApellidoLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        segundoApellidoField = new JTextField();
        segundoApellidoField.setBackground(Color.LIGHT_GRAY);
        segundoApellidoField.setColumns(10);

        JLabel direccionLabel = new JLabel("Direccion:");
        direccionLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        direccionField = new JTextField();
        direccionField.setBackground(Color.LIGHT_GRAY);
        direccionField.setColumns(10);

        JLabel ciudadLabel = new JLabel("Ciudad:");
        ciudadLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        ciudadField = new JTextField();
        ciudadField.setBackground(Color.LIGHT_GRAY);
        ciudadField.setColumns(10);

        JLabel paisLabel = new JLabel("Pais:");
        paisLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        paisField = new JTextField();
        paisField.setBackground(Color.LIGHT_GRAY);
        paisField.setColumns(10);

        JLabel correoLabel = new JLabel("CorreoElectronico:");
        correoLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));

        JLabel generoLabel = new JLabel("Genero:");
        generoLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        generoField = new JTextField();
        generoField.setBackground(Color.LIGHT_GRAY);
        generoField.setColumns(10);

        JLabel grupoEtnicoLabel = new JLabel("GrupoEtnico:");
        grupoEtnicoLabel.setFont(new Font("Arial Black", Font.PLAIN, 16));
        grupoEtnicoField = new JTextField();
        grupoEtnicoField.setBackground(Color.LIGHT_GRAY);
        grupoEtnicoField.setColumns(10);

        // Update Button
        JButton btnUpdate = new JButton("");
        btnUpdate.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // UPDATE
            }
        });
        btnUpdate.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/Update.png")));
        btnUpdate.setBackground(Color.WHITE);

        // Placeholder Labels
        JLabel lblNewLabel = new JLabel("Cedula");
        lblNewLabel.setBackground(Color.LIGHT_GRAY);

        JLabel lblNewLabel_1 = new JLabel("Correo");
        lblNewLabel_1.setBackground(Color.LIGHT_GRAY);

        GroupLayout gl_panelAux = new GroupLayout(panelAux);
        gl_panelAux.setHorizontalGroup(
                gl_panelAux.createParallelGroup(Alignment.TRAILING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 600,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGap(69)
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(cedulaLabel)
                                                        .addComponent(facultadLabel)
                                                        .addComponent(fechaNacimientoLabel)
                                                        .addComponent(nombreLabel)
                                                        .addComponent(primerApellidoLabel)
                                                        .addComponent(segundoApellidoLabel))
                                                .addGap(36)
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addComponent(fechaNacimientoField, 203, 203, 203)
                                                                .addPreferredGap(ComponentPlacement.RELATED))
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addComponent(nombreField, 203, 203, 203)
                                                                .addPreferredGap(ComponentPlacement.RELATED))
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addComponent(primerApellidoField, 203, 203, 203)
                                                                .addPreferredGap(ComponentPlacement.RELATED))
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addComponent(segundoApellidoField, 203, 203, 203)
                                                                .addPreferredGap(ComponentPlacement.RELATED))
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addGroup(gl_panelAux
                                                                        .createParallelGroup(Alignment.TRAILING, false)
                                                                        .addComponent(facultadField, Alignment.LEADING)
                                                                        .addComponent(lblNewLabel, Alignment.LEADING,
                                                                                GroupLayout.DEFAULT_SIZE, 203,
                                                                                Short.MAX_VALUE))
                                                                .addGap(90)))
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(generoLabel)
                                                        .addComponent(grupoEtnicoLabel)
                                                        .addComponent(direccionLabel)
                                                        .addComponent(ciudadLabel)
                                                        .addComponent(paisLabel)
                                                        .addComponent(correoLabel))
                                                .addPreferredGap(ComponentPlacement.RELATED)
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING, false)
                                                        .addComponent(lblNewLabel_1, GroupLayout.DEFAULT_SIZE,
                                                                GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(direccionField, GroupLayout.DEFAULT_SIZE, 258,
                                                                Short.MAX_VALUE)
                                                        .addComponent(ciudadField)
                                                        .addComponent(paisField)
                                                        .addComponent(generoField)
                                                        .addComponent(grupoEtnicoField))))
                                .addGap(52))
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap(848, Short.MAX_VALUE)
                                .addComponent(btnUpdate, GroupLayout.PREFERRED_SIZE, 181, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap()));
        gl_panelAux.setVerticalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 91, GroupLayout.PREFERRED_SIZE)
                                .addGap(141)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.TRAILING, false)
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addComponent(cedulaLabel)
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addComponent(facultadLabel)
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addComponent(fechaNacimientoLabel)
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addComponent(nombreLabel)
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addComponent(primerApellidoLabel)
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addComponent(segundoApellidoLabel))
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGap(6)
                                                .addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 21,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addComponent(facultadField, GroupLayout.PREFERRED_SIZE,
                                                        GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                                .addGap(13)
                                                .addComponent(fechaNacimientoField, GroupLayout.PREFERRED_SIZE,
                                                        GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                                .addGap(18)
                                                .addComponent(nombreField, GroupLayout.PREFERRED_SIZE,
                                                        GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addComponent(primerApellidoField, GroupLayout.PREFERRED_SIZE,
                                                        GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE,
                                                        Short.MAX_VALUE)
                                                .addComponent(segundoApellidoField, GroupLayout.PREFERRED_SIZE,
                                                        GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(ComponentPlacement.RELATED))
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(direccionLabel)
                                                        .addComponent(direccionField, GroupLayout.PREFERRED_SIZE,
                                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addGap(12)
                                                                .addComponent(ciudadLabel))
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                                .addComponent(ciudadField, GroupLayout.PREFERRED_SIZE,
                                                                        GroupLayout.DEFAULT_SIZE,
                                                                        GroupLayout.PREFERRED_SIZE)))
                                                .addGap(12)
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(paisLabel)
                                                        .addComponent(paisField, GroupLayout.PREFERRED_SIZE,
                                                                GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.TRAILING, false)
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addComponent(correoLabel)
                                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                                .addComponent(generoLabel)
                                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                                .addComponent(grupoEtnicoLabel))
                                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addComponent(lblNewLabel_1, GroupLayout.PREFERRED_SIZE,
                                                                        21, GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED,
                                                                        GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                                .addComponent(generoField, GroupLayout.PREFERRED_SIZE,
                                                                        GroupLayout.DEFAULT_SIZE,
                                                                        GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                                .addComponent(grupoEtnicoField,
                                                                        GroupLayout.PREFERRED_SIZE,
                                                                        GroupLayout.DEFAULT_SIZE,
                                                                        GroupLayout.PREFERRED_SIZE)
                                                                .addGap(7)))))
                                .addPreferredGap(ComponentPlacement.RELATED, 190, Short.MAX_VALUE)
                                .addComponent(btnUpdate, GroupLayout.PREFERRED_SIZE, 70, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap()));
        panelAux.setLayout(gl_panelAux);

        // Sidebar Components
        JLabel LogoEgresados = new JLabel("");
        LogoEgresados.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/logo_egresados_unal.png")));
        LogoEgresados.setBackground(Color.WHITE);

        JButton btnCerrarSesion = new JButton("");
        btnCerrarSesion.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // logout
                // Perform logout
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                if (userF.logout())
                    cl.show(cardPanel, "mainPanel");
            }
        });
        btnCerrarSesion.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/logout.png")));
        btnCerrarSesion.setBackground(Color.WHITE);

        JButton btnBack = new JButton("");
        btnBack.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // BACK
                // Go back to mainEgresados
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                cl.show(cardPanel, "mainEgresado");
            }
        });
        btnBack.setBackground(Color.WHITE);
        btnBack.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/botonBack.png")));

        GroupLayout gl_panelLateral = new GroupLayout(panelLateral);
        gl_panelLateral.setHorizontalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelLateral.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(btnBack, GroupLayout.PREFERRED_SIZE, 123,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(btnCerrarSesion)
                                        .addComponent(LogoEgresados))
                                .addContainerGap(33, Short.MAX_VALUE)));
        gl_panelLateral.setVerticalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(LogoEgresados)
                                .addGap(275)
                                .addComponent(btnBack, GroupLayout.PREFERRED_SIZE, 42, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.RELATED, 291, Short.MAX_VALUE)
                                .addComponent(btnCerrarSesion)
                                .addContainerGap()));
        panelLateral.setLayout(gl_panelLateral);
        setLayout(groupLayout);
    }
}
