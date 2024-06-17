package com.mycompany.sie_proyecto;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;

import java.awt.CardLayout;
import java.awt.Color;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.LayoutStyle.ComponentPlacement;

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

        JPanel panelAux = new JPanel();
        panelAux.setBackground(Color.WHITE);

        JPanel panel = new JPanel();
        panel.setBackground(Color.WHITE);
        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.TRAILING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(panel, Alignment.LEADING, GroupLayout.DEFAULT_SIZE,
                                                GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
                                                .addComponent(panelLateral, GroupLayout.PREFERRED_SIZE, 214,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(ComponentPlacement.RELATED)
                                                .addComponent(panelAux, GroupLayout.DEFAULT_SIZE, 1049,
                                                        Short.MAX_VALUE)))
                                .addContainerGap()));
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
                                        .addComponent(panelAux, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE,
                                                Short.MAX_VALUE)
                                        .addComponent(panelLateral, GroupLayout.DEFAULT_SIZE, 373, Short.MAX_VALUE))
                                .addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(panel, GroupLayout.DEFAULT_SIZE, 319, Short.MAX_VALUE)
                                .addContainerGap()));

        JButton btnMisDatos = new JButton("");
        btnMisDatos.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Mis datos

            }
        });
        btnMisDatos.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/Egresados/BotonDatos.png")));
        btnMisDatos.setBackground(Color.WHITE);

        JButton btnOfertasLaborales = new JButton("");
        btnOfertasLaborales.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // OFERTA LABORAL

            }
        });
        btnOfertasLaborales.setBackground(Color.WHITE);
        btnOfertasLaborales
                .setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/Egresados/BotonOfertasLaborales.png")));

        JButton btnEventos = new JButton("");
        btnEventos.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // EVENTOS
            }
        });
        btnEventos.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/Egresados/BotonEventos.png")));
        btnEventos.setBackground(Color.WHITE);

        JLabel lblTitulo = new JLabel("");
        lblTitulo.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/Egresados/LogoEgresados.png")));
        lblTitulo.setBackground(Color.WHITE);
        GroupLayout gl_panelAux = new GroupLayout(panelAux);
        gl_panelAux.setHorizontalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGap(28)
                                                .addComponent(btnMisDatos, GroupLayout.PREFERRED_SIZE, 300,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addGap(18)
                                                .addComponent(btnOfertasLaborales, GroupLayout.PREFERRED_SIZE, 315,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addGap(18)
                                                .addComponent(btnEventos, GroupLayout.PREFERRED_SIZE, 338,
                                                        GroupLayout.PREFERRED_SIZE))
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGap(206)
                                                .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 600,
                                                        GroupLayout.PREFERRED_SIZE)))
                                .addContainerGap(32, Short.MAX_VALUE)));
        gl_panelAux.setVerticalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(Alignment.TRAILING, gl_panelAux.createSequentialGroup()
                                .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 91, GroupLayout.PREFERRED_SIZE)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING, false)
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGap(18)
                                                .addComponent(btnOfertasLaborales, GroupLayout.PREFERRED_SIZE, 134,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addGap(89))
                                        .addGroup(Alignment.TRAILING, gl_panelAux.createSequentialGroup()
                                                .addPreferredGap(ComponentPlacement.RELATED, 116, Short.MAX_VALUE)
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.TRAILING)
                                                        .addComponent(btnEventos, GroupLayout.PREFERRED_SIZE, 129,
                                                                GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(btnMisDatos))
                                                .addGap(27)))));
        panelAux.setLayout(gl_panelAux);

        JLabel lblNewLabel = new JLabel("");
        lblNewLabel.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/fondo#unal.png")));
        lblNewLabel.setBackground(Color.WHITE);
        GroupLayout gl_panel = new GroupLayout(panel);
        gl_panel.setHorizontalGroup(
                gl_panel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 1249, Short.MAX_VALUE)
                                .addContainerGap()));
        gl_panel.setVerticalGroup(
                gl_panel.createParallelGroup(Alignment.LEADING)
                        .addGroup(Alignment.TRAILING, gl_panel.createSequentialGroup()
                                .addContainerGap(16, Short.MAX_VALUE)
                                .addComponent(lblNewLabel)
                                .addContainerGap()));
        panel.setLayout(gl_panel);

        JLabel LogoEgresados = new JLabel("");
        LogoEgresados.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/logo_egresados_unal.png")));
        LogoEgresados.setBackground(Color.WHITE);

        JButton btnCerrarSesion = new JButton("");
        btnCerrarSesion.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //logout
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                if (userF.logout())
                    cl.show(cardPanel, "mainPanel");
            }
        });
        btnCerrarSesion.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/logout.png")));
        btnCerrarSesion.setBackground(Color.WHITE);

        JLabel lblInicio = new JLabel("");
        lblInicio.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/BotonInicio.png")));
        lblInicio.setBackground(Color.WHITE);
        GroupLayout gl_panelLateral = new GroupLayout(panelLateral);
        gl_panelLateral.setHorizontalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelLateral.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(btnCerrarSesion)
                                        .addComponent(lblInicio)
                                        .addComponent(LogoEgresados))
                                .addContainerGap(33, Short.MAX_VALUE)));
        gl_panelLateral.setVerticalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(LogoEgresados)
                                .addGap(18)
                                .addComponent(lblInicio)
                                .addPreferredGap(ComponentPlacement.RELATED, 319, Short.MAX_VALUE)
                                .addComponent(btnCerrarSesion)
                                .addContainerGap()));
        panelLateral.setLayout(gl_panelLateral);
        setLayout(groupLayout);
    }
}
