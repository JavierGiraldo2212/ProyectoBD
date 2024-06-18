package Functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;

/**
 * Class to handle user sessions.
 * 
 * Author: Javier S
 */
public class UsersSesions {
    public String name = "";
    private static final String bd = "Proyecto_BD";
    private static final String host = "localhost";
    private static final String server = "jdbc:mysql://" + host + "/" + bd
            + "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    
    private Connection connection;

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
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error cerrando la conexión", "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            connection = null;
        }
        return false;
    }

}
