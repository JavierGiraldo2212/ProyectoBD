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
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.table.DefaultTableModel;

import Functions.UsersSesions;

import javax.swing.JTable;
import javax.swing.JTabbedPane;

public class EventosEgresado extends JPanel {
    private JTable tableEventos;
    private DefaultTableModel tableModel;

    /**
     * Create the panel.
     */
    public EventosEgresado(JPanel cardPanel, UsersSesions userF) {
        setBackground(new Color(255, 255, 255));

        JPanel panelLateral = new JPanel();
        panelLateral.setBackground(Color.WHITE);

        JPanel panelInfo = new JPanel();
        panelInfo.setBackground(Color.WHITE);
        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(panelLateral, GroupLayout.PREFERRED_SIZE, 229, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(panelInfo, GroupLayout.DEFAULT_SIZE, 1021, Short.MAX_VALUE)
                                .addContainerGap()));
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(Alignment.TRAILING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(panelInfo, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 698,
                                                Short.MAX_VALUE)
                                        .addComponent(panelLateral, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 698,
                                                Short.MAX_VALUE))
                                .addContainerGap()));

        JLabel lblTitulo = new JLabel("");
        lblTitulo.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitulo.setIcon(new ImageIcon(getClass().getResource("/images/Egresados/LogoEgresados.png")));
        lblTitulo.setBackground(Color.WHITE);

        JLabel lblSubtitulo = new JLabel("REGISTRO DE EVENTOS");
        lblSubtitulo.setHorizontalAlignment(SwingConstants.RIGHT);
        lblSubtitulo.setFont(new Font("Arial Black", Font.PLAIN, 27));

        JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
        GroupLayout gl_panelInfo = new GroupLayout(panelInfo);
        gl_panelInfo.setHorizontalGroup(
                gl_panelInfo.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelInfo.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelInfo.createParallelGroup(Alignment.LEADING)
                                        .addComponent(tabbedPane, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 993,
                                                Short.MAX_VALUE)
                                        .addGroup(gl_panelInfo.createSequentialGroup()
                                                .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 359,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(ComponentPlacement.RELATED, 196, Short.MAX_VALUE)
                                                .addComponent(lblSubtitulo, GroupLayout.PREFERRED_SIZE, 438,
                                                        GroupLayout.PREFERRED_SIZE)))
                                .addGap(18)));
        gl_panelInfo.setVerticalGroup(
                gl_panelInfo.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelInfo.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(gl_panelInfo.createParallelGroup(Alignment.TRAILING)
                                        .addComponent(lblSubtitulo, GroupLayout.PREFERRED_SIZE, 57,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addComponent(lblTitulo, GroupLayout.PREFERRED_SIZE, 64,
                                                GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(ComponentPlacement.RELATED, 63, Short.MAX_VALUE)
                                .addComponent(tabbedPane, GroupLayout.PREFERRED_SIZE, 549, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap()));

        // Crear instancias de los paneles para las pestañas
        JPanel registroPanel = new Registro(userF); // Usar tu clase regsitro
        JPanel borradoPanel = new Borrado(userF);
        

        // Agregar las pestañas al tabbedPane
        tabbedPane.addTab("Registro de Eventos", null, registroPanel, "Buscar eventos para registrarme");
        tabbedPane.addTab("Mis eventos", null, borradoPanel, "Eventos en los que estoy registrado");

        panelInfo.setLayout(gl_panelInfo);
        panelLateral.setLayout(null);

        JLabel LogosEgresados = new JLabel("");
        LogosEgresados.setIcon(new ImageIcon(getClass().getResource("/images/logo_egresados_unal.png")));
        LogosEgresados.setBackground(Color.WHITE);
        LogosEgresados.setBounds(10, 11, 158, 26);
        panelLateral.add(LogosEgresados);

        JButton btnLogOut = new JButton("");
        btnLogOut.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // LOGOUT
                // Perform logout
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
                // VOLVER MAIN EGRESADO
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                cl.show(cardPanel, "mainEgresado");
            }
        });
        btnBack.setBackground(Color.WHITE);
        btnBack.setIcon(new ImageIcon(getClass().getResource("/images/botonBack.png")));
        btnBack.setBounds(99, 277, 120, 42);
        panelLateral.add(btnBack);
        setLayout(groupLayout);

        
    }

    
}
