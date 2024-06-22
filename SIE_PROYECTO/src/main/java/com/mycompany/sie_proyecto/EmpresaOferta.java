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
import java.sql.Connection;

public class EmpresaOferta extends JPanel {
    private JPanel panelAux;
    private Connection connection;

    public EmpresaOferta(JPanel cardPanel, UsersSesions userF) {
        setBackground(Color.WHITE);
        this.connection = userF.getConnection(); // Obtener la conexión
        if (this.connection == null) {
            System.err.println("La conexión es null en EmpresaOferta.");
        }

        OfertaCrear ofertaCrear = new OfertaCrear(userF);
        ofertaCrear.setLocation(0, 0);
        ofertaCrear.setSize(1045, 708);

        OfertaActualizar ofertaActualizar = new OfertaActualizar(userF);
        ofertaActualizar.setLocation(0, 0);
        ofertaActualizar.setSize(1045, 708);

        JPanel panelLateral = new JPanel();
        panelLateral.setBackground(Color.WHITE);

        panelAux = new JPanel();
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
        Titulo.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/ofertaLaboral.png")));
        Titulo.setBackground(Color.WHITE);

        JButton btnCreate = new JButton("");
        btnCreate.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // CREATE OFFER
                panelAux.removeAll();
                OfertaCrear ofertaCrear = new OfertaCrear(userF); // Usar la conexión
                ofertaCrear.setLocation(0, 0);
                ofertaCrear.setSize(1045, 708);
                panelAux.add(ofertaCrear);
                panelAux.revalidate();
                panelAux.repaint();
            }
        });
        btnCreate.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/Create_offer.png")));
        btnCreate.setBackground(Color.WHITE);

        JButton btnUpdate = new JButton("");
        btnUpdate.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // UPDATE OFFER
                panelAux.removeAll();
                OfertaActualizar ofertaActualizar = new OfertaActualizar(userF); // Usar la conexión
                ofertaActualizar.setLocation(0, 0);
                ofertaActualizar.setSize(1045, 708);
                panelAux.add(ofertaActualizar);
                panelAux.revalidate();
                panelAux.repaint();
            }
        });
        btnUpdate.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/Update_offer.png")));
        btnUpdate.setBackground(Color.WHITE);

        GroupLayout gl_panelAux = new GroupLayout(panelAux);
        gl_panelAux.setHorizontalGroup(
                gl_panelAux.createParallelGroup(Alignment.TRAILING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap(259, Short.MAX_VALUE)
                                .addComponent(Titulo, GroupLayout.PREFERRED_SIZE, 518, GroupLayout.PREFERRED_SIZE)
                                .addGap(258))
                        .addGroup(Alignment.LEADING, gl_panelAux.createSequentialGroup()
                                .addGap(221)
                                .addComponent(btnCreate, GroupLayout.PREFERRED_SIZE, 289, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(btnUpdate, GroupLayout.PREFERRED_SIZE, 289, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(226, Short.MAX_VALUE)));
        gl_panelAux.setVerticalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(Titulo)
                                .addGap(113)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(btnCreate)
                                        .addComponent(btnUpdate, GroupLayout.PREFERRED_SIZE, 261,
                                                GroupLayout.PREFERRED_SIZE))
                                .addContainerGap(204, Short.MAX_VALUE)));
        panelAux.setLayout(gl_panelAux);

        JLabel LogoEgresados = new JLabel("");
        LogoEgresados.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/logo_egresados_unal.png")));
        LogoEgresados.setBackground(Color.WHITE);

        JButton btnBack = new JButton("");
        btnBack.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // go back
                resetPanelAux(); // Call the reset method before going back
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                cl.show(cardPanel, "mainEmpresa");
            }
        });
        btnBack.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/botonBack.png")));
        btnBack.setBackground(Color.WHITE);

        JButton btnNewButton = new JButton("");
        btnNewButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                if (userF.logout()) {
                    resetPanelAux(); // Call the reset method before logging out
                    cl.show(cardPanel, "mainPanel");
                }
            }
        });
        btnNewButton.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/logout.png")));
        btnNewButton.setBackground(Color.WHITE);

        GroupLayout gl_panelLateral = new GroupLayout(panelLateral);
        gl_panelLateral.setHorizontalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelLateral.createParallelGroup(Alignment.LEADING)
                                        .addComponent(LogoEgresados)
                                        .addComponent(btnBack)
                                        .addComponent(btnNewButton))
                                .addContainerGap(33, Short.MAX_VALUE)));
        gl_panelLateral.setVerticalGroup(
                gl_panelLateral.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelLateral.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(LogoEgresados)
                                .addGap(245)
                                .addComponent(btnBack)
                                .addPreferredGap(ComponentPlacement.RELATED, 287, Short.MAX_VALUE)
                                .addComponent(btnNewButton)
                                .addGap(40)));
        panelLateral.setLayout(gl_panelLateral);
        setLayout(groupLayout);
    }

    // Method to reset the panelAux to its initial state
    private void resetPanelAux() {
        panelAux.removeAll();

        JLabel Titulo = new JLabel("");
        Titulo.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/ofertaLaboral.png")));
        Titulo.setBackground(Color.WHITE);

        JButton btnCreate = new JButton("");
        btnCreate.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // CREATE OFFER
                panelAux.removeAll();
                UsersSesions userF;
                OfertaCrear ofertaCrear = new OfertaCrear(userF);
                ofertaCrear.setSize(1045, 708);
                panelAux.add(ofertaCrear);
                panelAux.revalidate();
                panelAux.repaint();
            }
        });
        btnCreate.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/Create_offer.png")));
        btnCreate.setBackground(Color.WHITE);

        JButton btnUpdate = new JButton("");
        btnUpdate.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // UPDATE OFFER
                panelAux.removeAll();
                OfertaActualizar ofertaActualizar = new OfertaActualizar(userF); // Usar la conexión
                ofertaActualizar.setLocation(0, 0);
                ofertaActualizar.setSize(1045, 708);
                panelAux.add(ofertaActualizar);
                panelAux.revalidate();
                panelAux.repaint();
            }
        });
        btnUpdate.setIcon(new ImageIcon(EmpresaOferta.class.getResource("/images/Update_offer.png")));
        btnUpdate.setBackground(Color.WHITE);

        GroupLayout gl_panelAux = new GroupLayout(panelAux);
        gl_panelAux.setHorizontalGroup(
                gl_panelAux.createParallelGroup(Alignment.TRAILING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap(259, Short.MAX_VALUE)
                                .addComponent(Titulo, GroupLayout.PREFERRED_SIZE, 518, GroupLayout.PREFERRED_SIZE)
                                .addGap(258))
                        .addGroup(Alignment.LEADING, gl_panelAux.createSequentialGroup()
                                .addGap(221)
                                .addComponent(btnCreate, GroupLayout.PREFERRED_SIZE, 289, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(btnUpdate, GroupLayout.PREFERRED_SIZE, 289, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(226, Short.MAX_VALUE)));
        gl_panelAux.setVerticalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(Titulo)
                                .addGap(113)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(btnCreate)
                                        .addComponent(btnUpdate, GroupLayout.PREFERRED_SIZE, 261,
                                                GroupLayout.PREFERRED_SIZE))
                                .addContainerGap(204, Short.MAX_VALUE)));
        panelAux.setLayout(gl_panelAux);
        panelAux.revalidate();
        panelAux.repaint();
    }
}