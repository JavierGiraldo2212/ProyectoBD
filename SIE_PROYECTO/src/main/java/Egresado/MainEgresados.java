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
import java.awt.event.ActionEvent;

public class MainEgresados extends JPanel {

        /**
         * Create the panel.
         */
        public MainEgresados(JPanel cardPanel, UsersSesions userF) {
                setBackground(Color.WHITE);

                JPanel panelLateral = new JPanel();
                panelLateral.setBackground(Color.WHITE);

                JPanel panelUnal = new JPanel();
                panelUnal.setBackground(Color.WHITE);

                JPanel panelBoton = new JPanel();
                panelBoton.setBackground(Color.WHITE);
                GroupLayout groupLayout = new GroupLayout(this);
                groupLayout.setHorizontalGroup(
                                groupLayout.createParallelGroup(Alignment.LEADING)
                                                .addGroup(groupLayout.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(groupLayout
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addGroup(groupLayout
                                                                                                .createSequentialGroup()
                                                                                                .addComponent(panelLateral,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                229,
                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                .addPreferredGap(
                                                                                                                ComponentPlacement.UNRELATED)
                                                                                                .addComponent(panelBoton,
                                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                                1021,
                                                                                                                Short.MAX_VALUE))
                                                                                .addComponent(panelUnal,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                1260, Short.MAX_VALUE))
                                                                .addContainerGap()));
                groupLayout.setVerticalGroup(
                                groupLayout.createParallelGroup(Alignment.LEADING)
                                                .addGroup(Alignment.TRAILING, groupLayout.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(groupLayout
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addComponent(panelBoton,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                370, Short.MAX_VALUE)
                                                                                .addComponent(panelLateral,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                370, Short.MAX_VALUE))
                                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                                .addComponent(panelUnal, GroupLayout.PREFERRED_SIZE,
                                                                                317, GroupLayout.PREFERRED_SIZE)
                                                                .addContainerGap()));

                JLabel lblTitulo = new JLabel("");
                lblTitulo.setHorizontalAlignment(SwingConstants.CENTER);
                lblTitulo.setIcon(
                                new ImageIcon(MainEgresados.class.getResource("/images/Egresados/LogoEgresados.png")));
                lblTitulo.setBackground(Color.WHITE);

                JButton btnDatos = new JButton("");
                btnDatos.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // VER DATOS EGRESADO
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                cl.show(cardPanel, "egresadosDatos");
                        }
                });
                btnDatos.setBackground(Color.WHITE);
                btnDatos.setIcon(new ImageIcon(MainEgresados.class.getResource("/images/Egresados/BotonDatos.png")));
                btnDatos.setBorderPainted(false);

                JButton btnBuscarOferta = new JButton("");
                btnBuscarOferta.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // VER OFERTAS Y POSTULAR
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                cl.show(cardPanel, "egresadosOferta");
                        }
                });
                btnBuscarOferta.setBackground(Color.WHITE);
                btnBuscarOferta.setIcon(new ImageIcon(
                                MainEgresados.class.getResource("/images/Egresados/BotonBuscarOfertasLaborales.png")));
                btnBuscarOferta.setBorderPainted(false);

                JButton btnEventos = new JButton("");
                btnEventos.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // VER EVENTOS
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                cl.show(cardPanel, "egresadosEvento");
                        }
                });
                btnEventos.setIcon(
                                new ImageIcon(MainEgresados.class.getResource("/images/Egresados/BotonEventos.png")));
                btnEventos.setBackground(Color.WHITE);
                btnEventos.setBorderPainted(false);

                JButton btnNewButton = new JButton("");
                btnNewButton.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // VER OFERTAS POSTULADAS Y ANULAR POSTULACIÓN
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                cl.show(cardPanel, "misOfertasEgresado");
                        }
                });
                btnNewButton.setBackground(Color.WHITE);
                btnNewButton.setIcon(new ImageIcon(
                                MainEgresados.class.getResource("/images/Egresados/BotonVerOfertasLaborales.png")));
                btnNewButton.setBorderPainted(false);

                GroupLayout gl_panelBoton = new GroupLayout(panelBoton);
                gl_panelBoton.setHorizontalGroup(
                                gl_panelBoton.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelBoton.createSequentialGroup()
                                                                .addGap(159)
                                                                .addGroup(gl_panelBoton
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addComponent(btnBuscarOferta,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                231,
                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                .addComponent(btnDatos,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                231,
                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                .addGap(197)
                                                                .addGroup(gl_panelBoton
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addComponent(btnEventos,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                231,
                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                .addComponent(btnNewButton,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                249,
                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                .addContainerGap(185, Short.MAX_VALUE))
                                                .addGroup(gl_panelBoton.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE,
                                                                                359, GroupLayout.PREFERRED_SIZE)
                                                                .addContainerGap(652, Short.MAX_VALUE)));
                gl_panelBoton.setVerticalGroup(
                                gl_panelBoton.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelBoton.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 64,
                                                                                GroupLayout.PREFERRED_SIZE)
                                                                .addGap(36)
                                                                .addGroup(gl_panelBoton
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addGroup(gl_panelBoton
                                                                                                .createSequentialGroup()
                                                                                                .addComponent(btnEventos,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                107,
                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                .addGap(18)
                                                                                                .addComponent(btnNewButton))
                                                                                .addGroup(gl_panelBoton
                                                                                                .createSequentialGroup()
                                                                                                .addComponent(btnDatos)
                                                                                                .addGap(18)
                                                                                                .addComponent(btnBuscarOferta,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                107,
                                                                                                                GroupLayout.PREFERRED_SIZE)))
                                                                .addContainerGap(15, Short.MAX_VALUE)));
                panelBoton.setLayout(gl_panelBoton);

                JLabel FondoUnal = new JLabel("");
                FondoUnal.setIcon(new ImageIcon(MainEgresados.class.getResource("/images/fondo#unal.png")));
                GroupLayout gl_panelUnal = new GroupLayout(panelUnal);
                gl_panelUnal.setHorizontalGroup(
                                gl_panelUnal.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelUnal.createSequentialGroup()
                                                                .addComponent(FondoUnal, GroupLayout.PREFERRED_SIZE,
                                                                                1250, Short.MAX_VALUE)
                                                                .addContainerGap()));
                gl_panelUnal.setVerticalGroup(
                                gl_panelUnal.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelUnal.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(FondoUnal)
                                                                .addContainerGap(36, Short.MAX_VALUE)));
                panelUnal.setLayout(gl_panelUnal);
                panelLateral.setLayout(null);

                JLabel LogosEgresados = new JLabel("");
                LogosEgresados.setIcon(
                                new ImageIcon(MainEgresados.class.getResource("/images/logo_egresados_unal.png")));
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
                btnLogOut.setIcon(new ImageIcon(MainEgresados.class.getResource("/images/logout.png")));
                btnLogOut.setBackground(Color.WHITE);
                btnLogOut.setBorderPainted(false);
                btnLogOut.setBounds(10, 324, 158, 35);
                panelLateral.add(btnLogOut);

                JLabel LogoInicio = new JLabel("");
                LogoInicio.setBackground(Color.WHITE);
                LogoInicio.setIcon(new ImageIcon(MainEgresados.class.getResource("/images/BotonInicio.png")));
                LogoInicio.setBounds(10, 48, 90, 44);
                panelLateral.add(LogoInicio);
                setLayout(groupLayout);

        }
}
