/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package com.mycompany.sie_proyecto;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.JLabel;
import javax.swing.JTextField;
import java.awt.Color;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;

import Functions.UsersSesions;

import javax.swing.GroupLayout.Alignment;

public class ofertasEgresados extends JPanel {

    public ofertasEgresados(JPanel cardPanel, UsersSesions userF) {
        setBackground(Color.WHITE);

        JPanel panelLateral = new JPanel();
        panelLateral.setBackground(Color.WHITE);

        JPanel panelAux = new JPanel();
        panelAux.setBackground(Color.WHITE);
        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(GroupLayout.Alignment.TRAILING)
                        .addGroup(GroupLayout.Alignment.LEADING, groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(panelLateral, GroupLayout.PREFERRED_SIZE, 214, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(panelAux, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE,
                                        Short.MAX_VALUE)
                                .addContainerGap()));
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addGroup(GroupLayout.Alignment.TRAILING, groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(groupLayout.createParallelGroup(GroupLayout.Alignment.TRAILING)
                                        .addComponent(panelAux, GroupLayout.Alignment.LEADING, GroupLayout.DEFAULT_SIZE,
                                                698, Short.MAX_VALUE)
                                        .addComponent(panelLateral, GroupLayout.Alignment.LEADING,
                                                GroupLayout.DEFAULT_SIZE, 698, Short.MAX_VALUE))
                                .addContainerGap()));

        JLabel lblTitulo = new JLabel("");
        lblTitulo.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/Egresados/LogoEgresados.png")));
        lblTitulo.setBackground(Color.WHITE);

        JLabel lblSubtitulo = new JLabel("OFERTAS LABORALES");
        lblSubtitulo.setFont(new Font("Arial Black", Font.PLAIN, 27));
        lblSubtitulo.setHorizontalAlignment(SwingConstants.CENTER);

        JPanel panelBuscador = new JPanel();
        // Creación del modelo de tabla con nombres de columnas

        JPanel panelTabla = new JPanel();

        GroupLayout gl_panelAux = new GroupLayout(panelAux);
        gl_panelAux.setHorizontalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addComponent(panelBuscador, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE,
                                                Short.MAX_VALUE)
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 600,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(ComponentPlacement.RELATED, 20, Short.MAX_VALUE)
                                                .addComponent(lblSubtitulo, GroupLayout.PREFERRED_SIZE, 399,
                                                        GroupLayout.PREFERRED_SIZE))
                                        .addComponent(panelTabla, GroupLayout.DEFAULT_SIZE, 1019, Short.MAX_VALUE))
                                .addContainerGap()));
        gl_panelAux.setVerticalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 91,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(lblSubtitulo, GroupLayout.PREFERRED_SIZE, 72,
                                                GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(panelBuscador, GroupLayout.PREFERRED_SIZE, 207,
                                        GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(panelTabla, GroupLayout.DEFAULT_SIZE, 363, Short.MAX_VALUE)
                                .addContainerGap()));
        panelAux.setLayout(gl_panelAux);

        JButton btnBusqueda = new JButton("");
        btnBusqueda.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Acción del botón de búsqueda
            }
        });
        btnBusqueda.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/BotonBusqueda.png")));
        btnBusqueda.setBackground(Color.WHITE);
        GroupLayout gl_panelBuscador = new GroupLayout(panelBuscador);
        panelBuscador.setLayout(gl_panelBuscador);
        gl_panelBuscador.setHorizontalGroup(
                gl_panelBuscador.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addGroup(GroupLayout.Alignment.TRAILING, gl_panelBuscador.createSequentialGroup()
                                .addContainerGap(912, Short.MAX_VALUE)
                                .addComponent(btnBusqueda, GroupLayout.PREFERRED_SIZE, 107,
                                        GroupLayout.PREFERRED_SIZE)));
        gl_panelBuscador.setVerticalGroup(
                gl_panelBuscador.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addGroup(gl_panelBuscador.createSequentialGroup()
                                .addComponent(btnBusqueda, GroupLayout.PREFERRED_SIZE, 53, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(154, Short.MAX_VALUE)));

        JLabel LogoEgresados = new JLabel("");
        LogoEgresados.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/logo_egresados_unal.png")));
        LogoEgresados.setBackground(Color.WHITE);

        JButton btnCerrarSesion = new JButton("");
        btnCerrarSesion.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Acción del botón de cerrar sesión
            }
        });
        btnCerrarSesion.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/logout.png")));
        btnCerrarSesion.setBackground(Color.WHITE);

        JButton btnBack = new JButton("");
        btnBack.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Acción del botón de retroceso
            }
        });
        btnBack.setBackground(Color.WHITE);
        btnBack.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/botonBack.png")));
        GroupLayout gl_panelLateral = new GroupLayout(panelLateral);
        gl_panelLateral.setHorizontalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelLateral.createParallelGroup(Alignment.LEADING)
                                        .addComponent(btnCerrarSesion)
                                        .addComponent(btnBack, GroupLayout.PREFERRED_SIZE, 123,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(LogoEgresados))
                                .addContainerGap(33, Short.MAX_VALUE)));
        gl_panelLateral.setVerticalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(LogoEgresados)
                                .addGap(275)
                                .addComponent(btnBack, GroupLayout.PREFERRED_SIZE, 42, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.RELATED, 244, Short.MAX_VALUE)
                                .addComponent(btnCerrarSesion, GroupLayout.PREFERRED_SIZE, 35,
                                        GroupLayout.PREFERRED_SIZE)
                                .addGap(60)));
        panelLateral.setLayout(gl_panelLateral);

        // Configuración del diseño principal del panel
        setLayout(groupLayout);
    }
}
