/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Presentacion;

import Entidad.clsEntidadEvento;
import Entidad.clsEntidadPersona;
import Entidad.clsEntidadPrograma;

/**
 *
 * @author Charlie
 */
public interface IFormulario {
    void seleccionarUsuario(clsEntidadPersona objPersona);
    void seleccionarEvento(clsEntidadEvento objEvento);
}
