package com.mycompany.sie_proyecto;

import Functions.UsersSesions;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.GroupLayout;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import javax.swing.SwingConstants;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JOptionPane;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.border.EmptyBorder;

public class LoginDirectivo extends JPanel {

    UsersSesions userF = new UsersSesions();
    private JTextField user;
    private JPasswordField password;

    public LoginDirectivo(JPanel cardPanel) {
        setBackground(Color.WHITE);
        setBorder(new EmptyBorder(5, 5, 5, 5));

        JPanel titlePanel = new JPanel();
        titlePanel.setBackground(Color.WHITE);

        JPanel PanelBackground = new JPanel();

        JPanel LoginEgresado = new JPanel();
        LoginEgresado.setBackground(Color.WHITE);

        JPanel backPanel = new JPanel();
        backPanel.setBackground(Color.WHITE);

        GroupLayout layout = new GroupLayout(this);
        layout.setHorizontalGroup(
            layout.createParallelGroup(Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGroup(layout.createParallelGroup(Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                            .addGap(20)
                            .addGroup(layout.createParallelGroup(Alignment.LEADING)
                                .addComponent(titlePanel, GroupLayout.PREFERRED_SIZE, 431, GroupLayout.PREFERRED_SIZE)
                                .addComponent(LoginEgresado, GroupLayout.PREFERRED_SIZE, 427, GroupLayout.PREFERRED_SIZE)))
                        .addGroup(layout.createSequentialGroup()
                            .addContainerGap()
                            .addComponent(backPanel, GroupLayout.PREFERRED_SIZE, 124, GroupLayout.PREFERRED_SIZE)))
                    .addGap(10)
                    .addComponent(PanelBackground, GroupLayout.DEFAULT_SIZE, 787, Short.MAX_VALUE)
                    .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(Alignment.TRAILING)
                .addGroup(layout.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(layout.createParallelGroup(Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                            .addComponent(titlePanel, GroupLayout.PREFERRED_SIZE, 231, GroupLayout.PREFERRED_SIZE)
                            .addGap(46)
                            .addComponent(LoginEgresado, GroupLayout.PREFERRED_SIZE, 212, GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(ComponentPlacement.RELATED, 104, Short.MAX_VALUE)
                            .addComponent(backPanel, GroupLayout.PREFERRED_SIZE, 56, GroupLayout.PREFERRED_SIZE))
                        .addComponent(PanelBackground, GroupLayout.PREFERRED_SIZE, 639, GroupLayout.PREFERRED_SIZE))
                    .addContainerGap())
        );

        JButton btnBack = new JButton("Regresar");
        btnBack.setFont(new Font("Arial", Font.BOLD, 12));
        btnBack.setBackground(new Color(159, 204, 68));
        btnBack.setForeground(Color.WHITE);
        btnBack.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                cl.show(cardPanel, "mainPanel");
            }
        });

        GroupLayout gl_backPanel = new GroupLayout(backPanel);
        gl_backPanel.setHorizontalGroup(
            gl_backPanel.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_backPanel.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(btnBack, GroupLayout.PREFERRED_SIZE, 97, GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(91, Short.MAX_VALUE))
        );
        gl_backPanel.setVerticalGroup(
            gl_backPanel.createParallelGroup(Alignment.TRAILING)
                .addGroup(gl_backPanel.createSequentialGroup()
                    .addContainerGap(23, Short.MAX_VALUE)
                    .addComponent(btnBack, GroupLayout.PREFERRED_SIZE, 32, GroupLayout.PREFERRED_SIZE)
                    .addContainerGap())
        );
        backPanel.setLayout(gl_backPanel);

        JLabel lbUser = new JLabel("Nombre de usuario");
        lbUser.setHorizontalAlignment(SwingConstants.RIGHT);
        lbUser.setForeground(new Color(74, 74, 74));
        lbUser.setFont(new Font("Calibri", Font.BOLD | Font.ITALIC, 14));

        user = new JTextField();
        user.setFont(new Font("Arial", Font.BOLD, 11));
        user.setColumns(10);

        JLabel lbPassword = new JLabel("Contraseña");
        lbPassword.setHorizontalAlignment(SwingConstants.RIGHT);
        lbPassword.setForeground(new Color(74, 74, 74));
        lbPassword.setFont(new Font("Calibri", Font.BOLD | Font.ITALIC, 14));

        password = new JPasswordField();
        password.setColumns(10);

        JButton btnLogin = new JButton("Iniciar sesión");
        btnLogin.setIcon(null);
        btnLogin.setForeground(Color.WHITE);
        btnLogin.setBackground(new Color(56, 181, 235));
        btnLogin.setFont(new Font("Arial", Font.BOLD, 14));
        btnLogin.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Logic for login button
                CardLayout cl = (CardLayout) cardPanel.getLayout();
                if(userF.login(user.getText(),password.getText(),"rol_ejemplo2")) cl.show(cardPanel, "mainPanel");
            }
        });

        GroupLayout gl_LoginEgresado = new GroupLayout(LoginEgresado);
        gl_LoginEgresado.setHorizontalGroup(
            gl_LoginEgresado.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_LoginEgresado.createSequentialGroup()
                    .addGroup(gl_LoginEgresado.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_LoginEgresado.createSequentialGroup()
                            .addComponent(lbUser, GroupLayout.PREFERRED_SIZE, 110, GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(ComponentPlacement.RELATED, 18, Short.MAX_VALUE)
                            .addComponent(user, GroupLayout.PREFERRED_SIZE, 263, GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(ComponentPlacement.RELATED))
                        .addGroup(gl_LoginEgresado.createSequentialGroup()
                            .addComponent(lbPassword, GroupLayout.PREFERRED_SIZE, 110, GroupLayout.PREFERRED_SIZE)
                            .addGap(18)
                            .addComponent(password, GroupLayout.PREFERRED_SIZE, 263, GroupLayout.PREFERRED_SIZE)))
                    .addContainerGap(36, GroupLayout.PREFERRED_SIZE))
                .addGroup(gl_LoginEgresado.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(btnLogin, GroupLayout.PREFERRED_SIZE, 395, GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(22, Short.MAX_VALUE))
        );
        gl_LoginEgresado.setVerticalGroup(
            gl_LoginEgresado.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_LoginEgresado.createSequentialGroup()
                    .addGap(32)
                    .addGroup(gl_LoginEgresado.createParallelGroup(Alignment.BASELINE)
                        .addComponent(lbUser, GroupLayout.PREFERRED_SIZE, 26, GroupLayout.PREFERRED_SIZE)
                        .addComponent(user, GroupLayout.PREFERRED_SIZE, 29, GroupLayout.PREFERRED_SIZE))
                    .addGap(18)
                    .addGroup(gl_LoginEgresado.createParallelGroup(Alignment.TRAILING)
                        .addComponent(lbPassword, GroupLayout.PREFERRED_SIZE, 26, GroupLayout.PREFERRED_SIZE)
                        .addComponent(password, GroupLayout.PREFERRED_SIZE, 29, GroupLayout.PREFERRED_SIZE))
                    .addGap(33)
                    .addComponent(btnLogin, GroupLayout.PREFERRED_SIZE, 39, GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(ComponentPlacement.RELATED, 9, Short.MAX_VALUE))
        );
        LoginEgresado.setLayout(gl_LoginEgresado);

        JLabel logoEgresados = new JLabel();
        logoEgresados.setIcon(new ImageIcon(getClass().getResource("/images/logo_egresados_unal.png")));

        JLabel title = new JLabel("<html>INGRESO DIRECTIVOS</html>");
        title.setFont(new Font("Arial", Font.BOLD, 23));
        title.setHorizontalAlignment(SwingConstants.LEFT);
        title.setVerticalAlignment(SwingConstants.CENTER);
        title.setPreferredSize(new Dimension(400, 100));
        title.setMaximumSize(new Dimension(400, Integer.MAX_VALUE));

        JLabel subtitle = new JLabel("<html>Ingrese con las credenciales asignadas</html>");
        subtitle.setForeground(new Color(74, 74, 74));
        subtitle.setFont(new Font("Arial", Font.BOLD | Font.ITALIC, 16));

        GroupLayout gl_titlePanel = new GroupLayout(titlePanel);
        gl_titlePanel.setHorizontalGroup(
            gl_titlePanel.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_titlePanel.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(logoEgresados)
                    .addContainerGap(250, Short.MAX_VALUE))
                .addGroup(gl_titlePanel.createSequentialGroup()
                    .addGap(30)
                    .addGroup(gl_titlePanel.createParallelGroup(Alignment.LEADING)
                        .addComponent(title, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                        .addComponent(subtitle, GroupLayout.DEFAULT_SIZE, 400, Short.MAX_VALUE))
                    .addContainerGap())
        );
        gl_titlePanel.setVerticalGroup(
            gl_titlePanel.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_titlePanel.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(logoEgresados)
                    .addGap(61)
                    .addComponent(title, GroupLayout.PREFERRED_SIZE, 53, GroupLayout.PREFERRED_SIZE)
                    .addGap(18)
                    .addComponent(subtitle)
                    .addGap(43))
        );
        titlePanel.setLayout(gl_titlePanel);

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

        setLayout(layout);
    }
}
