
package Egresado;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.SwingConstants;
import javax.swing.JTable;
import javax.swing.JScrollPane;
import javax.swing.table.DefaultTableModel;

import Functions.UsersSesions;

import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.Choice;

public class OfertasEgresados extends JPanel {

        private JTextField textEmpresa;
        private final Choice choiceEstado = new Choice();
        private JTextField textArea;

        private JTable table;
        private DefaultTableModel tableModel;

        public OfertasEgresados(JPanel cardPanel, UsersSesions userF) {
                setBackground(Color.WHITE);

                // Configure the Choice 'choiceEstado' with desired options
                choiceEstado.add("");
                choiceEstado.add("En definicion");
                choiceEstado.add("Convocatoria abierta");
                choiceEstado.add("En seleccion");
                choiceEstado.add("Finalizada");
                choiceEstado.add("Cancelada");

                JPanel panelLateral = new JPanel();
                panelLateral.setBackground(Color.WHITE);

                JPanel panelAux = new JPanel();
                panelAux.setBackground(Color.WHITE);
                GroupLayout groupLayout = new GroupLayout(this);
                setLayout(groupLayout);

                JLabel lblTitulo = new JLabel("");
                lblTitulo.setIcon(new ImageIcon(
                                OfertasEgresados.class.getResource("/images/Egresados/LogoEgresados.png")));
                lblTitulo.setBackground(Color.WHITE);

                JLabel lblSubtitulo = new JLabel("OFERTAS LABORALES");
                lblSubtitulo.setFont(new Font("Arial Black", Font.PLAIN, 27));
                lblSubtitulo.setHorizontalAlignment(SwingConstants.CENTER);

                JPanel panelBuscador = new JPanel();

                JPanel panelTabla = new JPanel();
                panelTabla.setLayout(new BorderLayout());

                // Crear un modelo de tabla no editable
                tableModel = new DefaultTableModel(
                                new Object[] { "No Oferta", "Empresa", "Estado", "Salario", "Experiencia Requerida",
                                                "Area", "Tipo Contrato", "Telefono Contacto", "Correo",
                                                "Correo Responsable" },
                                0) {
                        @Override
                        public boolean isCellEditable(int row, int column) {
                                return false; // Hacer todas las celdas no editables
                        }
                };

                table = new JTable(tableModel);
                JScrollPane scrollPane = new JScrollPane(table);
                panelTabla.add(scrollPane, BorderLayout.CENTER);

                GroupLayout gl_panelAux = new GroupLayout(panelAux);
                panelAux.setLayout(gl_panelAux);
                gl_panelAux.setHorizontalGroup(
                                gl_panelAux.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(gl_panelAux.createParallelGroup(
                                                                                GroupLayout.Alignment.LEADING)
                                                                                .addComponent(panelBuscador,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                Short.MAX_VALUE)
                                                                                .addGroup(gl_panelAux
                                                                                                .createSequentialGroup()
                                                                                                .addComponent(lblTitulo,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                600,
                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                .addPreferredGap(
                                                                                                                ComponentPlacement.RELATED,
                                                                                                                20,
                                                                                                                Short.MAX_VALUE)
                                                                                                .addComponent(lblSubtitulo,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                399,
                                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                                .addComponent(panelTabla,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                1019, Short.MAX_VALUE))
                                                                .addContainerGap()));
                gl_panelAux.setVerticalGroup(
                                gl_panelAux.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(gl_panelAux.createParallelGroup(
                                                                                GroupLayout.Alignment.LEADING)
                                                                                .addComponent(lblTitulo,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                91,
                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                .addComponent(lblSubtitulo,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                72,
                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                .addPreferredGap(ComponentPlacement.RELATED)
                                                                .addComponent(panelBuscador, GroupLayout.PREFERRED_SIZE,
                                                                                207, GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                                                .addComponent(panelTabla, GroupLayout.DEFAULT_SIZE, 363,
                                                                                Short.MAX_VALUE)
                                                                .addContainerGap()));

                JButton btnBusqueda = new JButton("");
                btnBusqueda.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // Acción del botón de búsqueda
                                String filtroEmpresa = textEmpresa.getText().trim();
                                String filtroEstado = choiceEstado.getSelectedItem();
                                String filtroArea = textArea.getText().trim();

                                // Llamar al método en UsersSesions para obtener los resultados filtrados
                                userF.Vista_OfertasLaboralesFiltrado(tableModel, filtroEmpresa, filtroEstado,
                                                filtroArea);

                        }
                });
                btnBusqueda.setIcon(new ImageIcon(OfertasEgresados.class.getResource("/images/BotonBusqueda.png")));
                btnBusqueda.setBackground(Color.WHITE);
                btnBusqueda.setBorderPainted(false);

                JLabel lblEmpresaFiltro = new JLabel("Filtrar por empresa");
                lblEmpresaFiltro.setFont(new Font("Arial Black", Font.PLAIN, 20));

                JLabel lblFiltroEstado = new JLabel("Filtrar por estado");
                lblFiltroEstado.setFont(new Font("Arial Black", Font.PLAIN, 20));

                JLabel lblFiltroArea = new JLabel("Filtrar por área");
                lblFiltroArea.setFont(new Font("Arial Black", Font.PLAIN, 20));

                textEmpresa = new JTextField();
                textEmpresa.setColumns(10);

                

                textArea = new JTextField();
                textArea.setColumns(10);
                JButton btnSollicitud = new JButton("");
                btnSollicitud.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // ACCIÓN SOLICITAR
                                int selectedRow = table.getSelectedRow();

                                if (selectedRow != -1) {
                                        // Obtener el valor de la primera columna (índice 0) de la fila seleccionada
                                        Object firstColumnValue = table.getValueAt(selectedRow, 0);

                                        // Imprimir el valor de la primera columna
                                        userF.aplicarOfertaLaboral((int) firstColumnValue);

                                        System.out.println("Valor de la primera columna: " + firstColumnValue);

                                } else {
                                        System.out.println("No se ha seleccionado ninguna fila.");
                                }
                        }
                });
                btnSollicitud.setIcon(
                                new ImageIcon(getClass().getResource("/images/Egresados/BotonPostular.png")));
                btnSollicitud.setBackground(Color.WHITE);
                btnSollicitud.setBorderPainted(false);
                GroupLayout gl_panelBuscador = new GroupLayout(panelBuscador);
                panelBuscador.setBackground(Color.WHITE);
                gl_panelBuscador.setHorizontalGroup(
                                gl_panelBuscador.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelBuscador.createSequentialGroup()
                                                                .addGap(34)
                                                                .addGroup(gl_panelBuscador
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addGroup(gl_panelBuscador
                                                                                                .createSequentialGroup()
                                                                                                .addComponent(lblFiltroArea,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                209,
                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                .addGap(10)
                                                                                                .addComponent(textArea,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                222,
                                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                                .addGroup(gl_panelBuscador
                                                                                                .createSequentialGroup()
                                                                                                .addGroup(gl_panelBuscador
                                                                                                                .createParallelGroup(
                                                                                                                                Alignment.LEADING)
                                                                                                                .addComponent(lblEmpresaFiltro)
                                                                                                                .addComponent(lblFiltroEstado))
                                                                                                .addGap(10)
                                                                                                .addGroup(gl_panelBuscador
                                                                                                                .createParallelGroup(
                                                                                                                                Alignment.TRAILING)
                                                                                                                .addComponent(choiceEstado,
                                                                                                                                0,
                                                                                                                                0,
                                                                                                                                Short.MAX_VALUE)
                                                                                                                .addComponent(textEmpresa,
                                                                                                                                Alignment.LEADING,
                                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                                222,
                                                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                                                .addPreferredGap(
                                                                                                                ComponentPlacement.RELATED,
                                                                                                                437,
                                                                                                                Short.MAX_VALUE)
                                                                                                .addGroup(gl_panelBuscador
                                                                                                                .createParallelGroup(
                                                                                                                                Alignment.TRAILING)
                                                                                                                .addComponent(btnBusqueda,
                                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                                107,
                                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                                .addComponent(btnSollicitud,
                                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                                107,
                                                                                                                                GroupLayout.PREFERRED_SIZE))))));
                gl_panelBuscador.setVerticalGroup(
                                gl_panelBuscador.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelBuscador.createSequentialGroup()
                                                                .addGap(11)
                                                                .addGroup(gl_panelBuscador
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addGroup(gl_panelBuscador
                                                                                                .createSequentialGroup()
                                                                                                .addGap(17)
                                                                                                .addComponent(lblEmpresaFiltro))
                                                                                .addGroup(gl_panelBuscador
                                                                                                .createSequentialGroup()
                                                                                                .addGap(17)
                                                                                                .addComponent(textEmpresa,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                25,
                                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                                .addComponent(btnBusqueda,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                53,
                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                .addGroup(gl_panelBuscador
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addGroup(gl_panelBuscador
                                                                                                .createSequentialGroup()
                                                                                                .addGroup(gl_panelBuscador
                                                                                                                .createParallelGroup(
                                                                                                                                Alignment.LEADING)
                                                                                                                .addGroup(gl_panelBuscador
                                                                                                                                .createSequentialGroup()
                                                                                                                                .addGap(25)
                                                                                                                                .addComponent(lblFiltroEstado))
                                                                                                                .addGroup(gl_panelBuscador
                                                                                                                                .createSequentialGroup()
                                                                                                                                .addGap(4)
                                                                                                                                .addComponent(choiceEstado,
                                                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                                                74,
                                                                                                                                                GroupLayout.PREFERRED_SIZE)))
                                                                                                .addPreferredGap(
                                                                                                                ComponentPlacement.UNRELATED)
                                                                                                .addGroup(gl_panelBuscador
                                                                                                                .createParallelGroup(
                                                                                                                                Alignment.LEADING)
                                                                                                                .addComponent(lblFiltroArea)
                                                                                                                .addComponent(textArea,
                                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                                25,
                                                                                                                                GroupLayout.PREFERRED_SIZE)))
                                                                                .addGroup(gl_panelBuscador
                                                                                                .createSequentialGroup()
                                                                                                .addPreferredGap(
                                                                                                                ComponentPlacement.RELATED)
                                                                                                .addComponent(btnSollicitud,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                61,
                                                                                                                GroupLayout.PREFERRED_SIZE)))
                                                                .addContainerGap(26, Short.MAX_VALUE)));
                panelBuscador.setLayout(gl_panelBuscador);

                JLabel LogoEgresados = new JLabel("");
                LogoEgresados.setIcon(
                                new ImageIcon(OfertasEgresados.class.getResource("/images/logo_egresados_unal.png")));
                LogoEgresados.setBackground(Color.WHITE);

                JButton btnCerrarSesion = new JButton("");
                btnCerrarSesion.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // Acción del botón de cerrar sesión
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                if (userF.logout())
                                        cl.show(cardPanel, "mainPanel");
                        }
                });
                btnCerrarSesion.setIcon(new ImageIcon(OfertasEgresados.class.getResource("/images/logout.png")));
                btnCerrarSesion.setBackground(Color.WHITE);
                btnCerrarSesion.setBorderPainted(false);

                JButton btnBack = new JButton("");
                btnBack.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // Acción del botón de retroceso
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                cl.show(cardPanel, "mainEgresado");
                        }
                });
                btnBack.setBackground(Color.WHITE);
                btnBack.setIcon(new ImageIcon(OfertasEgresados.class.getResource("/images/botonBack.png")));
                btnBack.setBorderPainted(false);
                GroupLayout gl_panelLateral = new GroupLayout(panelLateral);
                panelLateral.setLayout(gl_panelLateral);
                gl_panelLateral.setHorizontalGroup(
                                gl_panelLateral.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(gl_panelLateral.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(gl_panelLateral.createParallelGroup(
                                                                                GroupLayout.Alignment.LEADING)
                                                                                .addComponent(btnCerrarSesion)
                                                                                .addComponent(btnBack,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                123,
                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                .addComponent(LogoEgresados))
                                                                .addContainerGap(33, Short.MAX_VALUE)));
                gl_panelLateral.setVerticalGroup(
                                gl_panelLateral.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(gl_panelLateral.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(LogoEgresados)
                                                                .addGap(275)
                                                                .addComponent(btnBack, GroupLayout.PREFERRED_SIZE, 42,
                                                                                GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED, 244,
                                                                                Short.MAX_VALUE)
                                                                .addComponent(btnCerrarSesion,
                                                                                GroupLayout.PREFERRED_SIZE, 35,
                                                                                GroupLayout.PREFERRED_SIZE)
                                                                .addGap(60)));

                // Configuración del diseño principal del panel
                groupLayout.setHorizontalGroup(
                                groupLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(groupLayout.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(panelLateral, GroupLayout.PREFERRED_SIZE,
                                                                                214, GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED)
                                                                .addComponent(panelAux, GroupLayout.DEFAULT_SIZE,
                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                Short.MAX_VALUE)
                                                                .addContainerGap()));
                groupLayout.setVerticalGroup(
                                groupLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(groupLayout.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(groupLayout.createParallelGroup(
                                                                                GroupLayout.Alignment.TRAILING)
                                                                                .addComponent(panelAux,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                Short.MAX_VALUE)
                                                                                .addComponent(panelLateral,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                Short.MAX_VALUE))
                                                                .addContainerGap()));
        }
}
