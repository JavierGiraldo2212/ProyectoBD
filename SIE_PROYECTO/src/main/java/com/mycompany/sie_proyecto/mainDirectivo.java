package com.mycompany.sie_proyecto;

import java.awt.EventQueue;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import Functions.UsersSesions;

import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;

import java.awt.CardLayout;
import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import java.awt.Font;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class mainDirectivo extends JPanel {

    private JPanel contentPane;

    public mainDirectivo(JPanel cardPanel, UsersSesions userF) {


        RegistroEgresados REg = new RegistroEgresados(userF);
        REg.setLocation(0, 0);
        
        RegistroEmpresas REm = new RegistroEmpresas(userF);
        REm.setLocation(0, 0);

        contentPane = new JPanel();
        contentPane.setBackground(Color.WHITE);
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

        JPanel panelBotones = new JPanel();
        panelBotones.setBackground(Color.WHITE);

        JPanel panelPpal = new JPanel();
        panelPpal.setBackground(Color.WHITE);
        GroupLayout gl_contentPane = new GroupLayout(this);
        gl_contentPane.setHorizontalGroup(
                gl_contentPane.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_contentPane.createSequentialGroup()
                                .addComponent(panelBotones, GroupLayout.PREFERRED_SIZE, 200, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(panelPpal, GroupLayout.DEFAULT_SIZE, 1048, Short.MAX_VALUE)));
        gl_contentPane.setVerticalGroup(
                gl_contentPane.createParallelGroup(Alignment.LEADING)
                        .addComponent(panelBotones, GroupLayout.DEFAULT_SIZE, 672, Short.MAX_VALUE)
                        .addComponent(panelPpal, GroupLayout.DEFAULT_SIZE, 672, Short.MAX_VALUE));

        JLabel lblNewLabel = new JLabel("");
        lblNewLabel.setIcon(new ImageIcon(mainDirectivo.class.getResource("/images/logo_egresados_unal.png")));

        JPanel panel = new JPanel();
        panel.setBackground(Color.WHITE);

        JPanel panel_Botones_Registro = new JPanel();
        panel_Botones_Registro.setBackground(new Color(240, 255, 243));

        JPanel panel_1 = new JPanel();
        panel_1.setBackground(new Color(234, 238, 255));

        JButton btnInfFacultades = new JButton("Información Facultades");
        btnInfFacultades.setBackground(new Color(255, 255, 255));
        btnInfFacultades.setFont(new Font("Arial", Font.BOLD, 11));
        btnInfFacultades.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

            }
        });

        JButton btnNewButton = new JButton("Cerrar Sesión");
        btnNewButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                if (userF.logout()) cl.show(cardPanel, "mainPanel");
            }
        });
        btnNewButton.setBackground(new Color(255, 255, 255));
        btnNewButton.setHorizontalAlignment(SwingConstants.LEFT);
        GroupLayout gl_panelBotones = new GroupLayout(panelBotones);
        gl_panelBotones.setHorizontalGroup(
                gl_panelBotones.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelBotones.createSequentialGroup()
                                .addGroup(gl_panelBotones.createParallelGroup(Alignment.LEADING)
                                        .addGroup(gl_panelBotones.createSequentialGroup()
                                                .addGap(14)
                                                .addComponent(lblNewLabel))
                                        .addGroup(gl_panelBotones.createSequentialGroup()
                                                .addContainerGap()
                                                .addComponent(btnInfFacultades, GroupLayout.DEFAULT_SIZE, 179,
                                                        Short.MAX_VALUE))
                                        .addGroup(gl_panelBotones.createSequentialGroup()
                                                .addContainerGap()
                                                .addGroup(gl_panelBotones.createParallelGroup(Alignment.TRAILING)
                                                        .addComponent(panel_1, Alignment.LEADING, 0, 0, Short.MAX_VALUE)
                                                        .addComponent(panel_Botones_Registro, Alignment.LEADING,
                                                                GroupLayout.PREFERRED_SIZE, 174,
                                                                GroupLayout.PREFERRED_SIZE))
                                                .addPreferredGap(ComponentPlacement.RELATED, 5, Short.MAX_VALUE)))
                                .addGap(11))
                        .addGroup(gl_panelBotones.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(btnNewButton)
                                .addContainerGap(93, Short.MAX_VALUE)));
        gl_panelBotones.setVerticalGroup(
                gl_panelBotones.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelBotones.createSequentialGroup()
                                .addGap(5)
                                .addComponent(lblNewLabel)
                                .addGap(15)
                                .addComponent(panel_Botones_Registro, GroupLayout.PREFERRED_SIZE, 112,
                                        GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(panel_1, GroupLayout.PREFERRED_SIZE, 156, GroupLayout.PREFERRED_SIZE)
                                .addGap(40)
                                .addComponent(btnInfFacultades, GroupLayout.PREFERRED_SIZE, 44,
                                        GroupLayout.PREFERRED_SIZE)
                                .addGap(214)
                                .addComponent(btnNewButton)
                                .addGap(29)));

        JButton btnInfEmp = new JButton("<html>Información empresas</html>");
        btnInfEmp.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

            }
        });
        btnInfEmp.setFont(new Font("Arial", Font.BOLD, 11));
        btnInfEmp.setBackground(Color.WHITE);

        JButton btnInfEg = new JButton("<html>Información egresados</html>");
        btnInfEg.setFont(new Font("Arial", Font.BOLD, 11));
        btnInfEg.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

            }
        });
        btnInfEg.setBackground(Color.WHITE);
        GroupLayout gl_panel_1 = new GroupLayout(panel_1);
        gl_panel_1.setHorizontalGroup(
                gl_panel_1.createParallelGroup(Alignment.TRAILING)
                        .addGroup(gl_panel_1.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panel_1.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(btnInfEg, Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 154,
                                                Short.MAX_VALUE)
                                        .addComponent(btnInfEmp, Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 154,
                                                Short.MAX_VALUE))
                                .addContainerGap()));
        gl_panel_1.setVerticalGroup(
                gl_panel_1.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel_1.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(btnInfEmp, GroupLayout.PREFERRED_SIZE, 57, GroupLayout.PREFERRED_SIZE)
                                .addGap(18)
                                .addComponent(btnInfEg, GroupLayout.DEFAULT_SIZE, 59, Short.MAX_VALUE)
                                .addContainerGap()));
        panel_1.setLayout(gl_panel_1);

        JButton btnRegEg = new JButton("Registro Egresado");
        btnRegEg.setFont(new Font("Arial", Font.BOLD, 11));
        btnRegEg.setBackground(Color.WHITE);
        btnRegEg.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                panel.removeAll();
                panel.add(REg);
                panel.revalidate();
                panel.repaint();
            }
        });

        JButton btnRegEm = new JButton("Registro Empresa");
        btnRegEm.setFont(new Font("Arial", Font.BOLD, 11));
        btnRegEm.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                panel.removeAll();
                panel.add(REm);
                panel.revalidate();
                panel.repaint();
            }
        });
        btnRegEm.setBackground(Color.WHITE);
        GroupLayout gl_panel_Botones_Registro = new GroupLayout(panel_Botones_Registro);
        gl_panel_Botones_Registro.setHorizontalGroup(
                gl_panel_Botones_Registro.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel_Botones_Registro.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panel_Botones_Registro.createParallelGroup(Alignment.LEADING)
                                        .addComponent(btnRegEm, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 154,
                                                Short.MAX_VALUE)
                                        .addComponent(btnRegEg, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 154,
                                                Short.MAX_VALUE))
                                .addContainerGap()));
        gl_panel_Botones_Registro.setVerticalGroup(
                gl_panel_Botones_Registro.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panel_Botones_Registro.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(btnRegEg, GroupLayout.PREFERRED_SIZE, 36, GroupLayout.PREFERRED_SIZE)
                                .addGap(18)
                                .addComponent(btnRegEm, GroupLayout.PREFERRED_SIZE, 36, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(20, Short.MAX_VALUE)));
        panel_Botones_Registro.setLayout(gl_panel_Botones_Registro);
        panelBotones.setLayout(gl_panelBotones);
        ImageIcon imageIcon = new ImageIcon(getClass().getResource("/images/escudo.png"));
        Image image = imageIcon.getImage();
        Image newImage = image.getScaledInstance(1030, 650, Image.SCALE_SMOOTH);

        GroupLayout gl_panelPpal = new GroupLayout(panelPpal);
        gl_panelPpal.setHorizontalGroup(
                gl_panelPpal.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelPpal.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(panel, GroupLayout.DEFAULT_SIZE, 1028, Short.MAX_VALUE)
                                .addContainerGap()));
        gl_panelPpal.setVerticalGroup(
                gl_panelPpal.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelPpal.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(panel, GroupLayout.DEFAULT_SIZE, 649, Short.MAX_VALUE)
                                .addContainerGap()));

        JLabel lbFondo = new JLabel("");
        panel.add(lbFondo);
        lbFondo.setIcon(new ImageIcon(newImage));
        panelPpal.setLayout(gl_panelPpal);
        setLayout(gl_contentPane);
    }
}
