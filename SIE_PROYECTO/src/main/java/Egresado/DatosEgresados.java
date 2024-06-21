package Egresado;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;

import java.awt.CardLayout;
import java.awt.Color;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingConstants;

import Functions.UsersSesions;

import java.awt.event.ActionListener;
import java.util.Map;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.JTextField;

public class DatosEgresados extends JPanel {
        private JTextField egNombre;
        private JTextField egPrimerApellido;
        private JTextField egSegundoApellido;
        private JTextField egPais;
        private JTextField egCiudad;
        private JTextField egDireccion;

        /**
         * Create the panel.
         */
        public DatosEgresados(JPanel cardPanel, UsersSesions userF) {
                setBackground(Color.WHITE);

                JPanel panelLateral = new JPanel();
                panelLateral.setBackground(Color.WHITE);

                JPanel panelInfo = new JPanel();
                panelInfo.setBackground(Color.WHITE);
                GroupLayout groupLayout = new GroupLayout(this);
                groupLayout.setHorizontalGroup(
                                groupLayout.createParallelGroup(Alignment.LEADING)
                                                .addGroup(groupLayout.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(panelLateral, GroupLayout.PREFERRED_SIZE,
                                                                                229, GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                                .addComponent(panelInfo, GroupLayout.DEFAULT_SIZE, 1021,
                                                                                Short.MAX_VALUE)
                                                                .addContainerGap()));
                groupLayout.setVerticalGroup(
                                groupLayout.createParallelGroup(Alignment.TRAILING)
                                                .addGroup(groupLayout.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(groupLayout
                                                                                .createParallelGroup(Alignment.TRAILING)
                                                                                .addComponent(panelInfo,
                                                                                                Alignment.LEADING,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                698, Short.MAX_VALUE)
                                                                                .addComponent(panelLateral,
                                                                                                Alignment.LEADING,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                698, Short.MAX_VALUE))
                                                                .addContainerGap()));

                JLabel lblTitulo = new JLabel("");
                lblTitulo.setHorizontalAlignment(SwingConstants.CENTER);
                lblTitulo.setIcon(
                                new ImageIcon(getClass().getResource("/images/Egresados/LogoEgresados.png")));
                lblTitulo.setBackground(Color.WHITE);

                JLabel lblNewLabel = new JLabel("MIS DATOS PERSONALES");
                lblNewLabel.setHorizontalAlignment(SwingConstants.RIGHT);
                lblNewLabel.setFont(new Font("Arial Black", Font.PLAIN, 27));

                JPanel panelInfoEg = new JPanel();
                panelInfoEg.setBackground(new Color(213, 255, 213));

                JButton btnUpdateData = new JButton("");
                btnUpdateData.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // UPDATE DATA
                                System.out.println(egNombre.getText()+ egPrimerApellido.getText()+
                                                egSegundoApellido.getText()+ egDireccion.getText()+ egCiudad.getText()+
                                                egCiudad.getText());
                                userF.actualizarDatosEgresado(egNombre.getText(), egPrimerApellido.getText(), 
                                egSegundoApellido.getText(), egDireccion.getText(), egCiudad.getText(), egPais.getText());
                        }
                });
                btnUpdateData.setBackground(Color.WHITE);
                btnUpdateData.setIcon(new ImageIcon(getClass().getResource("/images/Update.png")));

                JButton btnLoad = new JButton("");
                btnLoad.setIcon(new ImageIcon(
                                getClass().getResource("/images/Egresados/BotonCargarDatos.png")));
                btnLoad.setBackground(Color.WHITE);

                GroupLayout gl_panelInfo = new GroupLayout(panelInfo);
                gl_panelInfo.setHorizontalGroup(
                                gl_panelInfo.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelInfo.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE,
                                                                                359, GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED, 196,
                                                                                Short.MAX_VALUE)
                                                                .addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE,
                                                                                438, GroupLayout.PREFERRED_SIZE)
                                                                .addGap(18))
                                                .addGroup(gl_panelInfo.createSequentialGroup()
                                                                .addGap(50)
                                                                .addComponent(panelInfoEg, GroupLayout.PREFERRED_SIZE,
                                                                                914, GroupLayout.PREFERRED_SIZE)
                                                                .addContainerGap(57, Short.MAX_VALUE))
                                                .addGroup(Alignment.TRAILING, gl_panelInfo.createSequentialGroup()
                                                                .addGap(20)
                                                                .addComponent(btnLoad, GroupLayout.PREFERRED_SIZE, 176,
                                                                                GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED, 625,
                                                                                Short.MAX_VALUE)
                                                                .addComponent(btnUpdateData, GroupLayout.PREFERRED_SIZE,
                                                                                166, GroupLayout.PREFERRED_SIZE)
                                                                .addGap(34)));
                gl_panelInfo.setVerticalGroup(
                                gl_panelInfo.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelInfo.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(gl_panelInfo
                                                                                .createParallelGroup(Alignment.TRAILING)
                                                                                .addComponent(lblNewLabel,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                57,
                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                .addComponent(lblTitulo,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                64,
                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                .addGap(64)
                                                                .addComponent(panelInfoEg, GroupLayout.PREFERRED_SIZE,
                                                                                439, GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED, 28,
                                                                                Short.MAX_VALUE)
                                                                .addGroup(gl_panelInfo
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addComponent(btnUpdateData,
                                                                                                Alignment.TRAILING,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                71,
                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                .addComponent(btnLoad,
                                                                                                Alignment.TRAILING,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                81,
                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                .addContainerGap()));
                panelInfoEg.setLayout(null);

                JLabel txCedula = new JLabel("Cédula");
                txCedula.setBackground(Color.WHITE);
                txCedula.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txCedula.setBounds(26, 11, 113, 31);
                panelInfoEg.add(txCedula);

                JLabel egCedula = new JLabel("");
                egCedula.setHorizontalAlignment(SwingConstants.LEFT);
                egCedula.setBackground(Color.WHITE);
                egCedula.setFont(new Font("Arial Black", Font.PLAIN, 15));
                egCedula.setBounds(178, 11, 710, 31);
                panelInfoEg.add(egCedula);

                JLabel txFacultad = new JLabel("ID Facultad");
                txFacultad.setBackground(Color.WHITE);
                txFacultad.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txFacultad.setBounds(26, 53, 113, 31);
                panelInfoEg.add(txFacultad);

                JLabel egFacultad = new JLabel("");
                egFacultad.setHorizontalAlignment(SwingConstants.LEFT);
                egFacultad.setBackground(Color.WHITE);
                egFacultad.setFont(new Font("Arial Black", Font.PLAIN, 15));
                egFacultad.setBounds(178, 53, 710, 31);
                panelInfoEg.add(egFacultad);

                JLabel txNombre = new JLabel("Nombre");
                txNombre.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txNombre.setBackground(Color.WHITE);
                txNombre.setBounds(26, 95, 113, 31);
                panelInfoEg.add(txNombre);

                JLabel txPrimerApellido = new JLabel("Primer Apellido");
                txPrimerApellido.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txPrimerApellido.setBackground(Color.WHITE);
                txPrimerApellido.setBounds(26, 142, 143, 31);
                panelInfoEg.add(txPrimerApellido);

                egNombre = new JTextField();
                egNombre.setHorizontalAlignment(SwingConstants.LEFT);
                egNombre.setFont(new Font("Arimo", Font.PLAIN, 15));
                egNombre.setBounds(178, 95, 710, 31);
                panelInfoEg.add(egNombre);
                egNombre.setColumns(10);

                egPrimerApellido = new JTextField();
                egPrimerApellido.setHorizontalAlignment(SwingConstants.LEFT);
                egPrimerApellido.setFont(new Font("Arimo", Font.PLAIN, 15));
                egPrimerApellido.setColumns(10);
                egPrimerApellido.setBounds(178, 144, 710, 31);
                panelInfoEg.add(egPrimerApellido);

                JLabel txSegundoApellido = new JLabel("Segundo Apellido");
                txSegundoApellido.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txSegundoApellido.setBackground(Color.WHITE);
                txSegundoApellido.setBounds(26, 184, 143, 31);
                panelInfoEg.add(txSegundoApellido);

                egSegundoApellido = new JTextField();
                egSegundoApellido.setHorizontalAlignment(SwingConstants.LEFT);
                egSegundoApellido.setFont(new Font("Arimo", Font.PLAIN, 15));
                egSegundoApellido.setColumns(10);
                egSegundoApellido.setBounds(178, 186, 710, 31);
                panelInfoEg.add(egSegundoApellido);

                JLabel txPais = new JLabel("Pais");
                txPais.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txPais.setBackground(Color.WHITE);
                txPais.setBounds(26, 226, 143, 31);
                panelInfoEg.add(txPais);

                egPais = new JTextField();
                egPais.setHorizontalAlignment(SwingConstants.LEFT);
                egPais.setFont(new Font("Arimo", Font.PLAIN, 15));
                egPais.setColumns(10);
                egPais.setBounds(178, 228, 710, 31);
                panelInfoEg.add(egPais);

                JLabel txCiudad = new JLabel("Ciudad");
                txCiudad.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txCiudad.setBackground(Color.WHITE);
                txCiudad.setBounds(26, 268, 143, 31);
                panelInfoEg.add(txCiudad);

                egCiudad = new JTextField();
                egCiudad.setHorizontalAlignment(SwingConstants.LEFT);
                egCiudad.setFont(new Font("Arimo", Font.PLAIN, 15));
                egCiudad.setColumns(10);
                egCiudad.setBounds(178, 270, 710, 31);
                panelInfoEg.add(egCiudad);

                JLabel txDireccion = new JLabel("Dirección");
                txDireccion.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txDireccion.setBackground(Color.WHITE);
                txDireccion.setBounds(26, 310, 143, 31);
                panelInfoEg.add(txDireccion);

                egDireccion = new JTextField();
                egDireccion.setHorizontalAlignment(SwingConstants.LEFT);
                egDireccion.setFont(new Font("Arimo", Font.PLAIN, 15));
                egDireccion.setColumns(10);
                egDireccion.setBounds(178, 312, 710, 31);
                panelInfoEg.add(egDireccion);

                JLabel txCorreo = new JLabel("Correo");
                txCorreo.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txCorreo.setBackground(Color.WHITE);
                txCorreo.setBounds(26, 352, 113, 31);
                panelInfoEg.add(txCorreo);

                JLabel egCorreo = new JLabel("");
                egCorreo.setHorizontalAlignment(SwingConstants.LEFT);
                egCorreo.setFont(new Font("Arial Black", Font.PLAIN, 15));
                egCorreo.setBackground(Color.WHITE);
                egCorreo.setBounds(178, 352, 710, 31);
                panelInfoEg.add(egCorreo);

                JLabel egGrupoEtnico = new JLabel("");
                egGrupoEtnico.setHorizontalAlignment(SwingConstants.LEFT);
                egGrupoEtnico.setFont(new Font("Arial Black", Font.PLAIN, 15));
                egGrupoEtnico.setBackground(Color.WHITE);
                egGrupoEtnico.setBounds(178, 394, 710, 31);
                panelInfoEg.add(egGrupoEtnico);

                JLabel txGrupoEtnico = new JLabel("Grupo Étnico");
                txGrupoEtnico.setFont(new Font("Arial Black", Font.PLAIN, 15));
                txGrupoEtnico.setBackground(Color.WHITE);
                txGrupoEtnico.setBounds(26, 394, 113, 31);
                panelInfoEg.add(txGrupoEtnico);
                panelInfo.setLayout(gl_panelInfo);
                panelLateral.setLayout(null);

                JLabel LogosEgresados = new JLabel("");
                LogosEgresados.setIcon(
                                new ImageIcon(getClass().getResource("/images/logo_egresados_unal.png")));
                LogosEgresados.setBackground(Color.WHITE);
                LogosEgresados.setBounds(10, 11, 158, 26);
                panelLateral.add(LogosEgresados);

                JButton btnLogOut = new JButton("");
                btnLogOut.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // LOGOUT
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                if (userF.logout())
                                        cl.show(cardPanel, "mainPanel");
                        }
                });
                btnLogOut.setIcon(new ImageIcon(getClass().getResource("/images/logout.png")));
                btnLogOut.setBackground(Color.WHITE);
                btnLogOut.setBounds(10, 617, 158, 35);
                panelLateral.add(btnLogOut);

                JButton btnBack = new JButton("");
                btnBack.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // VOLER MAIN EGRESADO
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                cl.show(cardPanel, "mainEgresado");
                        }
                });
                btnBack.setBackground(Color.WHITE);
                btnBack.setIcon(new ImageIcon(getClass().getResource("/images/botonBack.png")));
                btnBack.setBounds(99, 277, 120, 42);
                panelLateral.add(btnBack);
                setLayout(groupLayout);

                btnLoad.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                Map<String, Object> datosEgresado = userF.obtenerDatosEgresado();
                                
                                egCedula.setText(String.valueOf(datosEgresado.get("Cedula")));
                                egFacultad.setText(String.valueOf(datosEgresado.get("FACULTAD_idFACULTAD")));
                                egNombre.setText(String.valueOf(datosEgresado.get("Nombre")));
                                egPrimerApellido.setText(String.valueOf(datosEgresado.get("PrimerApellido")));
                                egSegundoApellido.setText(String.valueOf(datosEgresado.get("SegundoApellido")));
                                egPais.setText(String.valueOf(datosEgresado.get("Pais")));
                                egCiudad.setText(String.valueOf(datosEgresado.get("Ciudad")));
                                egDireccion.setText(String.valueOf(datosEgresado.get("Direccion")));
                                egCorreo.setText(String.valueOf(datosEgresado.get("CorreoElectronico")));
                                egGrupoEtnico.setText(String.valueOf(datosEgresado.get("GrupoEtnico")));
                        }
                });

        }
}
