package com.mycompany.sie_proyecto;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.border.EmptyBorder;

public class MainPanel extends JPanel {

    public MainPanel(JPanel cardPanel) {
        setBackground(Color.WHITE);
        setBorder(new EmptyBorder(5, 5, 5, 5));
     
        JPanel panelTitle = new JPanel();
        panelTitle.setBackground(Color.WHITE);

        JPanel PanelBackground = new JPanel();
        
        JPanel panelButtoms = new JPanel();
        panelButtoms.setBackground(Color.WHITE);

        GroupLayout gl_contentPane = new GroupLayout(this);
        gl_contentPane.setHorizontalGroup(
        	gl_contentPane.createParallelGroup(Alignment.LEADING)
        		.addGroup(gl_contentPane.createSequentialGroup()
        			.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
        				.addGroup(gl_contentPane.createSequentialGroup()
        					.addGap(20)
        					.addComponent(panelTitle, GroupLayout.PREFERRED_SIZE, 388, GroupLayout.PREFERRED_SIZE))
        				.addGroup(gl_contentPane.createSequentialGroup()
        					.addGap(50)
        					.addComponent(panelButtoms, GroupLayout.PREFERRED_SIZE, 335, GroupLayout.PREFERRED_SIZE)))
        			.addGap(49)
        			.addComponent(PanelBackground, GroupLayout.DEFAULT_SIZE, 787, Short.MAX_VALUE)
        			.addContainerGap())
        );
        gl_contentPane.setVerticalGroup(
        	gl_contentPane.createParallelGroup(Alignment.LEADING)
        		.addGroup(gl_contentPane.createSequentialGroup()
        			.addContainerGap()
        			.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
        				.addComponent(PanelBackground, GroupLayout.PREFERRED_SIZE, 639, GroupLayout.PREFERRED_SIZE)
        				.addGroup(gl_contentPane.createSequentialGroup()
        					.addComponent(panelTitle, GroupLayout.PREFERRED_SIZE, 194, GroupLayout.PREFERRED_SIZE)
        					.addGap(18)
        					.addComponent(panelButtoms, GroupLayout.PREFERRED_SIZE, 365, GroupLayout.PREFERRED_SIZE)))
        			.addContainerGap(21, Short.MAX_VALUE))
        );
        panelButtoms.setLayout(null);
        
        JButton btnEgresado = new JButton("");
        btnEgresado.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
                    CardLayout cl = (CardLayout) cardPanel.getLayout();
                    cl.show(cardPanel, "loginEgresado");
        	}
        });
        btnEgresado.setForeground(Color.WHITE);
        btnEgresado.setBackground(new Color(255, 255, 255));
        btnEgresado.setIcon(new ImageIcon(getClass().getResource("/images/boton_egresado2.png")));
        btnEgresado.setBounds(10, 11, 303, 105);
        panelButtoms.add(btnEgresado);
        
        JButton btnEmpresa = new JButton("");
        btnEmpresa.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
                    CardLayout cl = (CardLayout) cardPanel.getLayout();
                    cl.show(cardPanel, "loginEmpresa");
        	}
        });
        btnEmpresa.setIcon(new ImageIcon(getClass().getResource("/images/boton_empresa2.png")));
        btnEmpresa.setBackground(Color.WHITE);
        btnEmpresa.setBounds(10, 127, 303, 107);
        panelButtoms.add(btnEmpresa);
        
        JButton btnDirectivo = new JButton("");
        btnDirectivo.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
                    CardLayout cl = (CardLayout) cardPanel.getLayout();
                    cl.show(cardPanel, "loginDirectivo");
        	}
        });//boton_Directivo2
        btnDirectivo.setIcon(new ImageIcon(getClass().getResource("/images/boton_Directivo2.png")));
        btnDirectivo.setBackground(Color.WHITE);
        btnDirectivo.setBounds(10, 245, 303, 105);
        panelButtoms.add(btnDirectivo);

        JLabel Logo_egresados = new JLabel();
        Logo_egresados.setIcon(new ImageIcon(getClass().getResource("/images/logo_egresados_unal.png")));

        JLabel TITULO = new JLabel("<html>SISTEMA DE INFORMACIÓN DE EGRESADOS</html>");
        TITULO.setFont(new Font("Arial", Font.BOLD, 23));
        TITULO.setHorizontalAlignment(SwingConstants.CENTER);
        TITULO.setVerticalAlignment(SwingConstants.CENTER);
        TITULO.setPreferredSize(new Dimension(400, 100));
        TITULO.setMaximumSize(new Dimension(400, Integer.MAX_VALUE));

        JLabel lblNewLabel = new JLabel("Seleccione una de las siguientes opciones\r\n");
        lblNewLabel.setForeground(new Color(74, 74, 74));
        lblNewLabel.setFont(new Font("Arial", Font.BOLD | Font.ITALIC, 16));

        GroupLayout gl_panelTitle = new GroupLayout(panelTitle);
        gl_panelTitle.setHorizontalGroup(
        	gl_panelTitle.createParallelGroup(Alignment.LEADING)
        		.addGroup(gl_panelTitle.createSequentialGroup()
        			.addGroup(gl_panelTitle.createParallelGroup(Alignment.LEADING)
        				.addGroup(gl_panelTitle.createSequentialGroup()
        					.addContainerGap()
        					.addComponent(Logo_egresados))
        				.addGroup(gl_panelTitle.createSequentialGroup()
        					.addGap(30)
        					.addGroup(gl_panelTitle.createParallelGroup(Alignment.LEADING)
        						.addComponent(TITULO, GroupLayout.PREFERRED_SIZE, 354, GroupLayout.PREFERRED_SIZE)
        						.addComponent(lblNewLabel))))
        			.addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        gl_panelTitle.setVerticalGroup(
        	gl_panelTitle.createParallelGroup(Alignment.LEADING)
        		.addGroup(gl_panelTitle.createSequentialGroup()
        			.addContainerGap()
        			.addComponent(Logo_egresados)
        			.addPreferredGap(ComponentPlacement.UNRELATED)
        			.addComponent(TITULO, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
        			.addGap(1)
        			.addComponent(lblNewLabel)
        			.addGap(71))
        );
        panelTitle.setLayout(gl_panelTitle);
        this.setLayout(gl_contentPane);


        JLabel lblNewLabel_1 = new JLabel();
        lblNewLabel_1.setVerticalAlignment(SwingConstants.BOTTOM);
        lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
        ImageIcon imageIcon = new ImageIcon(getClass().getResource("/images/fondo_inicio_2.jpg"));
        Image image = imageIcon.getImage();
        Image newImage = image.getScaledInstance(787, 639, Image.SCALE_SMOOTH);
        lblNewLabel_1.setIcon(new ImageIcon(newImage));

        GroupLayout gl_PanelBackground = new GroupLayout(PanelBackground);
        gl_PanelBackground.setHorizontalGroup(
                gl_PanelBackground.createParallelGroup(Alignment.LEADING)
                        .addComponent(lblNewLabel_1, GroupLayout.DEFAULT_SIZE, 787, Short.MAX_VALUE)
        );
        gl_PanelBackground.setVerticalGroup(
                gl_PanelBackground.createParallelGroup(Alignment.LEADING)
                        .addComponent(lblNewLabel_1, GroupLayout.DEFAULT_SIZE, 639, Short.MAX_VALUE)
        );
        PanelBackground.setLayout(gl_PanelBackground);
    }
}

