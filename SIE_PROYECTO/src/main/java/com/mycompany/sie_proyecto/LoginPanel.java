package com.mycompany.sie_proyecto;

import java.awt.*;
import javax.swing.*;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.border.EmptyBorder;

public class LoginPanel extends JPanel {
    private JTextField user;
    private JPasswordField password;

    public LoginPanel(JPanel cardPanel) {
        setBackground(Color.WHITE);
        setBorder(new EmptyBorder(5, 5, 5, 5));

        JPanel titlePanel = new JPanel();
        titlePanel.setBackground(Color.WHITE);

        JPanel backgroundPanel = new JPanel();

        JPanel loginPanel = new JPanel();
        loginPanel.setBackground(Color.WHITE);

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
                                .addComponent(loginPanel, GroupLayout.PREFERRED_SIZE, 427, GroupLayout.PREFERRED_SIZE)))
                        .addGroup(layout.createSequentialGroup()
                            .addContainerGap()
                            .addComponent(backPanel, GroupLayout.PREFERRED_SIZE, 124, GroupLayout.PREFERRED_SIZE)))
                    .addGap(10)
                    .addComponent(backgroundPanel, GroupLayout.DEFAULT_SIZE, 787, Short.MAX_VALUE)
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
                            .addComponent(loginPanel, GroupLayout.PREFERRED_SIZE, 212, GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(ComponentPlacement.RELATED, 104, Short.MAX_VALUE)
                            .addComponent(backPanel, GroupLayout.PREFERRED_SIZE, 56, GroupLayout.PREFERRED_SIZE))
                        .addComponent(backgroundPanel, GroupLayout.PREFERRED_SIZE, 639, GroupLayout.PREFERRED_SIZE))
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

        JLabel lbpassword = new JLabel("Contraseña");
        lbpassword.setHorizontalAlignment(SwingConstants.RIGHT);
        lbpassword.setForeground(new Color(74, 74, 74));
        lbpassword.setFont(new Font("Calibri", Font.BOLD | Font.ITALIC, 14));

        password = new JPasswordField();
        password.setColumns(10);

        JButton btnLogin = new JButton("Iniciar sesión");
        btnLogin.setIcon(null);
        btnLogin.setForeground(Color.WHITE);
        btnLogin.setBackground(new Color(56, 181, 235));
        btnLogin.setFont(new Font("Arial", Font.BOLD, 14));
        btnLogin.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null, "Login button clicked");
            }
        });
        GroupLayout gl_loginPanel = new GroupLayout(loginPanel);
        gl_loginPanel.setHorizontalGroup(
            gl_loginPanel.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_loginPanel.createSequentialGroup()
                    .addGroup(gl_loginPanel.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_loginPanel.createSequentialGroup()
                            .addComponent(lbUser, GroupLayout.PREFERRED_SIZE, 110, GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(ComponentPlacement.RELATED, 18, Short.MAX_VALUE)
                            .addComponent(user, GroupLayout.PREFERRED_SIZE, 263, GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(ComponentPlacement.RELATED))
                        .addGroup(gl_loginPanel.createSequentialGroup()
                            .addComponent(lbpassword, GroupLayout.PREFERRED_SIZE, 110, GroupLayout.PREFERRED_SIZE)
                            .addGap(18)
                            .addComponent(password, GroupLayout.PREFERRED_SIZE, 263, GroupLayout.PREFERRED_SIZE)))
                    .addContainerGap(36, GroupLayout.PREFERRED_SIZE))
                .addGroup(gl_loginPanel.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(btnLogin, GroupLayout.PREFERRED_SIZE, 395, GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(22, Short.MAX_VALUE))
        );
        gl_loginPanel.setVerticalGroup(
            gl_loginPanel.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_loginPanel.createSequentialGroup()
                    .addGap(32)
                    .addGroup(gl_loginPanel.createParallelGroup(Alignment.BASELINE)
                        .addComponent(lbUser, GroupLayout.PREFERRED_SIZE, 26, GroupLayout.PREFERRED_SIZE)
                        .addComponent(user, GroupLayout.PREFERRED_SIZE, 29, GroupLayout.PREFERRED_SIZE))
                    .addGap(18)
                    .addGroup(gl_loginPanel.createParallelGroup(Alignment.TRAILING)
                        .addComponent(lbpassword, GroupLayout.PREFERRED_SIZE, 26, GroupLayout.PREFERRED_SIZE)
                        .addComponent(password, GroupLayout.PREFERRED_SIZE, 29, GroupLayout.PREFERRED_SIZE))
                    .addGap(33)
                    .addComponent(btnLogin, GroupLayout.PREFERRED_SIZE, 39, GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(83, Short.MAX_VALUE))
        );
        loginPanel.setLayout(gl_loginPanel);

        JLabel logoEgresados = new JLabel();
        logoEgresados.setIcon(new ImageIcon("D:\\jsgj2\\Pictures\\logo_egresados_unal.png"));

        JLabel title = new JLabel("<html>INGRESO EGRESADOS</html>");
        title.setFont(new Font("Arial", Font.BOLD, 23));
        title.setHorizontalAlignment(SwingConstants.LEFT);
        title.setVerticalAlignment(SwingConstants.CENTER);
        title.setPreferredSize(new Dimension(400, 100));
        title.setMaximumSize(new Dimension(400, Integer.MAX_VALUE));

        JLabel subtitle = new JLabel("<html>Ingrese con las credenciales dadas por el sistema de información de la universidad</html>");
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
        setLayout(layout);

        JLabel backgroundLabel = new JLabel();
        backgroundLabel.setVerticalAlignment(SwingConstants.BOTTOM);
        backgroundLabel.setHorizontalAlignment(SwingConstants.CENTER);
        ImageIcon backgroundImageIcon = new ImageIcon("D:\\jsgj2\\Pictures\\fondo_inicio_2.jpg");
        Image backgroundImage = backgroundImageIcon.getImage();
        Image resizedBackgroundImage = backgroundImage.getScaledInstance(787, 639, Image.SCALE_SMOOTH);
        backgroundLabel.setIcon(new ImageIcon(resizedBackgroundImage));

        GroupLayout gl_backgroundPanel = new GroupLayout(backgroundPanel);
        gl_backgroundPanel.setHorizontalGroup(
            gl_backgroundPanel.createParallelGroup(Alignment.LEADING)
                .addComponent(backgroundLabel, GroupLayout.DEFAULT_SIZE, 787, Short.MAX_VALUE)
        );
        gl_backgroundPanel.setVerticalGroup(
            gl_backgroundPanel.createParallelGroup(Alignment.LEADING)
                .addComponent(backgroundLabel, GroupLayout.DEFAULT_SIZE, 639, Short.MAX_VALUE)
        );
        backgroundPanel.setLayout(gl_backgroundPanel);
    }
}
