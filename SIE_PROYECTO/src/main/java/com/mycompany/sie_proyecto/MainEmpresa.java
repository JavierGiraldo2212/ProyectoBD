package com.mycompany.sie_proyecto;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import javax.swing.LayoutStyle.ComponentPlacement;

import Functions.UsersSesions;

import java.awt.CardLayout;
import javax.swing.JButton;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class MainEmpresa extends JPanel {

    /**
     * Create the panel.
     */
    public MainEmpresa(JPanel cardPanel, UsersSesions userF) {
        setBackground(new Color(255, 255, 255));

        JPanel panelPpal = new JPanel();
        panelPpal.setBackground(new Color(255, 255, 255));

        JPanel panel = new JPanel();
        panel.setBackground(new Color(255, 255, 255));

        JLabel lblNewLabel = new JLabel("");
        lblNewLabel.setIcon(new ImageIcon(MainEmpresa.class.getResource("/images/fondo#unal.png")));
        lblNewLabel.setBackground(new Color(255, 255, 255));
        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
                                        .addGroup(groupLayout.createSequentialGroup()
                                                .addComponent(panelPpal, GroupLayout.PREFERRED_SIZE, 220,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(ComponentPlacement.RELATED)
                                                .addComponent(panel, GroupLayout.DEFAULT_SIZE, 1045, Short.MAX_VALUE))
                                        .addComponent(lblNewLabel))
                                .addContainerGap()));
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(Alignment.TRAILING)
                        .addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
                                .addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
                                        .addComponent(panelPpal, 0, 0, Short.MAX_VALUE)
                                        .addComponent(panel, GroupLayout.DEFAULT_SIZE, 410, Short.MAX_VALUE))
                                .addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(lblNewLabel)
                                .addContainerGap(22, Short.MAX_VALUE)));

        JLabel LogoEmpresas = new JLabel("");
        LogoEmpresas.setBackground(Color.WHITE);
        LogoEmpresas.setIcon(new ImageIcon(MainEmpresa.class.getResource("/images/LogoEmpresa.png")));

        JButton btnDatEmp = new JButton("");
        btnDatEmp.setBackground(Color.WHITE);
        btnDatEmp.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // datos empresa
            }
        });
        btnDatEmp.setIcon(new ImageIcon(MainEmpresa.class.getResource("/images/Boton_datosEmpresa.png")));

        JButton btnOferta = new JButton("");
        btnOferta.setBackground(new Color(255, 255, 255));
        btnOferta.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // ofertas laborales
            }
        });
        btnOferta.setIcon(new ImageIcon(MainEmpresa.class.getResource("/images/Boton_ofertasLaborales.png")));
        GroupLayout gl_panel = new GroupLayout(panel);
        gl_panel.setHorizontalGroup(
                gl_panel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel.createSequentialGroup()
                                .addContainerGap(742, Short.MAX_VALUE)
                                .addComponent(LogoEmpresas)
                                .addGap(58))
                        .addGroup(gl_panel.createSequentialGroup()
                                .addGap(215)
                                .addComponent(btnDatEmp, GroupLayout.PREFERRED_SIZE, 307, GroupLayout.PREFERRED_SIZE)
                                .addGap(47)
                                .addComponent(btnOferta, GroupLayout.PREFERRED_SIZE, 307, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(169, Short.MAX_VALUE)));
        gl_panel.setVerticalGroup(
                gl_panel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel.createSequentialGroup()
                                .addComponent(LogoEmpresas)
                                .addGap(99)
                                .addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
                                        .addComponent(btnDatEmp)
                                        .addComponent(btnOferta, GroupLayout.PREFERRED_SIZE, 141,
                                                GroupLayout.PREFERRED_SIZE))
                                .addContainerGap(379, Short.MAX_VALUE)));
        panel.setLayout(gl_panel);

        JLabel LogoEgresados = new JLabel("");
        LogoEgresados.setBackground(Color.WHITE);
        LogoEgresados.setIcon(new ImageIcon(MainEmpresa.class.getResource("/images/logo_egresados_unal.png")));

        JButton btnNewButton = new JButton("");
        btnNewButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // INICIO

            }
        });
        btnNewButton.setIcon(new ImageIcon(MainEmpresa.class.getResource("/images/BotonInicio.png")));
        btnNewButton.setBackground(new Color(255, 255, 255));
        btnNewButton.setFont(new Font("Arial Black", Font.PLAIN, 18));

        JButton btnlogout = new JButton("");
        btnlogout.setBackground(new Color(255, 255, 255));
        btnlogout.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                if (userF.logout())
                    cl.show(cardPanel, "mainPanel");
            }
        });
        btnlogout.setIcon(new ImageIcon(MainEmpresa.class.getResource("/images/logout.png")));
        GroupLayout gl_panelPpal = new GroupLayout(panelPpal);
        gl_panelPpal.setHorizontalGroup(
                gl_panelPpal.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelPpal.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelPpal.createParallelGroup(Alignment.LEADING)
                                        .addComponent(btnNewButton)
                                        .addComponent(LogoEgresados)
                                        .addComponent(btnlogout))
                                .addContainerGap(39, Short.MAX_VALUE)));
        gl_panelPpal.setVerticalGroup(
                gl_panelPpal.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelPpal.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(LogoEgresados)
                                .addGap(27)
                                .addComponent(btnNewButton)
                                .addPreferredGap(ComponentPlacement.RELATED, 567, Short.MAX_VALUE)
                                .addComponent(btnlogout)
                                .addContainerGap()));
        panelPpal.setLayout(gl_panelPpal);
        setLayout(groupLayout);

    }
}
