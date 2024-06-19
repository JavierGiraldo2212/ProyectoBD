package Functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class UsersSesions {
    public String name = "";
    private static final String bd = "Proyecto_BD";
    private static final String host = "localhost";
    private static final String server = "jdbc:mysql://" + host + "/" + bd
            + "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

    public Connection connection;

    public boolean login(String user, String password, String requiredRole) {
        name = user;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(server, user, password);
            System.out.println("Conexión a base de datos " + bd + " ... OK");

            String roles = getUserRoles(connection, user);
            if (roles != null && !roles.isEmpty()) {
                System.out.println("Los roles del usuario " + user + " son: " + roles);
                if (roles.contains(requiredRole)) {
                    return true;
                } else {
                    JOptionPane.showMessageDialog(null,
                            "El usuario " + user + " no tiene el rol requerido: " + requiredRole,
                            "Error de autorización", JOptionPane.ERROR_MESSAGE);
                    connection.close();
                    return false;
                }
            } else {
                JOptionPane.showMessageDialog(null, "No se pudieron encontrar los roles del usuario " + user,
                        "Error de autorización", JOptionPane.ERROR_MESSAGE);
                connection.close();
                return false;
            }
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, "Error cargando el Driver MySQL JDBC", "Error",
                    JOptionPane.ERROR_MESSAGE);
            return false;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Imposible realizar conexión con " + bd, "Error",
                    JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    private String getUserRoles(Connection connection, String username) {
        StringBuilder roles = new StringBuilder();
        String patternString = "GRANT\\s+((?:`[^`]+`@`[^`]+`,?\\s*)+)\\s+TO\\s+`[^`]+`@`localhost`";
        Pattern pattern = Pattern.compile(patternString);

        try (Statement stmt = connection.createStatement()) {
            String query = "SHOW GRANTS FOR '" + username + "'@'localhost'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                System.out.println(rs.getString(1));
                String grant = rs.getString(1);
                Matcher matcher = pattern.matcher(grant);
                if (matcher.find()) {
                    if (roles.length() > 0) {
                        roles.append(", ");
                    }
                    roles.append(matcher.group(1));
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error obteniendo los roles del usuario", "Error",
                    JOptionPane.ERROR_MESSAGE);
            return null;
        }
        return roles.toString();
    }

    public boolean logout() {
        try {
            if (connection != null && !connection.isClosed()) {
                System.out.println(this.name);
                connection.close();
                System.out.println("Conexión cerrada.");
                name = "";
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error cerrando la conexión", "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            connection = null;
        }
        return false;
    }

    // Método EGRESADO: OFERTAS LABORALES
    public void Vista_OfertasLaborales(DefaultTableModel model) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = this.connection; // Obtener la conexión establecida

            stmt = conn.createStatement(); // Crear una declaración

            String sql = "SELECT * FROM vw_ofertas_laborales"; // Consulta SQL
            rs = stmt.executeQuery(sql); // Ejecutar la consulta

            // Limpiar el modelo de la tabla antes de agregar nuevas filas
            model.setRowCount(0);

            // Procesar los resultados y añadir filas al modelo de la tabla
            while (rs.next()) {
                int noOferta = rs.getInt("No Oferta");
                String empresa = rs.getString("Empresa");
                String estado = rs.getString("Estado");
                double salario = rs.getDouble("Salario");
                String experienciaRequerida = rs.getString("Experiencia requerida");
                String area = rs.getString("Area");
                String tipoContrato = rs.getString("Tipo contrato");
                String telefonoContacto = rs.getString("Telefono contacto");
                String correo = rs.getString("Correo");
                String correoResponsable = rs.getString("Correo responsable");

                Object[] row = { noOferta, empresa, estado, salario, experienciaRequerida, area, tipoContrato,
                        telefonoContacto, correo, correoResponsable };

                model.addRow(row); // Agregar cada fila al modelo de la tabla
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones SQL
        } finally {
            // Cerrar los recursos
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                // No cerrar la conexión aquí, para poder reutilizarla
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepciones al cerrar recursos
            }
        }
    }

    // En UsersSesions.java, modificar el método Vista_OfertasLaborales para soportar filtrado múltiple
public void Vista_OfertasLaboralesFiltrado(DefaultTableModel model, String filtroEmpresa, String filtroEstado, String filtroArea) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = this.connection; // Obtener la conexión establecida
        
        // Consulta SQL base
        String sql = "SELECT * FROM vw_ofertas_laborales WHERE 1=1";

        // Lista para almacenar los parámetros de filtro
        List<Object> params = new ArrayList<>();

        // Construir consulta dinámica con filtros
        if (!filtroEmpresa.isEmpty()) {
            sql += " AND Empresa LIKE ?";
            params.add("%" + filtroEmpresa + "%");
        }
        if (!filtroEstado.isEmpty()) {
            sql += " AND Estado LIKE ?";
            params.add("%" + filtroEstado + "%");
        }
        if (!filtroArea.isEmpty()) {
            sql += " AND Area LIKE ?";
            params.add("%" + filtroArea + "%");
        }

        // Preparar la declaración con la consulta final
        stmt = conn.prepareStatement(sql);

        // Asignar parámetros a la declaración preparada
        for (int i = 0; i < params.size(); i++) {
            stmt.setObject(i + 1, params.get(i));
        }

        rs = stmt.executeQuery(); // Ejecutar la consulta

        // Limpiar el modelo de la tabla antes de agregar nuevas filas
        model.setRowCount(0);

        // Procesar los resultados y añadir filas al modelo de la tabla
        while (rs.next()) {
            int noOferta = rs.getInt("No Oferta");
            String empresa = rs.getString("Empresa");
            String estado = rs.getString("Estado");
            double salario = rs.getDouble("Salario");
            String experienciaRequerida = rs.getString("Experiencia requerida");
            String area = rs.getString("Area");
            String tipoContrato = rs.getString("Tipo contrato");
            String telefonoContacto = rs.getString("Telefono contacto");
            String correo = rs.getString("Correo");
            String correoResponsable = rs.getString("Correo responsable");

            Object[] row = { noOferta, empresa, estado, salario, experienciaRequerida, area, tipoContrato,
                    telefonoContacto, correo, correoResponsable };

            model.addRow(row); // Agregar cada fila al modelo de la tabla
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Manejar excepciones SQL
    } finally {
        // Cerrar los recursos
        try {
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            // No cerrar la conexión aquí, para poder reutilizarla
        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones al cerrar recursos
        }
    }
}


}
