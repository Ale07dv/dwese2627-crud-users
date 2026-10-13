
package org.iesalixar.daw2.alejandro.daos;

import org.iesalixar.daw2.alejandro.entities.User;

import java.sql.SQLException;
import java.util.List;

/**
 * Interfaz DAO para gestionar las operaciones CRUD
 * de la tabla users.
 *
 * @author Alejandro Ruiz
 * @version 1.0
 */
public interface UserDAO {

    /**
     * Obtiene todos los usuarios.
     *
     * @return lista de usuarios
     * @throws SQLException si ocurre un error SQL
     */
    List<User> getAll() throws SQLException;

    /**
     * Busca un usuario por su identificador.
     *
     * @param id identificador del usuario
     * @return usuario encontrado o null
     * @throws SQLException si ocurre un error SQL
     */
    User getById(Long id) throws SQLException;

    /**
     * Inserta un nuevo usuario.
     *
     * @param user usuario que se va a insertar
     * @throws SQLException si ocurre un error SQL
     */
    void insert(User user) throws SQLException;

    /**
     * Actualiza un usuario existente.
     *
     * @param user usuario que se va a modificar
     * @throws SQLException si ocurre un error SQL
     */
    void update(User user) throws SQLException;

    /**
     * Elimina un usuario por su identificador.
     *
     * @param id identificador del usuario
     * @throws SQLException si ocurre un error SQL
     */
    void delete(Long id) throws SQLException;

    /**
     * Comprueba si existe un nombre de usuario.
     *
     * @param username nombre de usuario
     * @return true si existe, false si no existe
     * @throws SQLException si ocurre un error SQL
     */
    boolean existsByUsername(String username) throws SQLException;
}
